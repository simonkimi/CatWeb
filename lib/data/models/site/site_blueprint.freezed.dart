// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_blueprint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SiteBlueprint _$SiteBlueprintFromJson(Map<String, dynamic> json) {
  return _SiteBlueMap.fromJson(json);
}

/// @nodoc
mixin _$SiteBlueprint {
  String get name;
  String get baseUrl;
  String get loginUrl;
  String get loginCookieReg;
  String get loginCookieDescription;
  String get version;
  String get upgradeUrl;
  String get flag;
  String get readme;
  List<RegField> get headers;
  List<RegField> get cookies;
  List<ParserModel> get parserList;
  List<SitePageRule> get pageList;

  /// Create a copy of SiteBlueprint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SiteBlueprintCopyWith<SiteBlueprint> get copyWith =>
      _$SiteBlueprintCopyWithImpl<SiteBlueprint>(
          this as SiteBlueprint, _$identity);

  /// Serializes this SiteBlueprint to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SiteBlueprint &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.loginUrl, loginUrl) ||
                other.loginUrl == loginUrl) &&
            (identical(other.loginCookieReg, loginCookieReg) ||
                other.loginCookieReg == loginCookieReg) &&
            (identical(other.loginCookieDescription, loginCookieDescription) ||
                other.loginCookieDescription == loginCookieDescription) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.upgradeUrl, upgradeUrl) ||
                other.upgradeUrl == upgradeUrl) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.readme, readme) || other.readme == readme) &&
            const DeepCollectionEquality().equals(other.headers, headers) &&
            const DeepCollectionEquality().equals(other.cookies, cookies) &&
            const DeepCollectionEquality()
                .equals(other.parserList, parserList) &&
            const DeepCollectionEquality().equals(other.pageList, pageList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      baseUrl,
      loginUrl,
      loginCookieReg,
      loginCookieDescription,
      version,
      upgradeUrl,
      flag,
      readme,
      const DeepCollectionEquality().hash(headers),
      const DeepCollectionEquality().hash(cookies),
      const DeepCollectionEquality().hash(parserList),
      const DeepCollectionEquality().hash(pageList));

  @override
  String toString() {
    return 'SiteBlueprint(name: $name, baseUrl: $baseUrl, loginUrl: $loginUrl, loginCookieReg: $loginCookieReg, loginCookieDescription: $loginCookieDescription, version: $version, upgradeUrl: $upgradeUrl, flag: $flag, readme: $readme, headers: $headers, cookies: $cookies, parserList: $parserList, pageList: $pageList)';
  }
}

/// @nodoc
abstract mixin class $SiteBlueprintCopyWith<$Res> {
  factory $SiteBlueprintCopyWith(
          SiteBlueprint value, $Res Function(SiteBlueprint) _then) =
      _$SiteBlueprintCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String baseUrl,
      String loginUrl,
      String loginCookieReg,
      String loginCookieDescription,
      String version,
      String upgradeUrl,
      String flag,
      String readme,
      List<RegField> headers,
      List<RegField> cookies,
      List<ParserModel> parserList,
      List<SitePageRule> pageList});
}

