import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:test/test.dart';

void main() {
  const host = 'api.e-hentai.org';

  test('all matches every host and ignores pattern', () {
    const rule = DomainValueRule(
      mode: DomainMatchMode.all,
      pattern: '(',
      value: 'a=1',
    );

    expect(rule.matchesHost(host), isTrue);
    expect(rule.matchesHost(''), isTrue);
  });

  test('exact matches the whole host ignoring case', () {
    const rule = DomainValueRule(
      mode: DomainMatchMode.exact,
      pattern: 'E-Hentai.ORG',
    );

    expect(rule.matchesHost('e-hentai.org'), isTrue);
    expect(rule.matchesHost(host), isFalse);
    expect(rule.matchesHost('e-hentai.org.evil.test'), isFalse);
  });

  test('suffix matches the domain and its subdomains', () {
    const rule = DomainValueRule(
      mode: DomainMatchMode.suffix,
      pattern: '.e-hentai.org.',
    );

    expect(rule.matchesHost('e-hentai.org'), isTrue);
    expect(rule.matchesHost(host), isTrue);
    expect(rule.matchesHost('not-e-hentai.org'), isFalse);
    expect(rule.matchesHost('e-hentai.org.evil.test'), isFalse);
    expect(
      const DomainValueRule(mode: DomainMatchMode.suffix).matchesHost(host),
      isFalse,
    );
  });

  test('keyword matches a case-insensitive substring', () {
    const rule = DomainValueRule(
      mode: DomainMatchMode.keyword,
      pattern: 'Hentai',
    );

    expect(rule.matchesHost(host), isTrue);
    expect(rule.matchesHost('example.test'), isFalse);
    expect(
      const DomainValueRule(
        mode: DomainMatchMode.keyword,
        pattern: ' ',
      ).matchesHost(host),
      isFalse,
    );
  });

  test('regex matches the host and rejects invalid patterns', () {
    expect(
      const DomainValueRule(
        mode: DomainMatchMode.regex,
        pattern: r'^api\.e-hentai\.org$',
      ).matchesHost(host),
      isTrue,
    );
    expect(
      const DomainValueRule(
        mode: DomainMatchMode.regex,
        pattern: r'example\.test',
      ).matchesHost(host),
      isFalse,
    );
    expect(
      const DomainValueRule(
        mode: DomainMatchMode.regex,
        pattern: '*',
      ).matchesHost('other.test'),
      isTrue,
    );
    expect(
      const DomainValueRule(
        mode: DomainMatchMode.regex,
        pattern: '(',
      ).matchesHost(host),
      isFalse,
    );
    expect(
      const DomainValueRule(mode: DomainMatchMode.regex).matchesHost(host),
      isFalse,
    );
  });

  test('missing mode in json stays a host regex', () {
    final rule = DomainValueRule.fromJson({
      'pattern': r'^api\.e-hentai\.org$',
      'value': 'nw=1',
    });

    expect(rule.mode, DomainMatchMode.regex);
    expect(rule.matchesHost(host), isTrue);
    expect(rule.toJson(), {
      'mode': 'regex',
      'pattern': r'^api\.e-hentai\.org$',
      'value': 'nw=1',
    });
  });
}
