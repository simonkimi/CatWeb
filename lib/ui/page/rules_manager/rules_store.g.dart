// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rules_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RulesStore on RulesStoreBase, Store {
  final _$siteNameAtom = Atom(name: 'RulesStoreBase.siteName');

  @override
  String get siteName {
    _$siteNameAtom.reportRead();
    return super.siteName;
  }

  @override
  set siteName(String value) {
    _$siteNameAtom.reportWrite(value, super.siteName, () {
      super.siteName = value;
    });
  }

  final _$baseUrlAtom = Atom(name: 'RulesStoreBase.baseUrl');

  @override
  String get baseUrl {
    _$baseUrlAtom.reportRead();
    return super.baseUrl;
  }

  @override
  set baseUrl(String value) {
    _$baseUrlAtom.reportWrite(value, super.baseUrl, () {
      super.baseUrl = value;
    });
  }

  final _$cookiesAtom = Atom(name: 'RulesStoreBase.cookies');

  @override
  String get cookies {
    _$cookiesAtom.reportRead();
    return super.cookies;
  }

  @override
  set cookies(String value) {
    _$cookiesAtom.reportWrite(value, super.cookies, () {
      super.cookies = value;
    });
  }

  final _$headersAtom = Atom(name: 'RulesStoreBase.headers');

  @override
  String get headers {
    _$headersAtom.reportRead();
    return super.headers;
  }

  @override
  set headers(String value) {
    _$headersAtom.reportWrite(value, super.headers, () {
      super.headers = value;
    });
  }

  final _$needCookiesAtom = Atom(name: 'RulesStoreBase.needCookies');

  @override
  bool get needCookies {
    _$needCookiesAtom.reportRead();
    return super.needCookies;
  }

  @override
  set needCookies(bool value) {
    _$needCookiesAtom.reportWrite(value, super.needCookies, () {
      super.needCookies = value;
    });
  }

  @override
  String toString() {
    return '''
siteName: ${siteName},
baseUrl: ${baseUrl},
cookies: ${cookies},
headers: ${headers},
needCookies: ${needCookies}
    ''';
  }
}