/// @nodoc
class _$SiteBlueprintCopyWithImpl<$Res>
    implements $SiteBlueprintCopyWith<$Res> {
  _$SiteBlueprintCopyWithImpl(this._self, this._then);

  final SiteBlueprint _self;
  final $Res Function(SiteBlueprint) _then;

  /// Create a copy of SiteBlueprint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? baseUrl = null,
    Object? loginUrl = null,
    Object? loginCookieReg = null,
    Object? loginCookieDescription = null,
    Object? version = null,
    Object? upgradeUrl = null,
    Object? flag = null,
    Object? readme = null,
    Object? headers = null,
    Object? cookies = null,
    Object? parserList = null,
    Object? pageList = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baseUrl: null == baseUrl
          ? _self.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      loginUrl: null == loginUrl
          ? _self.loginUrl
          : loginUrl // ignore: cast_nullable_to_non_nullable
              as String,
      loginCookieReg: null == loginCookieReg
          ? _self.loginCookieReg
          : loginCookieReg // ignore: cast_nullable_to_non_nullable
              as String,
      loginCookieDescription: null == loginCookieDescription
          ? _self.loginCookieDescription
          : loginCookieDescription // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      upgradeUrl: null == upgradeUrl
          ? _self.upgradeUrl
          : upgradeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      flag: null == flag
          ? _self.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      readme: null == readme
          ? _self.readme
          : readme // ignore: cast_nullable_to_non_nullable
              as String,
      headers: null == headers
          ? _self.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as List<RegField>,
      cookies: null == cookies
          ? _self.cookies
          : cookies // ignore: cast_nullable_to_non_nullable
              as List<RegField>,
      parserList: null == parserList
          ? _self.parserList
          : parserList // ignore: cast_nullable_to_non_nullable
              as List<ParserModel>,
      pageList: null == pageList
          ? _self.pageList
          : pageList // ignore: cast_nullable_to_non_nullable
              as List<SitePageRule>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SiteBlueMap extends SiteBlueprint {
  const _SiteBlueMap(
      {this.name = '',
      this.baseUrl = '',
      this.loginUrl = '',
      this.loginCookieReg = '',
      this.loginCookieDescription = '',
      this.version = '',
      this.upgradeUrl = '',
      this.flag = '',
      this.readme = '',
      final List<RegField> headers = const [],
      final List<RegField> cookies = const [],
      final List<ParserModel> parserList = const [],
      final List<SitePageRule> pageList = const []})
      : _headers = headers,
        _cookies = cookies,
        _parserList = parserList,
        _pageList = pageList,
        super._();
  factory _SiteBlueMap.fromJson(Map<String, dynamic> json) =>
      _$SiteBlueMapFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String baseUrl;
  @override
  @JsonKey()
  final String loginUrl;
  @override
  @JsonKey()
  final String loginCookieReg;
  @override
  @JsonKey()
  final String loginCookieDescription;
  @override
  @JsonKey()
  final String version;
  @override
  @JsonKey()
  final String upgradeUrl;
  @override
  @JsonKey()
  final String flag;
  @override
  @JsonKey()
  final String readme;
  final List<RegField> _headers;
  @override
  @JsonKey()
  List<RegField> get headers {
    if (_headers is EqualUnmodifiableListView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_headers);
  }

  final List<RegField> _cookies;
  @override
  @JsonKey()
  List<RegField> get cookies {
    if (_cookies is EqualUnmodifiableListView) return _cookies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cookies);
  }

  final List<ParserModel> _parserList;
  @override
  @JsonKey()
  List<ParserModel> get parserList {
    if (_parserList is EqualUnmodifiableListView) return _parserList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parserList);
  }

  final List<SitePageRule> _pageList;
  @override
  @JsonKey()
  List<SitePageRule> get pageList {
    if (_pageList is EqualUnmodifiableListView) return _pageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pageList);
  }

  /// Create a copy of SiteBlueprint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SiteBlueMapCopyWith<_SiteBlueMap> get copyWith =>
      __$SiteBlueMapCopyWithImpl<_SiteBlueMap>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SiteBlueMapToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SiteBlueMap &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.loginUrl, loginUrl) ||
                other.loginUrl == loginUrl) &&
            (identical(other.loginCookieReg, loginCookieReg) ||
                other.loginCookieReg == loginCookieReg) &&
            (identical(other.loginCookieDescription, loginCookieDescription) ||
                other.loginCookieDescription == loginCookieDescription) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.upgradeUrl, upgradeUrl) ||
                other.upgradeUrl == upgradeUrl) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.readme, readme) || other.readme == readme) &&
            const DeepCollectionEquality().equals(other._headers, _headers) &&
            const DeepCollectionEquality().equals(other._cookies, _cookies) &&
            const DeepCollectionEquality()
                .equals(other._parserList, _parserList) &&
            const DeepCollectionEquality().equals(other._pageList, _pageList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      baseUrl,
      loginUrl,
      loginCookieReg,
      loginCookieDescription,
      version,
      upgradeUrl,
      flag,
      readme,
      const DeepCollectionEquality().hash(_headers),
      const DeepCollectionEquality().hash(_cookies),
      const DeepCollectionEquality().hash(_parserList),
      const DeepCollectionEquality().hash(_pageList));

  @override
  String toString() {
    return 'SiteBlueprint(name: $name, baseUrl: $baseUrl, loginUrl: $loginUrl, loginCookieReg: $loginCookieReg, loginCookieDescription: $loginCookieDescription, version: $version, upgradeUrl: $upgradeUrl, flag: $flag, readme: $readme, headers: $headers, cookies: $cookies, parserList: $parserList, pageList: $pageList)';
  }
}

/// @nodoc
abstract mixin class _$SiteBlueMapCopyWith<$Res>
    implements $SiteBlueprintCopyWith<$Res> {
  factory _$SiteBlueMapCopyWith(
          _SiteBlueMap value, $Res Function(_SiteBlueMap) _then) =
      __$SiteBlueMapCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String baseUrl,
      String loginUrl,
      String loginCookieReg,
      String loginCookieDescription,
      String version,
      String upgradeUrl,
      String flag,
      String readme,
      List<RegField> headers,
      List<RegField> cookies,
      List<ParserModel> parserList,
      List<SitePageRule> pageList});
}

/// @nodoc
class __$SiteBlueMapCopyWithImpl<$Res> implements _$SiteBlueMapCopyWith<$Res> {
  __$SiteBlueMapCopyWithImpl(this._self, this._then);

  final _SiteBlueMap _self;
  final $Res Function(_SiteBlueMap) _then;

  /// Create a copy of SiteBlueprint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? baseUrl = null,
    Object? loginUrl = null,
    Object? loginCookieReg = null,
    Object? loginCookieDescription = null,
    Object? version = null,
    Object? upgradeUrl = null,
    Object? flag = null,
    Object? readme = null,
    Object? headers = null,
    Object? cookies = null,
    Object? parserList = null,
    Object? pageList = null,
  }) {
    return _then(_SiteBlueMap(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baseUrl: null == baseUrl
          ? _self.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      loginUrl: null == loginUrl
          ? _self.loginUrl
          : loginUrl // ignore: cast_nullable_to_non_nullable
              as String,
      loginCookieReg: null == loginCookieReg
          ? _self.loginCookieReg
          : loginCookieReg // ignore: cast_nullable_to_non_nullable
              as String,
      loginCookieDescription: null == loginCookieDescription
          ? _self.loginCookieDescription
          : loginCookieDescription // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      upgradeUrl: null == upgradeUrl
          ? _self.upgradeUrl
          : upgradeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      flag: null == flag
          ? _self.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      readme: null == readme
          ? _self.readme
          : readme // ignore: cast_nullable_to_non_nullable
              as String,
      headers: null == headers
          ? _self._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as List<RegField>,
      cookies: null == cookies
          ? _self._cookies
          : cookies // ignore: cast_nullable_to_non_nullable
              as List<RegField>,
      parserList: null == parserList
          ? _self._parserList
          : parserList // ignore: cast_nullable_to_non_nullable
              as List<ParserModel>,
      pageList: null == pageList
          ? _self._pageList
          : pageList // ignore: cast_nullable_to_non_nullable
              as List<SitePageRule>,
    ));
  }
}

// dart format on
