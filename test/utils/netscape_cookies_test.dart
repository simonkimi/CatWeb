import 'package:catweb/utils/netscape_cookies.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:test/test.dart';

void main() {
  const sample = '''
# Netscape HTTP Cookie File
# https://curl.haxx.se/rfc/cookie_spec.html
# This is a generated file! Do not edit.

.e-hentai.org	TRUE	/	FALSE	0	ipb_session_id	xxxxxxxx
.e-hentai.org	TRUE	/	FALSE	1827229243	ipb_member_id	xxxxxx
.e-hentai.org	TRUE	/	FALSE	1827229243	ipb_pass_hash	xxxxxxxxxxxxxxx
.e-hentai.org	TRUE	/	FALSE	1827229246	sk	xxxxxxxxxxx
.e-hentai.org	TRUE	/	FALSE	1827229246	star	xxxxxxxxxxxx
.e-hentai.org	TRUE	/	FALSE	1827229246	hath_perks	xxxxxxxxxxxxxxxxx
#HttpOnly_.e-hentai.org	TRUE	/	TRUE	1827229246	igneous	secret
e-hentai.org	FALSE	/	FALSE	1827229246	host_only	abc
.e-hentai.org	TRUE	/	FALSE	1	expired	old
''';

  test('parses Netscape cookies and skips comments and expired rows', () {
    final cookies = parseNetscapeCookies(sample);

    expect(cookies.map((item) => item.cookie.name), [
      'ipb_session_id',
      'ipb_member_id',
      'ipb_pass_hash',
      'sk',
      'star',
      'hath_perks',
      'igneous',
      'host_only',
    ]);

    final session = cookies.first.cookie;
    expect(session.value, 'xxxxxxxx');
    expect(session.expires, isNull);
    expect(session.domain, '.e-hentai.org');
    expect(session.httpOnly, isFalse);
    expect(session.secure, isFalse);

    final httpOnly = cookies.singleWhere(
      (item) => item.cookie.name == 'igneous',
    );
    expect(httpOnly.cookie.httpOnly, isTrue);
    expect(httpOnly.cookie.secure, isTrue);
    expect(httpOnly.host, 'e-hentai.org');

    final hostOnly = cookies.singleWhere(
      (item) => item.cookie.name == 'host_only',
    );
    expect(hostOnly.cookie.domain, isNull);
    expect(hostOnly.host, 'e-hentai.org');
  });

  test('accepts whitespace-separated cookie rows', () {
    const spaced = '''
.e-hentai.org    TRUE    /    FALSE    1827229243    ipb_member_id    xxxxxx
''';
    final cookies = parseNetscapeCookies(spaced);
    expect(cookies, hasLength(1));
    expect(cookies.single.cookie.name, 'ipb_member_id');
    expect(cookies.single.cookie.value, 'xxxxxx');
  });

  test('persists imported cookies for later requests', () async {
    final storage = _MemoryStorage();
    final imported = await saveNetscapeCookies(
      PersistCookieJar(storage: storage),
      sample,
    );
    expect(imported, 8);

    final jar = PersistCookieJar(storage: storage);
    final cookies = await jar.loadForRequest(
      Uri.parse('https://e-hentai.org/'),
    );
    expect(
      Map.fromEntries(
        cookies.map((cookie) => MapEntry(cookie.name, cookie.value)),
      ),
      {
        'ipb_session_id': 'xxxxxxxx',
        'ipb_member_id': 'xxxxxx',
        'ipb_pass_hash': 'xxxxxxxxxxxxxxx',
        'sk': 'xxxxxxxxxxx',
        'star': 'xxxxxxxxxxxx',
        'hath_perks': 'xxxxxxxxxxxxxxxxx',
        'igneous': 'secret',
        'host_only': 'abc',
      },
    );

    final subdomain = await jar.loadForRequest(
      Uri.parse('https://forums.e-hentai.org/'),
    );
    expect(subdomain.map((cookie) => cookie.name), contains('ipb_member_id'));
    expect(
      subdomain.map((cookie) => cookie.name),
      isNot(contains('host_only')),
    );

    await saveNetscapeCookies(
      PersistCookieJar(storage: storage),
      '.e-hentai.org\tTRUE\t/\tFALSE\t1827229246\tsk\treplaced\n',
    );
    final reloaded = await PersistCookieJar(storage: storage)
        .loadForRequest(Uri.parse('https://e-hentai.org/'));
    expect(
      reloaded.singleWhere((cookie) => cookie.name == 'sk').value,
      'replaced',
    );
    expect(
      reloaded.singleWhere((cookie) => cookie.name == 'ipb_member_id').value,
      'xxxxxx',
    );
  });
}

final class _MemoryStorage implements Storage {
  final _values = <String, String>{};

  @override
  Future<void> init(bool persistSession, bool ignoreExpires) async {}

  @override
  Future<void> delete(String key) async {
    _values.remove(key);
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    for (final key in keys) {
      _values.remove(key);
    }
  }

  @override
  Future<String?> read(String key) async => _values[key];

  @override
  Future<void> write(String key, String value) async {
    _values[key] = value;
  }
}
