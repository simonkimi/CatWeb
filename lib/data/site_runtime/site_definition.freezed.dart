// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_definition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SiteDefinition {

 int get schemaVersion; String get id; String get name; String get baseUrl; SiteOptions get options; List<ParserRule> get parsers; List<EndpointRule> get endpoints;
/// Create a copy of SiteDefinition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteDefinitionCopyWith<SiteDefinition> get copyWith => _$SiteDefinitionCopyWithImpl<SiteDefinition>(this as SiteDefinition, _$identity);

  /// Serializes this SiteDefinition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteDefinition&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.options, options) || other.options == options)&&const DeepCollectionEquality().equals(other.parsers, parsers)&&const DeepCollectionEquality().equals(other.endpoints, endpoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schemaVersion,id,name,baseUrl,options,const DeepCollectionEquality().hash(parsers),const DeepCollectionEquality().hash(endpoints));

@override
String toString() {
  return 'SiteDefinition(schemaVersion: $schemaVersion, id: $id, name: $name, baseUrl: $baseUrl, options: $options, parsers: $parsers, endpoints: $endpoints)';
}


}

/// @nodoc
abstract mixin class $SiteDefinitionCopyWith<$Res>  {
  factory $SiteDefinitionCopyWith(SiteDefinition value, $Res Function(SiteDefinition) _then) = _$SiteDefinitionCopyWithImpl;
@useResult
$Res call({
 int schemaVersion, String id, String name, String baseUrl, SiteOptions options, List<ParserRule> parsers, List<EndpointRule> endpoints
});


$SiteOptionsCopyWith<$Res> get options;

}
/// @nodoc
class _$SiteDefinitionCopyWithImpl<$Res>
    implements $SiteDefinitionCopyWith<$Res> {
  _$SiteDefinitionCopyWithImpl(this._self, this._then);

  final SiteDefinition _self;
  final $Res Function(SiteDefinition) _then;

/// Create a copy of SiteDefinition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schemaVersion = null,Object? id = null,Object? name = null,Object? baseUrl = null,Object? options = null,Object? parsers = null,Object? endpoints = null,}) {
  return _then(_self.copyWith(
schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as SiteOptions,parsers: null == parsers ? _self.parsers : parsers // ignore: cast_nullable_to_non_nullable
as List<ParserRule>,endpoints: null == endpoints ? _self.endpoints : endpoints // ignore: cast_nullable_to_non_nullable
as List<EndpointRule>,
  ));
}
/// Create a copy of SiteDefinition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SiteOptionsCopyWith<$Res> get options {
  
  return $SiteOptionsCopyWith<$Res>(_self.options, (value) {
    return _then(_self.copyWith(options: value));
  });
}
}


/// Adds pattern-matching-related methods to [SiteDefinition].
extension SiteDefinitionPatterns on SiteDefinition {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SiteDefinition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SiteDefinition() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SiteDefinition value)  $default,){
final _that = this;
switch (_that) {
case _SiteDefinition():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SiteDefinition value)?  $default,){
final _that = this;
switch (_that) {
case _SiteDefinition() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int schemaVersion,  String id,  String name,  String baseUrl,  SiteOptions options,  List<ParserRule> parsers,  List<EndpointRule> endpoints)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SiteDefinition() when $default != null:
return $default(_that.schemaVersion,_that.id,_that.name,_that.baseUrl,_that.options,_that.parsers,_that.endpoints);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int schemaVersion,  String id,  String name,  String baseUrl,  SiteOptions options,  List<ParserRule> parsers,  List<EndpointRule> endpoints)  $default,) {final _that = this;
switch (_that) {
case _SiteDefinition():
return $default(_that.schemaVersion,_that.id,_that.name,_that.baseUrl,_that.options,_that.parsers,_that.endpoints);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int schemaVersion,  String id,  String name,  String baseUrl,  SiteOptions options,  List<ParserRule> parsers,  List<EndpointRule> endpoints)?  $default,) {final _that = this;
switch (_that) {
case _SiteDefinition() when $default != null:
return $default(_that.schemaVersion,_that.id,_that.name,_that.baseUrl,_that.options,_that.parsers,_that.endpoints);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SiteDefinition extends SiteDefinition {
  const _SiteDefinition({this.schemaVersion = 0, this.id = '', this.name = '', this.baseUrl = '', this.options = const SiteOptions(), final  List<ParserRule> parsers = const <ParserRule>[], final  List<EndpointRule> endpoints = const <EndpointRule>[]}): _parsers = parsers,_endpoints = endpoints,super._();
  factory _SiteDefinition.fromJson(Map<String, dynamic> json) => _$SiteDefinitionFromJson(json);

@override@JsonKey() final  int schemaVersion;
@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String baseUrl;
@override@JsonKey() final  SiteOptions options;
 final  List<ParserRule> _parsers;
@override@JsonKey() List<ParserRule> get parsers {
  if (_parsers is EqualUnmodifiableListView) return _parsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parsers);
}

 final  List<EndpointRule> _endpoints;
@override@JsonKey() List<EndpointRule> get endpoints {
  if (_endpoints is EqualUnmodifiableListView) return _endpoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_endpoints);
}


/// Create a copy of SiteDefinition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiteDefinitionCopyWith<_SiteDefinition> get copyWith => __$SiteDefinitionCopyWithImpl<_SiteDefinition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SiteDefinitionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SiteDefinition&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.options, options) || other.options == options)&&const DeepCollectionEquality().equals(other._parsers, _parsers)&&const DeepCollectionEquality().equals(other._endpoints, _endpoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schemaVersion,id,name,baseUrl,options,const DeepCollectionEquality().hash(_parsers),const DeepCollectionEquality().hash(_endpoints));

@override
String toString() {
  return 'SiteDefinition(schemaVersion: $schemaVersion, id: $id, name: $name, baseUrl: $baseUrl, options: $options, parsers: $parsers, endpoints: $endpoints)';
}


}

/// @nodoc
abstract mixin class _$SiteDefinitionCopyWith<$Res> implements $SiteDefinitionCopyWith<$Res> {
  factory _$SiteDefinitionCopyWith(_SiteDefinition value, $Res Function(_SiteDefinition) _then) = __$SiteDefinitionCopyWithImpl;
@override @useResult
$Res call({
 int schemaVersion, String id, String name, String baseUrl, SiteOptions options, List<ParserRule> parsers, List<EndpointRule> endpoints
});


@override $SiteOptionsCopyWith<$Res> get options;

}
/// @nodoc
class __$SiteDefinitionCopyWithImpl<$Res>
    implements _$SiteDefinitionCopyWith<$Res> {
  __$SiteDefinitionCopyWithImpl(this._self, this._then);

  final _SiteDefinition _self;
  final $Res Function(_SiteDefinition) _then;

/// Create a copy of SiteDefinition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schemaVersion = null,Object? id = null,Object? name = null,Object? baseUrl = null,Object? options = null,Object? parsers = null,Object? endpoints = null,}) {
  return _then(_SiteDefinition(
schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as SiteOptions,parsers: null == parsers ? _self._parsers : parsers // ignore: cast_nullable_to_non_nullable
as List<ParserRule>,endpoints: null == endpoints ? _self._endpoints : endpoints // ignore: cast_nullable_to_non_nullable
as List<EndpointRule>,
  ));
}

/// Create a copy of SiteDefinition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SiteOptionsCopyWith<$Res> get options {
  
  return $SiteOptionsCopyWith<$Res>(_self.options, (value) {
    return _then(_self.copyWith(options: value));
  });
}
}


/// @nodoc
mixin _$RegexValueRule {

 String get pattern; String get value;
/// Create a copy of RegexValueRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegexValueRuleCopyWith<RegexValueRule> get copyWith => _$RegexValueRuleCopyWithImpl<RegexValueRule>(this as RegexValueRule, _$identity);

  /// Serializes this RegexValueRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegexValueRule&&(identical(other.pattern, pattern) || other.pattern == pattern)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pattern,value);

@override
String toString() {
  return 'RegexValueRule(pattern: $pattern, value: $value)';
}


}

/// @nodoc
abstract mixin class $RegexValueRuleCopyWith<$Res>  {
  factory $RegexValueRuleCopyWith(RegexValueRule value, $Res Function(RegexValueRule) _then) = _$RegexValueRuleCopyWithImpl;
@useResult
$Res call({
 String pattern, String value
});




}
/// @nodoc
class _$RegexValueRuleCopyWithImpl<$Res>
    implements $RegexValueRuleCopyWith<$Res> {
  _$RegexValueRuleCopyWithImpl(this._self, this._then);

  final RegexValueRule _self;
  final $Res Function(RegexValueRule) _then;

/// Create a copy of RegexValueRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pattern = null,Object? value = null,}) {
  return _then(_self.copyWith(
pattern: null == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RegexValueRule].
extension RegexValueRulePatterns on RegexValueRule {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegexValueRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegexValueRule() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegexValueRule value)  $default,){
final _that = this;
switch (_that) {
case _RegexValueRule():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegexValueRule value)?  $default,){
final _that = this;
switch (_that) {
case _RegexValueRule() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String pattern,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegexValueRule() when $default != null:
return $default(_that.pattern,_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String pattern,  String value)  $default,) {final _that = this;
switch (_that) {
case _RegexValueRule():
return $default(_that.pattern,_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String pattern,  String value)?  $default,) {final _that = this;
switch (_that) {
case _RegexValueRule() when $default != null:
return $default(_that.pattern,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegexValueRule implements RegexValueRule {
  const _RegexValueRule({this.pattern = '', this.value = ''});
  factory _RegexValueRule.fromJson(Map<String, dynamic> json) => _$RegexValueRuleFromJson(json);

@override@JsonKey() final  String pattern;
@override@JsonKey() final  String value;

/// Create a copy of RegexValueRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegexValueRuleCopyWith<_RegexValueRule> get copyWith => __$RegexValueRuleCopyWithImpl<_RegexValueRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegexValueRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegexValueRule&&(identical(other.pattern, pattern) || other.pattern == pattern)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pattern,value);

@override
String toString() {
  return 'RegexValueRule(pattern: $pattern, value: $value)';
}


}

/// @nodoc
abstract mixin class _$RegexValueRuleCopyWith<$Res> implements $RegexValueRuleCopyWith<$Res> {
  factory _$RegexValueRuleCopyWith(_RegexValueRule value, $Res Function(_RegexValueRule) _then) = __$RegexValueRuleCopyWithImpl;
@override @useResult
$Res call({
 String pattern, String value
});




}
/// @nodoc
class __$RegexValueRuleCopyWithImpl<$Res>
    implements _$RegexValueRuleCopyWith<$Res> {
  __$RegexValueRuleCopyWithImpl(this._self, this._then);

  final _RegexValueRule _self;
  final $Res Function(_RegexValueRule) _then;

/// Create a copy of RegexValueRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pattern = null,Object? value = null,}) {
  return _then(_RegexValueRule(
pattern: null == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SiteOptions {

 String get flags; String get loginUrl; String get loginCookiePattern; String get loginCookieDescription; List<RegexValueRule> get headers; List<RegexValueRule> get cookies;
/// Create a copy of SiteOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteOptionsCopyWith<SiteOptions> get copyWith => _$SiteOptionsCopyWithImpl<SiteOptions>(this as SiteOptions, _$identity);

  /// Serializes this SiteOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteOptions&&(identical(other.flags, flags) || other.flags == flags)&&(identical(other.loginUrl, loginUrl) || other.loginUrl == loginUrl)&&(identical(other.loginCookiePattern, loginCookiePattern) || other.loginCookiePattern == loginCookiePattern)&&(identical(other.loginCookieDescription, loginCookieDescription) || other.loginCookieDescription == loginCookieDescription)&&const DeepCollectionEquality().equals(other.headers, headers)&&const DeepCollectionEquality().equals(other.cookies, cookies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flags,loginUrl,loginCookiePattern,loginCookieDescription,const DeepCollectionEquality().hash(headers),const DeepCollectionEquality().hash(cookies));

@override
String toString() {
  return 'SiteOptions(flags: $flags, loginUrl: $loginUrl, loginCookiePattern: $loginCookiePattern, loginCookieDescription: $loginCookieDescription, headers: $headers, cookies: $cookies)';
}


}

/// @nodoc
abstract mixin class $SiteOptionsCopyWith<$Res>  {
  factory $SiteOptionsCopyWith(SiteOptions value, $Res Function(SiteOptions) _then) = _$SiteOptionsCopyWithImpl;
@useResult
$Res call({
 String flags, String loginUrl, String loginCookiePattern, String loginCookieDescription, List<RegexValueRule> headers, List<RegexValueRule> cookies
});




}
/// @nodoc
class _$SiteOptionsCopyWithImpl<$Res>
    implements $SiteOptionsCopyWith<$Res> {
  _$SiteOptionsCopyWithImpl(this._self, this._then);

  final SiteOptions _self;
  final $Res Function(SiteOptions) _then;

/// Create a copy of SiteOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flags = null,Object? loginUrl = null,Object? loginCookiePattern = null,Object? loginCookieDescription = null,Object? headers = null,Object? cookies = null,}) {
  return _then(_self.copyWith(
flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as String,loginUrl: null == loginUrl ? _self.loginUrl : loginUrl // ignore: cast_nullable_to_non_nullable
as String,loginCookiePattern: null == loginCookiePattern ? _self.loginCookiePattern : loginCookiePattern // ignore: cast_nullable_to_non_nullable
as String,loginCookieDescription: null == loginCookieDescription ? _self.loginCookieDescription : loginCookieDescription // ignore: cast_nullable_to_non_nullable
as String,headers: null == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as List<RegexValueRule>,cookies: null == cookies ? _self.cookies : cookies // ignore: cast_nullable_to_non_nullable
as List<RegexValueRule>,
  ));
}

}


/// Adds pattern-matching-related methods to [SiteOptions].
extension SiteOptionsPatterns on SiteOptions {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SiteOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SiteOptions() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SiteOptions value)  $default,){
final _that = this;
switch (_that) {
case _SiteOptions():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SiteOptions value)?  $default,){
final _that = this;
switch (_that) {
case _SiteOptions() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String flags,  String loginUrl,  String loginCookiePattern,  String loginCookieDescription,  List<RegexValueRule> headers,  List<RegexValueRule> cookies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SiteOptions() when $default != null:
return $default(_that.flags,_that.loginUrl,_that.loginCookiePattern,_that.loginCookieDescription,_that.headers,_that.cookies);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String flags,  String loginUrl,  String loginCookiePattern,  String loginCookieDescription,  List<RegexValueRule> headers,  List<RegexValueRule> cookies)  $default,) {final _that = this;
switch (_that) {
case _SiteOptions():
return $default(_that.flags,_that.loginUrl,_that.loginCookiePattern,_that.loginCookieDescription,_that.headers,_that.cookies);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String flags,  String loginUrl,  String loginCookiePattern,  String loginCookieDescription,  List<RegexValueRule> headers,  List<RegexValueRule> cookies)?  $default,) {final _that = this;
switch (_that) {
case _SiteOptions() when $default != null:
return $default(_that.flags,_that.loginUrl,_that.loginCookiePattern,_that.loginCookieDescription,_that.headers,_that.cookies);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SiteOptions implements SiteOptions {
  const _SiteOptions({this.flags = '', this.loginUrl = '', this.loginCookiePattern = '', this.loginCookieDescription = '', final  List<RegexValueRule> headers = const <RegexValueRule>[], final  List<RegexValueRule> cookies = const <RegexValueRule>[]}): _headers = headers,_cookies = cookies;
  factory _SiteOptions.fromJson(Map<String, dynamic> json) => _$SiteOptionsFromJson(json);

@override@JsonKey() final  String flags;
@override@JsonKey() final  String loginUrl;
@override@JsonKey() final  String loginCookiePattern;
@override@JsonKey() final  String loginCookieDescription;
 final  List<RegexValueRule> _headers;
@override@JsonKey() List<RegexValueRule> get headers {
  if (_headers is EqualUnmodifiableListView) return _headers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_headers);
}

 final  List<RegexValueRule> _cookies;
@override@JsonKey() List<RegexValueRule> get cookies {
  if (_cookies is EqualUnmodifiableListView) return _cookies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cookies);
}


/// Create a copy of SiteOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiteOptionsCopyWith<_SiteOptions> get copyWith => __$SiteOptionsCopyWithImpl<_SiteOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SiteOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SiteOptions&&(identical(other.flags, flags) || other.flags == flags)&&(identical(other.loginUrl, loginUrl) || other.loginUrl == loginUrl)&&(identical(other.loginCookiePattern, loginCookiePattern) || other.loginCookiePattern == loginCookiePattern)&&(identical(other.loginCookieDescription, loginCookieDescription) || other.loginCookieDescription == loginCookieDescription)&&const DeepCollectionEquality().equals(other._headers, _headers)&&const DeepCollectionEquality().equals(other._cookies, _cookies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flags,loginUrl,loginCookiePattern,loginCookieDescription,const DeepCollectionEquality().hash(_headers),const DeepCollectionEquality().hash(_cookies));

@override
String toString() {
  return 'SiteOptions(flags: $flags, loginUrl: $loginUrl, loginCookiePattern: $loginCookiePattern, loginCookieDescription: $loginCookieDescription, headers: $headers, cookies: $cookies)';
}


}

/// @nodoc
abstract mixin class _$SiteOptionsCopyWith<$Res> implements $SiteOptionsCopyWith<$Res> {
  factory _$SiteOptionsCopyWith(_SiteOptions value, $Res Function(_SiteOptions) _then) = __$SiteOptionsCopyWithImpl;
@override @useResult
$Res call({
 String flags, String loginUrl, String loginCookiePattern, String loginCookieDescription, List<RegexValueRule> headers, List<RegexValueRule> cookies
});




}
/// @nodoc
class __$SiteOptionsCopyWithImpl<$Res>
    implements _$SiteOptionsCopyWith<$Res> {
  __$SiteOptionsCopyWithImpl(this._self, this._then);

  final _SiteOptions _self;
  final $Res Function(_SiteOptions) _then;

/// Create a copy of SiteOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flags = null,Object? loginUrl = null,Object? loginCookiePattern = null,Object? loginCookieDescription = null,Object? headers = null,Object? cookies = null,}) {
  return _then(_SiteOptions(
flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as String,loginUrl: null == loginUrl ? _self.loginUrl : loginUrl // ignore: cast_nullable_to_non_nullable
as String,loginCookiePattern: null == loginCookiePattern ? _self.loginCookiePattern : loginCookiePattern // ignore: cast_nullable_to_non_nullable
as String,loginCookieDescription: null == loginCookieDescription ? _self.loginCookieDescription : loginCookieDescription // ignore: cast_nullable_to_non_nullable
as String,headers: null == headers ? _self._headers : headers // ignore: cast_nullable_to_non_nullable
as List<RegexValueRule>,cookies: null == cookies ? _self._cookies : cookies // ignore: cast_nullable_to_non_nullable
as List<RegexValueRule>,
  ));
}


}


/// @nodoc
mixin _$ParserRule {

 String get id; String get name;@ParserEndpointKindJsonConverter() EndpointKind get kind; ParserConfig get config;
/// Create a copy of ParserRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParserRuleCopyWith<ParserRule> get copyWith => _$ParserRuleCopyWithImpl<ParserRule>(this as ParserRule, _$identity);

  /// Serializes this ParserRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParserRule&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.config, config) || other.config == config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,kind,config);

@override
String toString() {
  return 'ParserRule(id: $id, name: $name, kind: $kind, config: $config)';
}


}

/// @nodoc
abstract mixin class $ParserRuleCopyWith<$Res>  {
  factory $ParserRuleCopyWith(ParserRule value, $Res Function(ParserRule) _then) = _$ParserRuleCopyWithImpl;
@useResult
$Res call({
 String id, String name,@ParserEndpointKindJsonConverter() EndpointKind kind, ParserConfig config
});


$ParserConfigCopyWith<$Res> get config;

}
/// @nodoc
class _$ParserRuleCopyWithImpl<$Res>
    implements $ParserRuleCopyWith<$Res> {
  _$ParserRuleCopyWithImpl(this._self, this._then);

  final ParserRule _self;
  final $Res Function(ParserRule) _then;

/// Create a copy of ParserRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? config = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as EndpointKind,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ParserConfig,
  ));
}
/// Create a copy of ParserRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParserConfigCopyWith<$Res> get config {
  
  return $ParserConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// Adds pattern-matching-related methods to [ParserRule].
extension ParserRulePatterns on ParserRule {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParserRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParserRule() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParserRule value)  $default,){
final _that = this;
switch (_that) {
case _ParserRule():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParserRule value)?  $default,){
final _that = this;
switch (_that) {
case _ParserRule() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @ParserEndpointKindJsonConverter()  EndpointKind kind,  ParserConfig config)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParserRule() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.config);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @ParserEndpointKindJsonConverter()  EndpointKind kind,  ParserConfig config)  $default,) {final _that = this;
switch (_that) {
case _ParserRule():
return $default(_that.id,_that.name,_that.kind,_that.config);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @ParserEndpointKindJsonConverter()  EndpointKind kind,  ParserConfig config)?  $default,) {final _that = this;
switch (_that) {
case _ParserRule() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.config);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ParserRule implements ParserRule {
  const _ParserRule({required this.id, this.name = '', @ParserEndpointKindJsonConverter() required this.kind, this.config = const ParserConfig()});
  factory _ParserRule.fromJson(Map<String, dynamic> json) => _$ParserRuleFromJson(json);

@override final  String id;
@override@JsonKey() final  String name;
@override@ParserEndpointKindJsonConverter() final  EndpointKind kind;
@override@JsonKey() final  ParserConfig config;

/// Create a copy of ParserRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParserRuleCopyWith<_ParserRule> get copyWith => __$ParserRuleCopyWithImpl<_ParserRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParserRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParserRule&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.config, config) || other.config == config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,kind,config);

@override
String toString() {
  return 'ParserRule(id: $id, name: $name, kind: $kind, config: $config)';
}


}

/// @nodoc
abstract mixin class _$ParserRuleCopyWith<$Res> implements $ParserRuleCopyWith<$Res> {
  factory _$ParserRuleCopyWith(_ParserRule value, $Res Function(_ParserRule) _then) = __$ParserRuleCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@ParserEndpointKindJsonConverter() EndpointKind kind, ParserConfig config
});


@override $ParserConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$ParserRuleCopyWithImpl<$Res>
    implements _$ParserRuleCopyWith<$Res> {
  __$ParserRuleCopyWithImpl(this._self, this._then);

  final _ParserRule _self;
  final $Res Function(_ParserRule) _then;

/// Create a copy of ParserRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? config = null,}) {
  return _then(_ParserRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as EndpointKind,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ParserConfig,
  ));
}

/// Create a copy of ParserRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParserConfigCopyWith<$Res> get config {
  
  return $ParserConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

SelectorScript _$SelectorScriptFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'output':
          return OutputSelectorScript.fromJson(
            json
          );
                case 'replace':
          return ReplaceSelectorScript.fromJson(
            json
          );
                case 'javaScript':
          return JavaScriptSelectorScript.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'SelectorScript',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$SelectorScript {



  /// Serializes this SelectorScript to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectorScript);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectorScript()';
}


}

/// @nodoc
class $SelectorScriptCopyWith<$Res>  {
$SelectorScriptCopyWith(SelectorScript _, $Res Function(SelectorScript) __);
}


/// Adds pattern-matching-related methods to [SelectorScript].
extension SelectorScriptPatterns on SelectorScript {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OutputSelectorScript value)?  output,TResult Function( ReplaceSelectorScript value)?  replace,TResult Function( JavaScriptSelectorScript value)?  javaScript,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OutputSelectorScript() when output != null:
return output(_that);case ReplaceSelectorScript() when replace != null:
return replace(_that);case JavaScriptSelectorScript() when javaScript != null:
return javaScript(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OutputSelectorScript value)  output,required TResult Function( ReplaceSelectorScript value)  replace,required TResult Function( JavaScriptSelectorScript value)  javaScript,}){
final _that = this;
switch (_that) {
case OutputSelectorScript():
return output(_that);case ReplaceSelectorScript():
return replace(_that);case JavaScriptSelectorScript():
return javaScript(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OutputSelectorScript value)?  output,TResult? Function( ReplaceSelectorScript value)?  replace,TResult? Function( JavaScriptSelectorScript value)?  javaScript,}){
final _that = this;
switch (_that) {
case OutputSelectorScript() when output != null:
return output(_that);case ReplaceSelectorScript() when replace != null:
return replace(_that);case JavaScriptSelectorScript() when javaScript != null:
return javaScript(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  output,TResult Function( Map<String, String> values)?  replace,TResult Function( String source)?  javaScript,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OutputSelectorScript() when output != null:
return output();case ReplaceSelectorScript() when replace != null:
return replace(_that.values);case JavaScriptSelectorScript() when javaScript != null:
return javaScript(_that.source);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  output,required TResult Function( Map<String, String> values)  replace,required TResult Function( String source)  javaScript,}) {final _that = this;
switch (_that) {
case OutputSelectorScript():
return output();case ReplaceSelectorScript():
return replace(_that.values);case JavaScriptSelectorScript():
return javaScript(_that.source);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  output,TResult? Function( Map<String, String> values)?  replace,TResult? Function( String source)?  javaScript,}) {final _that = this;
switch (_that) {
case OutputSelectorScript() when output != null:
return output();case ReplaceSelectorScript() when replace != null:
return replace(_that.values);case JavaScriptSelectorScript() when javaScript != null:
return javaScript(_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class OutputSelectorScript implements SelectorScript {
  const OutputSelectorScript({final  String? $type}): $type = $type ?? 'output';
  factory OutputSelectorScript.fromJson(Map<String, dynamic> json) => _$OutputSelectorScriptFromJson(json);



@JsonKey(name: 'type')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$OutputSelectorScriptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutputSelectorScript);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectorScript.output()';
}


}




/// @nodoc
@JsonSerializable()

class ReplaceSelectorScript implements SelectorScript {
  const ReplaceSelectorScript({final  Map<String, String> values = const <String, String>{}, final  String? $type}): _values = values,$type = $type ?? 'replace';
  factory ReplaceSelectorScript.fromJson(Map<String, dynamic> json) => _$ReplaceSelectorScriptFromJson(json);

 final  Map<String, String> _values;
@JsonKey() Map<String, String> get values {
  if (_values is EqualUnmodifiableMapView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_values);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of SelectorScript
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplaceSelectorScriptCopyWith<ReplaceSelectorScript> get copyWith => _$ReplaceSelectorScriptCopyWithImpl<ReplaceSelectorScript>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReplaceSelectorScriptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplaceSelectorScript&&const DeepCollectionEquality().equals(other._values, _values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_values));

@override
String toString() {
  return 'SelectorScript.replace(values: $values)';
}


}

/// @nodoc
abstract mixin class $ReplaceSelectorScriptCopyWith<$Res> implements $SelectorScriptCopyWith<$Res> {
  factory $ReplaceSelectorScriptCopyWith(ReplaceSelectorScript value, $Res Function(ReplaceSelectorScript) _then) = _$ReplaceSelectorScriptCopyWithImpl;
@useResult
$Res call({
 Map<String, String> values
});




}
/// @nodoc
class _$ReplaceSelectorScriptCopyWithImpl<$Res>
    implements $ReplaceSelectorScriptCopyWith<$Res> {
  _$ReplaceSelectorScriptCopyWithImpl(this._self, this._then);

  final ReplaceSelectorScript _self;
  final $Res Function(ReplaceSelectorScript) _then;

/// Create a copy of SelectorScript
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? values = null,}) {
  return _then(ReplaceSelectorScript(
values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class JavaScriptSelectorScript implements SelectorScript {
  const JavaScriptSelectorScript({this.source = '', final  String? $type}): $type = $type ?? 'javaScript';
  factory JavaScriptSelectorScript.fromJson(Map<String, dynamic> json) => _$JavaScriptSelectorScriptFromJson(json);

@JsonKey() final  String source;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of SelectorScript
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JavaScriptSelectorScriptCopyWith<JavaScriptSelectorScript> get copyWith => _$JavaScriptSelectorScriptCopyWithImpl<JavaScriptSelectorScript>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JavaScriptSelectorScriptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JavaScriptSelectorScript&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source);

@override
String toString() {
  return 'SelectorScript.javaScript(source: $source)';
}


}

/// @nodoc
abstract mixin class $JavaScriptSelectorScriptCopyWith<$Res> implements $SelectorScriptCopyWith<$Res> {
  factory $JavaScriptSelectorScriptCopyWith(JavaScriptSelectorScript value, $Res Function(JavaScriptSelectorScript) _then) = _$JavaScriptSelectorScriptCopyWithImpl;
@useResult
$Res call({
 String source
});




}
/// @nodoc
class _$JavaScriptSelectorScriptCopyWithImpl<$Res>
    implements $JavaScriptSelectorScriptCopyWith<$Res> {
  _$JavaScriptSelectorScriptCopyWithImpl(this._self, this._then);

  final JavaScriptSelectorScript _self;
  final $Res Function(JavaScriptSelectorScript) _then;

/// Create a copy of SelectorScript
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? source = null,}) {
  return _then(JavaScriptSelectorScript(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SelectorRule {

 String get selector; SelectorQueryType get queryType; SelectorFunctionType get function; String get parameter; String get regex; String get replace; SelectorScript get script; String get defaultValue;
/// Create a copy of SelectorRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectorRuleCopyWith<SelectorRule> get copyWith => _$SelectorRuleCopyWithImpl<SelectorRule>(this as SelectorRule, _$identity);

  /// Serializes this SelectorRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectorRule&&(identical(other.selector, selector) || other.selector == selector)&&(identical(other.queryType, queryType) || other.queryType == queryType)&&(identical(other.function, function) || other.function == function)&&(identical(other.parameter, parameter) || other.parameter == parameter)&&(identical(other.regex, regex) || other.regex == regex)&&(identical(other.replace, replace) || other.replace == replace)&&(identical(other.script, script) || other.script == script)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,selector,queryType,function,parameter,regex,replace,script,defaultValue);

@override
String toString() {
  return 'SelectorRule(selector: $selector, queryType: $queryType, function: $function, parameter: $parameter, regex: $regex, replace: $replace, script: $script, defaultValue: $defaultValue)';
}


}

/// @nodoc
abstract mixin class $SelectorRuleCopyWith<$Res>  {
  factory $SelectorRuleCopyWith(SelectorRule value, $Res Function(SelectorRule) _then) = _$SelectorRuleCopyWithImpl;
@useResult
$Res call({
 String selector, SelectorQueryType queryType, SelectorFunctionType function, String parameter, String regex, String replace, SelectorScript script, String defaultValue
});


$SelectorScriptCopyWith<$Res> get script;

}
/// @nodoc
class _$SelectorRuleCopyWithImpl<$Res>
    implements $SelectorRuleCopyWith<$Res> {
  _$SelectorRuleCopyWithImpl(this._self, this._then);

  final SelectorRule _self;
  final $Res Function(SelectorRule) _then;

/// Create a copy of SelectorRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selector = null,Object? queryType = null,Object? function = null,Object? parameter = null,Object? regex = null,Object? replace = null,Object? script = null,Object? defaultValue = null,}) {
  return _then(_self.copyWith(
selector: null == selector ? _self.selector : selector // ignore: cast_nullable_to_non_nullable
as String,queryType: null == queryType ? _self.queryType : queryType // ignore: cast_nullable_to_non_nullable
as SelectorQueryType,function: null == function ? _self.function : function // ignore: cast_nullable_to_non_nullable
as SelectorFunctionType,parameter: null == parameter ? _self.parameter : parameter // ignore: cast_nullable_to_non_nullable
as String,regex: null == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as String,replace: null == replace ? _self.replace : replace // ignore: cast_nullable_to_non_nullable
as String,script: null == script ? _self.script : script // ignore: cast_nullable_to_non_nullable
as SelectorScript,defaultValue: null == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SelectorRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectorScriptCopyWith<$Res> get script {
  
  return $SelectorScriptCopyWith<$Res>(_self.script, (value) {
    return _then(_self.copyWith(script: value));
  });
}
}


/// Adds pattern-matching-related methods to [SelectorRule].
extension SelectorRulePatterns on SelectorRule {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectorRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectorRule() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectorRule value)  $default,){
final _that = this;
switch (_that) {
case _SelectorRule():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectorRule value)?  $default,){
final _that = this;
switch (_that) {
case _SelectorRule() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String selector,  SelectorQueryType queryType,  SelectorFunctionType function,  String parameter,  String regex,  String replace,  SelectorScript script,  String defaultValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectorRule() when $default != null:
return $default(_that.selector,_that.queryType,_that.function,_that.parameter,_that.regex,_that.replace,_that.script,_that.defaultValue);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String selector,  SelectorQueryType queryType,  SelectorFunctionType function,  String parameter,  String regex,  String replace,  SelectorScript script,  String defaultValue)  $default,) {final _that = this;
switch (_that) {
case _SelectorRule():
return $default(_that.selector,_that.queryType,_that.function,_that.parameter,_that.regex,_that.replace,_that.script,_that.defaultValue);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String selector,  SelectorQueryType queryType,  SelectorFunctionType function,  String parameter,  String regex,  String replace,  SelectorScript script,  String defaultValue)?  $default,) {final _that = this;
switch (_that) {
case _SelectorRule() when $default != null:
return $default(_that.selector,_that.queryType,_that.function,_that.parameter,_that.regex,_that.replace,_that.script,_that.defaultValue);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SelectorRule extends SelectorRule {
  const _SelectorRule({this.selector = '', this.queryType = SelectorQueryType.css, this.function = SelectorFunctionType.text, this.parameter = '', this.regex = '', this.replace = '', this.script = const SelectorScript.output(), this.defaultValue = ''}): super._();
  factory _SelectorRule.fromJson(Map<String, dynamic> json) => _$SelectorRuleFromJson(json);

@override@JsonKey() final  String selector;
@override@JsonKey() final  SelectorQueryType queryType;
@override@JsonKey() final  SelectorFunctionType function;
@override@JsonKey() final  String parameter;
@override@JsonKey() final  String regex;
@override@JsonKey() final  String replace;
@override@JsonKey() final  SelectorScript script;
@override@JsonKey() final  String defaultValue;

/// Create a copy of SelectorRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectorRuleCopyWith<_SelectorRule> get copyWith => __$SelectorRuleCopyWithImpl<_SelectorRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelectorRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectorRule&&(identical(other.selector, selector) || other.selector == selector)&&(identical(other.queryType, queryType) || other.queryType == queryType)&&(identical(other.function, function) || other.function == function)&&(identical(other.parameter, parameter) || other.parameter == parameter)&&(identical(other.regex, regex) || other.regex == regex)&&(identical(other.replace, replace) || other.replace == replace)&&(identical(other.script, script) || other.script == script)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,selector,queryType,function,parameter,regex,replace,script,defaultValue);

@override
String toString() {
  return 'SelectorRule(selector: $selector, queryType: $queryType, function: $function, parameter: $parameter, regex: $regex, replace: $replace, script: $script, defaultValue: $defaultValue)';
}


}

/// @nodoc
abstract mixin class _$SelectorRuleCopyWith<$Res> implements $SelectorRuleCopyWith<$Res> {
  factory _$SelectorRuleCopyWith(_SelectorRule value, $Res Function(_SelectorRule) _then) = __$SelectorRuleCopyWithImpl;
@override @useResult
$Res call({
 String selector, SelectorQueryType queryType, SelectorFunctionType function, String parameter, String regex, String replace, SelectorScript script, String defaultValue
});


@override $SelectorScriptCopyWith<$Res> get script;

}
/// @nodoc
class __$SelectorRuleCopyWithImpl<$Res>
    implements _$SelectorRuleCopyWith<$Res> {
  __$SelectorRuleCopyWithImpl(this._self, this._then);

  final _SelectorRule _self;
  final $Res Function(_SelectorRule) _then;

/// Create a copy of SelectorRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selector = null,Object? queryType = null,Object? function = null,Object? parameter = null,Object? regex = null,Object? replace = null,Object? script = null,Object? defaultValue = null,}) {
  return _then(_SelectorRule(
selector: null == selector ? _self.selector : selector // ignore: cast_nullable_to_non_nullable
as String,queryType: null == queryType ? _self.queryType : queryType // ignore: cast_nullable_to_non_nullable
as SelectorQueryType,function: null == function ? _self.function : function // ignore: cast_nullable_to_non_nullable
as SelectorFunctionType,parameter: null == parameter ? _self.parameter : parameter // ignore: cast_nullable_to_non_nullable
as String,regex: null == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as String,replace: null == replace ? _self.replace : replace // ignore: cast_nullable_to_non_nullable
as String,script: null == script ? _self.script : script // ignore: cast_nullable_to_non_nullable
as SelectorScript,defaultValue: null == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SelectorRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectorScriptCopyWith<$Res> get script {
  
  return $SelectorScriptCopyWith<$Res>(_self.script, (value) {
    return _then(_self.copyWith(script: value));
  });
}
}


/// @nodoc
mixin _$ExtraSelectorRule {

 String get id; bool get persistent; SelectorRule get selector;
/// Create a copy of ExtraSelectorRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtraSelectorRuleCopyWith<ExtraSelectorRule> get copyWith => _$ExtraSelectorRuleCopyWithImpl<ExtraSelectorRule>(this as ExtraSelectorRule, _$identity);

  /// Serializes this ExtraSelectorRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtraSelectorRule&&(identical(other.id, id) || other.id == id)&&(identical(other.persistent, persistent) || other.persistent == persistent)&&(identical(other.selector, selector) || other.selector == selector));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,persistent,selector);

@override
String toString() {
  return 'ExtraSelectorRule(id: $id, persistent: $persistent, selector: $selector)';
}


}

/// @nodoc
abstract mixin class $ExtraSelectorRuleCopyWith<$Res>  {
  factory $ExtraSelectorRuleCopyWith(ExtraSelectorRule value, $Res Function(ExtraSelectorRule) _then) = _$ExtraSelectorRuleCopyWithImpl;
@useResult
$Res call({
 String id, bool persistent, SelectorRule selector
});


$SelectorRuleCopyWith<$Res> get selector;

}
/// @nodoc
class _$ExtraSelectorRuleCopyWithImpl<$Res>
    implements $ExtraSelectorRuleCopyWith<$Res> {
  _$ExtraSelectorRuleCopyWithImpl(this._self, this._then);

  final ExtraSelectorRule _self;
  final $Res Function(ExtraSelectorRule) _then;

/// Create a copy of ExtraSelectorRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? persistent = null,Object? selector = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,persistent: null == persistent ? _self.persistent : persistent // ignore: cast_nullable_to_non_nullable
as bool,selector: null == selector ? _self.selector : selector // ignore: cast_nullable_to_non_nullable
as SelectorRule,
  ));
}
/// Create a copy of ExtraSelectorRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectorRuleCopyWith<$Res> get selector {
  
  return $SelectorRuleCopyWith<$Res>(_self.selector, (value) {
    return _then(_self.copyWith(selector: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExtraSelectorRule].
extension ExtraSelectorRulePatterns on ExtraSelectorRule {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExtraSelectorRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExtraSelectorRule() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExtraSelectorRule value)  $default,){
final _that = this;
switch (_that) {
case _ExtraSelectorRule():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExtraSelectorRule value)?  $default,){
final _that = this;
switch (_that) {
case _ExtraSelectorRule() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  bool persistent,  SelectorRule selector)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExtraSelectorRule() when $default != null:
return $default(_that.id,_that.persistent,_that.selector);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  bool persistent,  SelectorRule selector)  $default,) {final _that = this;
switch (_that) {
case _ExtraSelectorRule():
return $default(_that.id,_that.persistent,_that.selector);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  bool persistent,  SelectorRule selector)?  $default,) {final _that = this;
switch (_that) {
case _ExtraSelectorRule() when $default != null:
return $default(_that.id,_that.persistent,_that.selector);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ExtraSelectorRule implements ExtraSelectorRule {
  const _ExtraSelectorRule({required this.id, this.persistent = false, this.selector = const SelectorRule()});
  factory _ExtraSelectorRule.fromJson(Map<String, dynamic> json) => _$ExtraSelectorRuleFromJson(json);

@override final  String id;
@override@JsonKey() final  bool persistent;
@override@JsonKey() final  SelectorRule selector;

/// Create a copy of ExtraSelectorRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtraSelectorRuleCopyWith<_ExtraSelectorRule> get copyWith => __$ExtraSelectorRuleCopyWithImpl<_ExtraSelectorRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExtraSelectorRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtraSelectorRule&&(identical(other.id, id) || other.id == id)&&(identical(other.persistent, persistent) || other.persistent == persistent)&&(identical(other.selector, selector) || other.selector == selector));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,persistent,selector);

@override
String toString() {
  return 'ExtraSelectorRule(id: $id, persistent: $persistent, selector: $selector)';
}


}

/// @nodoc
abstract mixin class _$ExtraSelectorRuleCopyWith<$Res> implements $ExtraSelectorRuleCopyWith<$Res> {
  factory _$ExtraSelectorRuleCopyWith(_ExtraSelectorRule value, $Res Function(_ExtraSelectorRule) _then) = __$ExtraSelectorRuleCopyWithImpl;
@override @useResult
$Res call({
 String id, bool persistent, SelectorRule selector
});


@override $SelectorRuleCopyWith<$Res> get selector;

}
/// @nodoc
class __$ExtraSelectorRuleCopyWithImpl<$Res>
    implements _$ExtraSelectorRuleCopyWith<$Res> {
  __$ExtraSelectorRuleCopyWithImpl(this._self, this._then);

  final _ExtraSelectorRule _self;
  final $Res Function(_ExtraSelectorRule) _then;

/// Create a copy of ExtraSelectorRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? persistent = null,Object? selector = null,}) {
  return _then(_ExtraSelectorRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,persistent: null == persistent ? _self.persistent : persistent // ignore: cast_nullable_to_non_nullable
as bool,selector: null == selector ? _self.selector : selector // ignore: cast_nullable_to_non_nullable
as SelectorRule,
  ));
}

/// Create a copy of ExtraSelectorRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectorRuleCopyWith<$Res> get selector {
  
  return $SelectorRuleCopyWith<$Res>(_self.selector, (value) {
    return _then(_self.copyWith(selector: value));
  });
}
}


/// @nodoc
mixin _$ParserConfig {

 Map<String, SelectorRule> get selectors; List<ExtraSelectorRule> get extras;
/// Create a copy of ParserConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParserConfigCopyWith<ParserConfig> get copyWith => _$ParserConfigCopyWithImpl<ParserConfig>(this as ParserConfig, _$identity);

  /// Serializes this ParserConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParserConfig&&const DeepCollectionEquality().equals(other.selectors, selectors)&&const DeepCollectionEquality().equals(other.extras, extras));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(selectors),const DeepCollectionEquality().hash(extras));

@override
String toString() {
  return 'ParserConfig(selectors: $selectors, extras: $extras)';
}


}

/// @nodoc
abstract mixin class $ParserConfigCopyWith<$Res>  {
  factory $ParserConfigCopyWith(ParserConfig value, $Res Function(ParserConfig) _then) = _$ParserConfigCopyWithImpl;
@useResult
$Res call({
 Map<String, SelectorRule> selectors, List<ExtraSelectorRule> extras
});




}
/// @nodoc
class _$ParserConfigCopyWithImpl<$Res>
    implements $ParserConfigCopyWith<$Res> {
  _$ParserConfigCopyWithImpl(this._self, this._then);

  final ParserConfig _self;
  final $Res Function(ParserConfig) _then;

/// Create a copy of ParserConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectors = null,Object? extras = null,}) {
  return _then(_self.copyWith(
selectors: null == selectors ? _self.selectors : selectors // ignore: cast_nullable_to_non_nullable
as Map<String, SelectorRule>,extras: null == extras ? _self.extras : extras // ignore: cast_nullable_to_non_nullable
as List<ExtraSelectorRule>,
  ));
}

}


/// Adds pattern-matching-related methods to [ParserConfig].
extension ParserConfigPatterns on ParserConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParserConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParserConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParserConfig value)  $default,){
final _that = this;
switch (_that) {
case _ParserConfig():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParserConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ParserConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, SelectorRule> selectors,  List<ExtraSelectorRule> extras)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParserConfig() when $default != null:
return $default(_that.selectors,_that.extras);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, SelectorRule> selectors,  List<ExtraSelectorRule> extras)  $default,) {final _that = this;
switch (_that) {
case _ParserConfig():
return $default(_that.selectors,_that.extras);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, SelectorRule> selectors,  List<ExtraSelectorRule> extras)?  $default,) {final _that = this;
switch (_that) {
case _ParserConfig() when $default != null:
return $default(_that.selectors,_that.extras);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ParserConfig implements ParserConfig {
  const _ParserConfig({final  Map<String, SelectorRule> selectors = const <String, SelectorRule>{}, final  List<ExtraSelectorRule> extras = const <ExtraSelectorRule>[]}): _selectors = selectors,_extras = extras;
  factory _ParserConfig.fromJson(Map<String, dynamic> json) => _$ParserConfigFromJson(json);

 final  Map<String, SelectorRule> _selectors;
@override@JsonKey() Map<String, SelectorRule> get selectors {
  if (_selectors is EqualUnmodifiableMapView) return _selectors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_selectors);
}

 final  List<ExtraSelectorRule> _extras;
@override@JsonKey() List<ExtraSelectorRule> get extras {
  if (_extras is EqualUnmodifiableListView) return _extras;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_extras);
}


/// Create a copy of ParserConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParserConfigCopyWith<_ParserConfig> get copyWith => __$ParserConfigCopyWithImpl<_ParserConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParserConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParserConfig&&const DeepCollectionEquality().equals(other._selectors, _selectors)&&const DeepCollectionEquality().equals(other._extras, _extras));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_selectors),const DeepCollectionEquality().hash(_extras));

@override
String toString() {
  return 'ParserConfig(selectors: $selectors, extras: $extras)';
}


}

/// @nodoc
abstract mixin class _$ParserConfigCopyWith<$Res> implements $ParserConfigCopyWith<$Res> {
  factory _$ParserConfigCopyWith(_ParserConfig value, $Res Function(_ParserConfig) _then) = __$ParserConfigCopyWithImpl;
@override @useResult
$Res call({
 Map<String, SelectorRule> selectors, List<ExtraSelectorRule> extras
});




}
/// @nodoc
class __$ParserConfigCopyWithImpl<$Res>
    implements _$ParserConfigCopyWith<$Res> {
  __$ParserConfigCopyWithImpl(this._self, this._then);

  final _ParserConfig _self;
  final $Res Function(_ParserConfig) _then;

/// Create a copy of ParserConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectors = null,Object? extras = null,}) {
  return _then(_ParserConfig(
selectors: null == selectors ? _self._selectors : selectors // ignore: cast_nullable_to_non_nullable
as Map<String, SelectorRule>,extras: null == extras ? _self._extras : extras // ignore: cast_nullable_to_non_nullable
as List<ExtraSelectorRule>,
  ));
}


}


/// @nodoc
mixin _$EndpointRule {

 String get id;@EndpointEndpointKindJsonConverter() EndpointKind get kind; String get name; String get icon; bool get visible; RequestRule get request; String get parserId; PaginationRule get pagination; EndpointCachePolicy get cachePolicy; EndpointLinks get links; EndpointPresentation get presentation;
/// Create a copy of EndpointRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EndpointRuleCopyWith<EndpointRule> get copyWith => _$EndpointRuleCopyWithImpl<EndpointRule>(this as EndpointRule, _$identity);

  /// Serializes this EndpointRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EndpointRule&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.visible, visible) || other.visible == visible)&&(identical(other.request, request) || other.request == request)&&(identical(other.parserId, parserId) || other.parserId == parserId)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.cachePolicy, cachePolicy) || other.cachePolicy == cachePolicy)&&(identical(other.links, links) || other.links == links)&&(identical(other.presentation, presentation) || other.presentation == presentation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,name,icon,visible,request,parserId,pagination,cachePolicy,links,presentation);

@override
String toString() {
  return 'EndpointRule(id: $id, kind: $kind, name: $name, icon: $icon, visible: $visible, request: $request, parserId: $parserId, pagination: $pagination, cachePolicy: $cachePolicy, links: $links, presentation: $presentation)';
}


}

/// @nodoc
abstract mixin class $EndpointRuleCopyWith<$Res>  {
  factory $EndpointRuleCopyWith(EndpointRule value, $Res Function(EndpointRule) _then) = _$EndpointRuleCopyWithImpl;
@useResult
$Res call({
 String id,@EndpointEndpointKindJsonConverter() EndpointKind kind, String name, String icon, bool visible, RequestRule request, String parserId, PaginationRule pagination, EndpointCachePolicy cachePolicy, EndpointLinks links, EndpointPresentation presentation
});


$RequestRuleCopyWith<$Res> get request;$PaginationRuleCopyWith<$Res> get pagination;$EndpointLinksCopyWith<$Res> get links;$EndpointPresentationCopyWith<$Res> get presentation;

}
/// @nodoc
class _$EndpointRuleCopyWithImpl<$Res>
    implements $EndpointRuleCopyWith<$Res> {
  _$EndpointRuleCopyWithImpl(this._self, this._then);

  final EndpointRule _self;
  final $Res Function(EndpointRule) _then;

/// Create a copy of EndpointRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? name = null,Object? icon = null,Object? visible = null,Object? request = null,Object? parserId = null,Object? pagination = null,Object? cachePolicy = null,Object? links = null,Object? presentation = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as EndpointKind,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as RequestRule,parserId: null == parserId ? _self.parserId : parserId // ignore: cast_nullable_to_non_nullable
as String,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationRule,cachePolicy: null == cachePolicy ? _self.cachePolicy : cachePolicy // ignore: cast_nullable_to_non_nullable
as EndpointCachePolicy,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as EndpointLinks,presentation: null == presentation ? _self.presentation : presentation // ignore: cast_nullable_to_non_nullable
as EndpointPresentation,
  ));
}
/// Create a copy of EndpointRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestRuleCopyWith<$Res> get request {
  
  return $RequestRuleCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}/// Create a copy of EndpointRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationRuleCopyWith<$Res> get pagination {
  
  return $PaginationRuleCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of EndpointRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EndpointLinksCopyWith<$Res> get links {
  
  return $EndpointLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of EndpointRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EndpointPresentationCopyWith<$Res> get presentation {
  
  return $EndpointPresentationCopyWith<$Res>(_self.presentation, (value) {
    return _then(_self.copyWith(presentation: value));
  });
}
}


/// Adds pattern-matching-related methods to [EndpointRule].
extension EndpointRulePatterns on EndpointRule {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EndpointRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EndpointRule() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EndpointRule value)  $default,){
final _that = this;
switch (_that) {
case _EndpointRule():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EndpointRule value)?  $default,){
final _that = this;
switch (_that) {
case _EndpointRule() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @EndpointEndpointKindJsonConverter()  EndpointKind kind,  String name,  String icon,  bool visible,  RequestRule request,  String parserId,  PaginationRule pagination,  EndpointCachePolicy cachePolicy,  EndpointLinks links,  EndpointPresentation presentation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EndpointRule() when $default != null:
return $default(_that.id,_that.kind,_that.name,_that.icon,_that.visible,_that.request,_that.parserId,_that.pagination,_that.cachePolicy,_that.links,_that.presentation);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @EndpointEndpointKindJsonConverter()  EndpointKind kind,  String name,  String icon,  bool visible,  RequestRule request,  String parserId,  PaginationRule pagination,  EndpointCachePolicy cachePolicy,  EndpointLinks links,  EndpointPresentation presentation)  $default,) {final _that = this;
switch (_that) {
case _EndpointRule():
return $default(_that.id,_that.kind,_that.name,_that.icon,_that.visible,_that.request,_that.parserId,_that.pagination,_that.cachePolicy,_that.links,_that.presentation);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @EndpointEndpointKindJsonConverter()  EndpointKind kind,  String name,  String icon,  bool visible,  RequestRule request,  String parserId,  PaginationRule pagination,  EndpointCachePolicy cachePolicy,  EndpointLinks links,  EndpointPresentation presentation)?  $default,) {final _that = this;
switch (_that) {
case _EndpointRule() when $default != null:
return $default(_that.id,_that.kind,_that.name,_that.icon,_that.visible,_that.request,_that.parserId,_that.pagination,_that.cachePolicy,_that.links,_that.presentation);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _EndpointRule implements EndpointRule {
  const _EndpointRule({required this.id, @EndpointEndpointKindJsonConverter() required this.kind, required this.name, this.icon = '', this.visible = true, required this.request, required this.parserId, required this.pagination, this.cachePolicy = EndpointCachePolicy.networkFirst, this.links = const EndpointLinks(), this.presentation = const EndpointPresentation()});
  factory _EndpointRule.fromJson(Map<String, dynamic> json) => _$EndpointRuleFromJson(json);

@override final  String id;
@override@EndpointEndpointKindJsonConverter() final  EndpointKind kind;
@override final  String name;
@override@JsonKey() final  String icon;
@override@JsonKey() final  bool visible;
@override final  RequestRule request;
@override final  String parserId;
@override final  PaginationRule pagination;
@override@JsonKey() final  EndpointCachePolicy cachePolicy;
@override@JsonKey() final  EndpointLinks links;
@override@JsonKey() final  EndpointPresentation presentation;

/// Create a copy of EndpointRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EndpointRuleCopyWith<_EndpointRule> get copyWith => __$EndpointRuleCopyWithImpl<_EndpointRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EndpointRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EndpointRule&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.visible, visible) || other.visible == visible)&&(identical(other.request, request) || other.request == request)&&(identical(other.parserId, parserId) || other.parserId == parserId)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.cachePolicy, cachePolicy) || other.cachePolicy == cachePolicy)&&(identical(other.links, links) || other.links == links)&&(identical(other.presentation, presentation) || other.presentation == presentation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,name,icon,visible,request,parserId,pagination,cachePolicy,links,presentation);

@override
String toString() {
  return 'EndpointRule(id: $id, kind: $kind, name: $name, icon: $icon, visible: $visible, request: $request, parserId: $parserId, pagination: $pagination, cachePolicy: $cachePolicy, links: $links, presentation: $presentation)';
}


}

/// @nodoc
abstract mixin class _$EndpointRuleCopyWith<$Res> implements $EndpointRuleCopyWith<$Res> {
  factory _$EndpointRuleCopyWith(_EndpointRule value, $Res Function(_EndpointRule) _then) = __$EndpointRuleCopyWithImpl;
@override @useResult
$Res call({
 String id,@EndpointEndpointKindJsonConverter() EndpointKind kind, String name, String icon, bool visible, RequestRule request, String parserId, PaginationRule pagination, EndpointCachePolicy cachePolicy, EndpointLinks links, EndpointPresentation presentation
});


@override $RequestRuleCopyWith<$Res> get request;@override $PaginationRuleCopyWith<$Res> get pagination;@override $EndpointLinksCopyWith<$Res> get links;@override $EndpointPresentationCopyWith<$Res> get presentation;

}
/// @nodoc
class __$EndpointRuleCopyWithImpl<$Res>
    implements _$EndpointRuleCopyWith<$Res> {
  __$EndpointRuleCopyWithImpl(this._self, this._then);

  final _EndpointRule _self;
  final $Res Function(_EndpointRule) _then;

/// Create a copy of EndpointRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? name = null,Object? icon = null,Object? visible = null,Object? request = null,Object? parserId = null,Object? pagination = null,Object? cachePolicy = null,Object? links = null,Object? presentation = null,}) {
  return _then(_EndpointRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as EndpointKind,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as RequestRule,parserId: null == parserId ? _self.parserId : parserId // ignore: cast_nullable_to_non_nullable
as String,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationRule,cachePolicy: null == cachePolicy ? _self.cachePolicy : cachePolicy // ignore: cast_nullable_to_non_nullable
as EndpointCachePolicy,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as EndpointLinks,presentation: null == presentation ? _self.presentation : presentation // ignore: cast_nullable_to_non_nullable
as EndpointPresentation,
  ));
}

/// Create a copy of EndpointRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestRuleCopyWith<$Res> get request {
  
  return $RequestRuleCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}/// Create a copy of EndpointRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationRuleCopyWith<$Res> get pagination {
  
  return $PaginationRuleCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of EndpointRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EndpointLinksCopyWith<$Res> get links {
  
  return $EndpointLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of EndpointRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EndpointPresentationCopyWith<$Res> get presentation {
  
  return $EndpointPresentationCopyWith<$Res>(_self.presentation, (value) {
    return _then(_self.copyWith(presentation: value));
  });
}
}


/// @nodoc
mixin _$EndpointSubpage {

 String get name; String get key; String get value;
/// Create a copy of EndpointSubpage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EndpointSubpageCopyWith<EndpointSubpage> get copyWith => _$EndpointSubpageCopyWithImpl<EndpointSubpage>(this as EndpointSubpage, _$identity);

  /// Serializes this EndpointSubpage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EndpointSubpage&&(identical(other.name, name) || other.name == name)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,key,value);

@override
String toString() {
  return 'EndpointSubpage(name: $name, key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $EndpointSubpageCopyWith<$Res>  {
  factory $EndpointSubpageCopyWith(EndpointSubpage value, $Res Function(EndpointSubpage) _then) = _$EndpointSubpageCopyWithImpl;
@useResult
$Res call({
 String name, String key, String value
});




}
/// @nodoc
class _$EndpointSubpageCopyWithImpl<$Res>
    implements $EndpointSubpageCopyWith<$Res> {
  _$EndpointSubpageCopyWithImpl(this._self, this._then);

  final EndpointSubpage _self;
  final $Res Function(EndpointSubpage) _then;

/// Create a copy of EndpointSubpage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? key = null,Object? value = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EndpointSubpage].
extension EndpointSubpagePatterns on EndpointSubpage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EndpointSubpage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EndpointSubpage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EndpointSubpage value)  $default,){
final _that = this;
switch (_that) {
case _EndpointSubpage():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EndpointSubpage value)?  $default,){
final _that = this;
switch (_that) {
case _EndpointSubpage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String key,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EndpointSubpage() when $default != null:
return $default(_that.name,_that.key,_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String key,  String value)  $default,) {final _that = this;
switch (_that) {
case _EndpointSubpage():
return $default(_that.name,_that.key,_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String key,  String value)?  $default,) {final _that = this;
switch (_that) {
case _EndpointSubpage() when $default != null:
return $default(_that.name,_that.key,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EndpointSubpage implements EndpointSubpage {
  const _EndpointSubpage({this.name = '', this.key = '', this.value = ''});
  factory _EndpointSubpage.fromJson(Map<String, dynamic> json) => _$EndpointSubpageFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String key;
@override@JsonKey() final  String value;

/// Create a copy of EndpointSubpage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EndpointSubpageCopyWith<_EndpointSubpage> get copyWith => __$EndpointSubpageCopyWithImpl<_EndpointSubpage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EndpointSubpageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EndpointSubpage&&(identical(other.name, name) || other.name == name)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,key,value);

@override
String toString() {
  return 'EndpointSubpage(name: $name, key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class _$EndpointSubpageCopyWith<$Res> implements $EndpointSubpageCopyWith<$Res> {
  factory _$EndpointSubpageCopyWith(_EndpointSubpage value, $Res Function(_EndpointSubpage) _then) = __$EndpointSubpageCopyWithImpl;
@override @useResult
$Res call({
 String name, String key, String value
});




}
/// @nodoc
class __$EndpointSubpageCopyWithImpl<$Res>
    implements _$EndpointSubpageCopyWith<$Res> {
  __$EndpointSubpageCopyWithImpl(this._self, this._then);

  final _EndpointSubpage _self;
  final $Res Function(_EndpointSubpage) _then;

/// Create a copy of EndpointSubpage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? key = null,Object? value = null,}) {
  return _then(_EndpointSubpage(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$EndpointFilter {

 String get name; String get key; EndpointFilterType get type; String get defaultValue;
/// Create a copy of EndpointFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EndpointFilterCopyWith<EndpointFilter> get copyWith => _$EndpointFilterCopyWithImpl<EndpointFilter>(this as EndpointFilter, _$identity);

  /// Serializes this EndpointFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EndpointFilter&&(identical(other.name, name) || other.name == name)&&(identical(other.key, key) || other.key == key)&&(identical(other.type, type) || other.type == type)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,key,type,defaultValue);

@override
String toString() {
  return 'EndpointFilter(name: $name, key: $key, type: $type, defaultValue: $defaultValue)';
}


}

/// @nodoc
abstract mixin class $EndpointFilterCopyWith<$Res>  {
  factory $EndpointFilterCopyWith(EndpointFilter value, $Res Function(EndpointFilter) _then) = _$EndpointFilterCopyWithImpl;
@useResult
$Res call({
 String name, String key, EndpointFilterType type, String defaultValue
});




}
/// @nodoc
class _$EndpointFilterCopyWithImpl<$Res>
    implements $EndpointFilterCopyWith<$Res> {
  _$EndpointFilterCopyWithImpl(this._self, this._then);

  final EndpointFilter _self;
  final $Res Function(EndpointFilter) _then;

/// Create a copy of EndpointFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? key = null,Object? type = null,Object? defaultValue = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EndpointFilterType,defaultValue: null == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EndpointFilter].
extension EndpointFilterPatterns on EndpointFilter {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EndpointFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EndpointFilter() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EndpointFilter value)  $default,){
final _that = this;
switch (_that) {
case _EndpointFilter():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EndpointFilter value)?  $default,){
final _that = this;
switch (_that) {
case _EndpointFilter() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String key,  EndpointFilterType type,  String defaultValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EndpointFilter() when $default != null:
return $default(_that.name,_that.key,_that.type,_that.defaultValue);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String key,  EndpointFilterType type,  String defaultValue)  $default,) {final _that = this;
switch (_that) {
case _EndpointFilter():
return $default(_that.name,_that.key,_that.type,_that.defaultValue);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String key,  EndpointFilterType type,  String defaultValue)?  $default,) {final _that = this;
switch (_that) {
case _EndpointFilter() when $default != null:
return $default(_that.name,_that.key,_that.type,_that.defaultValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EndpointFilter implements EndpointFilter {
  const _EndpointFilter({this.name = '', this.key = '', this.type = EndpointFilterType.text, this.defaultValue = ''});
  factory _EndpointFilter.fromJson(Map<String, dynamic> json) => _$EndpointFilterFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String key;
@override@JsonKey() final  EndpointFilterType type;
@override@JsonKey() final  String defaultValue;

/// Create a copy of EndpointFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EndpointFilterCopyWith<_EndpointFilter> get copyWith => __$EndpointFilterCopyWithImpl<_EndpointFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EndpointFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EndpointFilter&&(identical(other.name, name) || other.name == name)&&(identical(other.key, key) || other.key == key)&&(identical(other.type, type) || other.type == type)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,key,type,defaultValue);

@override
String toString() {
  return 'EndpointFilter(name: $name, key: $key, type: $type, defaultValue: $defaultValue)';
}


}

/// @nodoc
abstract mixin class _$EndpointFilterCopyWith<$Res> implements $EndpointFilterCopyWith<$Res> {
  factory _$EndpointFilterCopyWith(_EndpointFilter value, $Res Function(_EndpointFilter) _then) = __$EndpointFilterCopyWithImpl;
@override @useResult
$Res call({
 String name, String key, EndpointFilterType type, String defaultValue
});




}
/// @nodoc
class __$EndpointFilterCopyWithImpl<$Res>
    implements _$EndpointFilterCopyWith<$Res> {
  __$EndpointFilterCopyWithImpl(this._self, this._then);

  final _EndpointFilter _self;
  final $Res Function(_EndpointFilter) _then;

/// Create a copy of EndpointFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? key = null,Object? type = null,Object? defaultValue = null,}) {
  return _then(_EndpointFilter(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EndpointFilterType,defaultValue: null == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$EndpointPresentation {

 List<EndpointSubpage> get subpages; List<EndpointFilter> get filters; SelectorScript get filterScript; String get autocompleteSplitChar; int get autocompleteTimeout;
/// Create a copy of EndpointPresentation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EndpointPresentationCopyWith<EndpointPresentation> get copyWith => _$EndpointPresentationCopyWithImpl<EndpointPresentation>(this as EndpointPresentation, _$identity);

  /// Serializes this EndpointPresentation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EndpointPresentation&&const DeepCollectionEquality().equals(other.subpages, subpages)&&const DeepCollectionEquality().equals(other.filters, filters)&&(identical(other.filterScript, filterScript) || other.filterScript == filterScript)&&(identical(other.autocompleteSplitChar, autocompleteSplitChar) || other.autocompleteSplitChar == autocompleteSplitChar)&&(identical(other.autocompleteTimeout, autocompleteTimeout) || other.autocompleteTimeout == autocompleteTimeout));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(subpages),const DeepCollectionEquality().hash(filters),filterScript,autocompleteSplitChar,autocompleteTimeout);

@override
String toString() {
  return 'EndpointPresentation(subpages: $subpages, filters: $filters, filterScript: $filterScript, autocompleteSplitChar: $autocompleteSplitChar, autocompleteTimeout: $autocompleteTimeout)';
}


}

/// @nodoc
abstract mixin class $EndpointPresentationCopyWith<$Res>  {
  factory $EndpointPresentationCopyWith(EndpointPresentation value, $Res Function(EndpointPresentation) _then) = _$EndpointPresentationCopyWithImpl;
@useResult
$Res call({
 List<EndpointSubpage> subpages, List<EndpointFilter> filters, SelectorScript filterScript, String autocompleteSplitChar, int autocompleteTimeout
});


$SelectorScriptCopyWith<$Res> get filterScript;

}
/// @nodoc
class _$EndpointPresentationCopyWithImpl<$Res>
    implements $EndpointPresentationCopyWith<$Res> {
  _$EndpointPresentationCopyWithImpl(this._self, this._then);

  final EndpointPresentation _self;
  final $Res Function(EndpointPresentation) _then;

/// Create a copy of EndpointPresentation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subpages = null,Object? filters = null,Object? filterScript = null,Object? autocompleteSplitChar = null,Object? autocompleteTimeout = null,}) {
  return _then(_self.copyWith(
subpages: null == subpages ? _self.subpages : subpages // ignore: cast_nullable_to_non_nullable
as List<EndpointSubpage>,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as List<EndpointFilter>,filterScript: null == filterScript ? _self.filterScript : filterScript // ignore: cast_nullable_to_non_nullable
as SelectorScript,autocompleteSplitChar: null == autocompleteSplitChar ? _self.autocompleteSplitChar : autocompleteSplitChar // ignore: cast_nullable_to_non_nullable
as String,autocompleteTimeout: null == autocompleteTimeout ? _self.autocompleteTimeout : autocompleteTimeout // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of EndpointPresentation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectorScriptCopyWith<$Res> get filterScript {
  
  return $SelectorScriptCopyWith<$Res>(_self.filterScript, (value) {
    return _then(_self.copyWith(filterScript: value));
  });
}
}


/// Adds pattern-matching-related methods to [EndpointPresentation].
extension EndpointPresentationPatterns on EndpointPresentation {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EndpointPresentation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EndpointPresentation() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EndpointPresentation value)  $default,){
final _that = this;
switch (_that) {
case _EndpointPresentation():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EndpointPresentation value)?  $default,){
final _that = this;
switch (_that) {
case _EndpointPresentation() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EndpointSubpage> subpages,  List<EndpointFilter> filters,  SelectorScript filterScript,  String autocompleteSplitChar,  int autocompleteTimeout)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EndpointPresentation() when $default != null:
return $default(_that.subpages,_that.filters,_that.filterScript,_that.autocompleteSplitChar,_that.autocompleteTimeout);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EndpointSubpage> subpages,  List<EndpointFilter> filters,  SelectorScript filterScript,  String autocompleteSplitChar,  int autocompleteTimeout)  $default,) {final _that = this;
switch (_that) {
case _EndpointPresentation():
return $default(_that.subpages,_that.filters,_that.filterScript,_that.autocompleteSplitChar,_that.autocompleteTimeout);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EndpointSubpage> subpages,  List<EndpointFilter> filters,  SelectorScript filterScript,  String autocompleteSplitChar,  int autocompleteTimeout)?  $default,) {final _that = this;
switch (_that) {
case _EndpointPresentation() when $default != null:
return $default(_that.subpages,_that.filters,_that.filterScript,_that.autocompleteSplitChar,_that.autocompleteTimeout);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _EndpointPresentation implements EndpointPresentation {
  const _EndpointPresentation({final  List<EndpointSubpage> subpages = const <EndpointSubpage>[], final  List<EndpointFilter> filters = const <EndpointFilter>[], this.filterScript = const SelectorScript.output(), this.autocompleteSplitChar = ' ', this.autocompleteTimeout = 2000}): _subpages = subpages,_filters = filters;
  factory _EndpointPresentation.fromJson(Map<String, dynamic> json) => _$EndpointPresentationFromJson(json);

 final  List<EndpointSubpage> _subpages;
@override@JsonKey() List<EndpointSubpage> get subpages {
  if (_subpages is EqualUnmodifiableListView) return _subpages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subpages);
}

 final  List<EndpointFilter> _filters;
@override@JsonKey() List<EndpointFilter> get filters {
  if (_filters is EqualUnmodifiableListView) return _filters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filters);
}

@override@JsonKey() final  SelectorScript filterScript;
@override@JsonKey() final  String autocompleteSplitChar;
@override@JsonKey() final  int autocompleteTimeout;

/// Create a copy of EndpointPresentation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EndpointPresentationCopyWith<_EndpointPresentation> get copyWith => __$EndpointPresentationCopyWithImpl<_EndpointPresentation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EndpointPresentationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EndpointPresentation&&const DeepCollectionEquality().equals(other._subpages, _subpages)&&const DeepCollectionEquality().equals(other._filters, _filters)&&(identical(other.filterScript, filterScript) || other.filterScript == filterScript)&&(identical(other.autocompleteSplitChar, autocompleteSplitChar) || other.autocompleteSplitChar == autocompleteSplitChar)&&(identical(other.autocompleteTimeout, autocompleteTimeout) || other.autocompleteTimeout == autocompleteTimeout));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_subpages),const DeepCollectionEquality().hash(_filters),filterScript,autocompleteSplitChar,autocompleteTimeout);

@override
String toString() {
  return 'EndpointPresentation(subpages: $subpages, filters: $filters, filterScript: $filterScript, autocompleteSplitChar: $autocompleteSplitChar, autocompleteTimeout: $autocompleteTimeout)';
}


}

/// @nodoc
abstract mixin class _$EndpointPresentationCopyWith<$Res> implements $EndpointPresentationCopyWith<$Res> {
  factory _$EndpointPresentationCopyWith(_EndpointPresentation value, $Res Function(_EndpointPresentation) _then) = __$EndpointPresentationCopyWithImpl;
@override @useResult
$Res call({
 List<EndpointSubpage> subpages, List<EndpointFilter> filters, SelectorScript filterScript, String autocompleteSplitChar, int autocompleteTimeout
});


@override $SelectorScriptCopyWith<$Res> get filterScript;

}
/// @nodoc
class __$EndpointPresentationCopyWithImpl<$Res>
    implements _$EndpointPresentationCopyWith<$Res> {
  __$EndpointPresentationCopyWithImpl(this._self, this._then);

  final _EndpointPresentation _self;
  final $Res Function(_EndpointPresentation) _then;

/// Create a copy of EndpointPresentation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subpages = null,Object? filters = null,Object? filterScript = null,Object? autocompleteSplitChar = null,Object? autocompleteTimeout = null,}) {
  return _then(_EndpointPresentation(
subpages: null == subpages ? _self._subpages : subpages // ignore: cast_nullable_to_non_nullable
as List<EndpointSubpage>,filters: null == filters ? _self._filters : filters // ignore: cast_nullable_to_non_nullable
as List<EndpointFilter>,filterScript: null == filterScript ? _self.filterScript : filterScript // ignore: cast_nullable_to_non_nullable
as SelectorScript,autocompleteSplitChar: null == autocompleteSplitChar ? _self.autocompleteSplitChar : autocompleteSplitChar // ignore: cast_nullable_to_non_nullable
as String,autocompleteTimeout: null == autocompleteTimeout ? _self.autocompleteTimeout : autocompleteTimeout // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of EndpointPresentation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectorScriptCopyWith<$Res> get filterScript {
  
  return $SelectorScriptCopyWith<$Res>(_self.filterScript, (value) {
    return _then(_self.copyWith(filterScript: value));
  });
}
}


/// @nodoc
mixin _$EndpointLinks {

@JsonKey(includeIfNull: false) String? get item;@JsonKey(includeIfNull: false) String? get autocomplete;@JsonKey(includeIfNull: false) String? get reader;
/// Create a copy of EndpointLinks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EndpointLinksCopyWith<EndpointLinks> get copyWith => _$EndpointLinksCopyWithImpl<EndpointLinks>(this as EndpointLinks, _$identity);

  /// Serializes this EndpointLinks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EndpointLinks&&(identical(other.item, item) || other.item == item)&&(identical(other.autocomplete, autocomplete) || other.autocomplete == autocomplete)&&(identical(other.reader, reader) || other.reader == reader));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,item,autocomplete,reader);

@override
String toString() {
  return 'EndpointLinks(item: $item, autocomplete: $autocomplete, reader: $reader)';
}


}

/// @nodoc
abstract mixin class $EndpointLinksCopyWith<$Res>  {
  factory $EndpointLinksCopyWith(EndpointLinks value, $Res Function(EndpointLinks) _then) = _$EndpointLinksCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? item,@JsonKey(includeIfNull: false) String? autocomplete,@JsonKey(includeIfNull: false) String? reader
});




}
/// @nodoc
class _$EndpointLinksCopyWithImpl<$Res>
    implements $EndpointLinksCopyWith<$Res> {
  _$EndpointLinksCopyWithImpl(this._self, this._then);

  final EndpointLinks _self;
  final $Res Function(EndpointLinks) _then;

/// Create a copy of EndpointLinks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = freezed,Object? autocomplete = freezed,Object? reader = freezed,}) {
  return _then(_self.copyWith(
item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String?,autocomplete: freezed == autocomplete ? _self.autocomplete : autocomplete // ignore: cast_nullable_to_non_nullable
as String?,reader: freezed == reader ? _self.reader : reader // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EndpointLinks].
extension EndpointLinksPatterns on EndpointLinks {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EndpointLinks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EndpointLinks() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EndpointLinks value)  $default,){
final _that = this;
switch (_that) {
case _EndpointLinks():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EndpointLinks value)?  $default,){
final _that = this;
switch (_that) {
case _EndpointLinks() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? item, @JsonKey(includeIfNull: false)  String? autocomplete, @JsonKey(includeIfNull: false)  String? reader)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EndpointLinks() when $default != null:
return $default(_that.item,_that.autocomplete,_that.reader);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? item, @JsonKey(includeIfNull: false)  String? autocomplete, @JsonKey(includeIfNull: false)  String? reader)  $default,) {final _that = this;
switch (_that) {
case _EndpointLinks():
return $default(_that.item,_that.autocomplete,_that.reader);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? item, @JsonKey(includeIfNull: false)  String? autocomplete, @JsonKey(includeIfNull: false)  String? reader)?  $default,) {final _that = this;
switch (_that) {
case _EndpointLinks() when $default != null:
return $default(_that.item,_that.autocomplete,_that.reader);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EndpointLinks extends EndpointLinks {
  const _EndpointLinks({@JsonKey(includeIfNull: false) this.item, @JsonKey(includeIfNull: false) this.autocomplete, @JsonKey(includeIfNull: false) this.reader}): super._();
  factory _EndpointLinks.fromJson(Map<String, dynamic> json) => _$EndpointLinksFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? item;
@override@JsonKey(includeIfNull: false) final  String? autocomplete;
@override@JsonKey(includeIfNull: false) final  String? reader;

/// Create a copy of EndpointLinks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EndpointLinksCopyWith<_EndpointLinks> get copyWith => __$EndpointLinksCopyWithImpl<_EndpointLinks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EndpointLinksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EndpointLinks&&(identical(other.item, item) || other.item == item)&&(identical(other.autocomplete, autocomplete) || other.autocomplete == autocomplete)&&(identical(other.reader, reader) || other.reader == reader));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,item,autocomplete,reader);

@override
String toString() {
  return 'EndpointLinks(item: $item, autocomplete: $autocomplete, reader: $reader)';
}


}

/// @nodoc
abstract mixin class _$EndpointLinksCopyWith<$Res> implements $EndpointLinksCopyWith<$Res> {
  factory _$EndpointLinksCopyWith(_EndpointLinks value, $Res Function(_EndpointLinks) _then) = __$EndpointLinksCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? item,@JsonKey(includeIfNull: false) String? autocomplete,@JsonKey(includeIfNull: false) String? reader
});




}
/// @nodoc
class __$EndpointLinksCopyWithImpl<$Res>
    implements _$EndpointLinksCopyWith<$Res> {
  __$EndpointLinksCopyWithImpl(this._self, this._then);

  final _EndpointLinks _self;
  final $Res Function(_EndpointLinks) _then;

/// Create a copy of EndpointLinks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = freezed,Object? autocomplete = freezed,Object? reader = freezed,}) {
  return _then(_EndpointLinks(
item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String?,autocomplete: freezed == autocomplete ? _self.autocomplete : autocomplete // ignore: cast_nullable_to_non_nullable
as String?,reader: freezed == reader ? _self.reader : reader // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RequestRule {

 RequestMethod get method; String get url;@FrozenJsonMapConverter() JsonMap get query;@FrozenJsonMapConverter() JsonMap get headers; RequestBodyRule get body; bool get idempotent;
/// Create a copy of RequestRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestRuleCopyWith<RequestRule> get copyWith => _$RequestRuleCopyWithImpl<RequestRule>(this as RequestRule, _$identity);

  /// Serializes this RequestRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestRule&&(identical(other.method, method) || other.method == method)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.query, query)&&const DeepCollectionEquality().equals(other.headers, headers)&&(identical(other.body, body) || other.body == body)&&(identical(other.idempotent, idempotent) || other.idempotent == idempotent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,url,const DeepCollectionEquality().hash(query),const DeepCollectionEquality().hash(headers),body,idempotent);

@override
String toString() {
  return 'RequestRule(method: $method, url: $url, query: $query, headers: $headers, body: $body, idempotent: $idempotent)';
}


}

/// @nodoc
abstract mixin class $RequestRuleCopyWith<$Res>  {
  factory $RequestRuleCopyWith(RequestRule value, $Res Function(RequestRule) _then) = _$RequestRuleCopyWithImpl;
@useResult
$Res call({
 RequestMethod method, String url,@FrozenJsonMapConverter() JsonMap query,@FrozenJsonMapConverter() JsonMap headers, RequestBodyRule body, bool idempotent
});


$RequestBodyRuleCopyWith<$Res> get body;

}
/// @nodoc
class _$RequestRuleCopyWithImpl<$Res>
    implements $RequestRuleCopyWith<$Res> {
  _$RequestRuleCopyWithImpl(this._self, this._then);

  final RequestRule _self;
  final $Res Function(RequestRule) _then;

/// Create a copy of RequestRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? url = null,Object? query = null,Object? headers = null,Object? body = null,Object? idempotent = null,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as RequestMethod,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as JsonMap,headers: null == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as JsonMap,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as RequestBodyRule,idempotent: null == idempotent ? _self.idempotent : idempotent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of RequestRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestBodyRuleCopyWith<$Res> get body {
  
  return $RequestBodyRuleCopyWith<$Res>(_self.body, (value) {
    return _then(_self.copyWith(body: value));
  });
}
}


/// Adds pattern-matching-related methods to [RequestRule].
extension RequestRulePatterns on RequestRule {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestRule() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestRule value)  $default,){
final _that = this;
switch (_that) {
case _RequestRule():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestRule value)?  $default,){
final _that = this;
switch (_that) {
case _RequestRule() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RequestMethod method,  String url, @FrozenJsonMapConverter()  JsonMap query, @FrozenJsonMapConverter()  JsonMap headers,  RequestBodyRule body,  bool idempotent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestRule() when $default != null:
return $default(_that.method,_that.url,_that.query,_that.headers,_that.body,_that.idempotent);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RequestMethod method,  String url, @FrozenJsonMapConverter()  JsonMap query, @FrozenJsonMapConverter()  JsonMap headers,  RequestBodyRule body,  bool idempotent)  $default,) {final _that = this;
switch (_that) {
case _RequestRule():
return $default(_that.method,_that.url,_that.query,_that.headers,_that.body,_that.idempotent);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RequestMethod method,  String url, @FrozenJsonMapConverter()  JsonMap query, @FrozenJsonMapConverter()  JsonMap headers,  RequestBodyRule body,  bool idempotent)?  $default,) {final _that = this;
switch (_that) {
case _RequestRule() when $default != null:
return $default(_that.method,_that.url,_that.query,_that.headers,_that.body,_that.idempotent);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RequestRule extends RequestRule {
  const _RequestRule({required this.method, required this.url, @FrozenJsonMapConverter() final  JsonMap query = const <String, Object?>{}, @FrozenJsonMapConverter() final  JsonMap headers = const <String, Object?>{}, this.body = const RequestBodyRule.none(), this.idempotent = false}): _query = query,_headers = headers,super._();
  factory _RequestRule.fromJson(Map<String, dynamic> json) => _$RequestRuleFromJson(json);

@override final  RequestMethod method;
@override final  String url;
 final  JsonMap _query;
@override@JsonKey()@FrozenJsonMapConverter() JsonMap get query {
  if (_query is EqualUnmodifiableMapView) return _query;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_query);
}

 final  JsonMap _headers;
@override@JsonKey()@FrozenJsonMapConverter() JsonMap get headers {
  if (_headers is EqualUnmodifiableMapView) return _headers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_headers);
}

@override@JsonKey() final  RequestBodyRule body;
@override@JsonKey() final  bool idempotent;

/// Create a copy of RequestRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestRuleCopyWith<_RequestRule> get copyWith => __$RequestRuleCopyWithImpl<_RequestRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestRule&&(identical(other.method, method) || other.method == method)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other._query, _query)&&const DeepCollectionEquality().equals(other._headers, _headers)&&(identical(other.body, body) || other.body == body)&&(identical(other.idempotent, idempotent) || other.idempotent == idempotent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,url,const DeepCollectionEquality().hash(_query),const DeepCollectionEquality().hash(_headers),body,idempotent);

@override
String toString() {
  return 'RequestRule(method: $method, url: $url, query: $query, headers: $headers, body: $body, idempotent: $idempotent)';
}


}

/// @nodoc
abstract mixin class _$RequestRuleCopyWith<$Res> implements $RequestRuleCopyWith<$Res> {
  factory _$RequestRuleCopyWith(_RequestRule value, $Res Function(_RequestRule) _then) = __$RequestRuleCopyWithImpl;
@override @useResult
$Res call({
 RequestMethod method, String url,@FrozenJsonMapConverter() JsonMap query,@FrozenJsonMapConverter() JsonMap headers, RequestBodyRule body, bool idempotent
});


@override $RequestBodyRuleCopyWith<$Res> get body;

}
/// @nodoc
class __$RequestRuleCopyWithImpl<$Res>
    implements _$RequestRuleCopyWith<$Res> {
  __$RequestRuleCopyWithImpl(this._self, this._then);

  final _RequestRule _self;
  final $Res Function(_RequestRule) _then;

/// Create a copy of RequestRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? url = null,Object? query = null,Object? headers = null,Object? body = null,Object? idempotent = null,}) {
  return _then(_RequestRule(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as RequestMethod,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,query: null == query ? _self._query : query // ignore: cast_nullable_to_non_nullable
as JsonMap,headers: null == headers ? _self._headers : headers // ignore: cast_nullable_to_non_nullable
as JsonMap,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as RequestBodyRule,idempotent: null == idempotent ? _self.idempotent : idempotent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of RequestRule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestBodyRuleCopyWith<$Res> get body {
  
  return $RequestBodyRuleCopyWith<$Res>(_self.body, (value) {
    return _then(_self.copyWith(body: value));
  });
}
}

RequestBodyRule _$RequestBodyRuleFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'none':
          return NoRequestBodyRule.fromJson(
            json
          );
                case 'json':
          return JsonRequestBodyRule.fromJson(
            json
          );
                case 'form':
          return FormRequestBodyRule.fromJson(
            json
          );
                case 'text':
          return TextRequestBodyRule.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'RequestBodyRule',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$RequestBodyRule {



  /// Serializes this RequestBodyRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestBodyRule);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RequestBodyRule()';
}


}

/// @nodoc
class $RequestBodyRuleCopyWith<$Res>  {
$RequestBodyRuleCopyWith(RequestBodyRule _, $Res Function(RequestBodyRule) __);
}


/// Adds pattern-matching-related methods to [RequestBodyRule].
extension RequestBodyRulePatterns on RequestBodyRule {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NoRequestBodyRule value)?  none,TResult Function( JsonRequestBodyRule value)?  json,TResult Function( FormRequestBodyRule value)?  form,TResult Function( TextRequestBodyRule value)?  text,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NoRequestBodyRule() when none != null:
return none(_that);case JsonRequestBodyRule() when json != null:
return json(_that);case FormRequestBodyRule() when form != null:
return form(_that);case TextRequestBodyRule() when text != null:
return text(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NoRequestBodyRule value)  none,required TResult Function( JsonRequestBodyRule value)  json,required TResult Function( FormRequestBodyRule value)  form,required TResult Function( TextRequestBodyRule value)  text,}){
final _that = this;
switch (_that) {
case NoRequestBodyRule():
return none(_that);case JsonRequestBodyRule():
return json(_that);case FormRequestBodyRule():
return form(_that);case TextRequestBodyRule():
return text(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NoRequestBodyRule value)?  none,TResult? Function( JsonRequestBodyRule value)?  json,TResult? Function( FormRequestBodyRule value)?  form,TResult? Function( TextRequestBodyRule value)?  text,}){
final _that = this;
switch (_that) {
case NoRequestBodyRule() when none != null:
return none(_that);case JsonRequestBodyRule() when json != null:
return json(_that);case FormRequestBodyRule() when form != null:
return form(_that);case TextRequestBodyRule() when text != null:
return text(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function(@FrozenJsonValueConverter()  Object? value)?  json,TResult Function(@FrozenJsonMapConverter()  JsonMap fields)?  form,TResult Function( String value)?  text,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NoRequestBodyRule() when none != null:
return none();case JsonRequestBodyRule() when json != null:
return json(_that.value);case FormRequestBodyRule() when form != null:
return form(_that.fields);case TextRequestBodyRule() when text != null:
return text(_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function(@FrozenJsonValueConverter()  Object? value)  json,required TResult Function(@FrozenJsonMapConverter()  JsonMap fields)  form,required TResult Function( String value)  text,}) {final _that = this;
switch (_that) {
case NoRequestBodyRule():
return none();case JsonRequestBodyRule():
return json(_that.value);case FormRequestBodyRule():
return form(_that.fields);case TextRequestBodyRule():
return text(_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function(@FrozenJsonValueConverter()  Object? value)?  json,TResult? Function(@FrozenJsonMapConverter()  JsonMap fields)?  form,TResult? Function( String value)?  text,}) {final _that = this;
switch (_that) {
case NoRequestBodyRule() when none != null:
return none();case JsonRequestBodyRule() when json != null:
return json(_that.value);case FormRequestBodyRule() when form != null:
return form(_that.fields);case TextRequestBodyRule() when text != null:
return text(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class NoRequestBodyRule implements RequestBodyRule {
  const NoRequestBodyRule({final  String? $type}): $type = $type ?? 'none';
  factory NoRequestBodyRule.fromJson(Map<String, dynamic> json) => _$NoRequestBodyRuleFromJson(json);



@JsonKey(name: 'type')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$NoRequestBodyRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoRequestBodyRule);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RequestBodyRule.none()';
}


}




/// @nodoc
@JsonSerializable()

class JsonRequestBodyRule implements RequestBodyRule {
  const JsonRequestBodyRule(@FrozenJsonValueConverter() this.value, {final  String? $type}): $type = $type ?? 'json';
  factory JsonRequestBodyRule.fromJson(Map<String, dynamic> json) => _$JsonRequestBodyRuleFromJson(json);

@FrozenJsonValueConverter() final  Object? value;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RequestBodyRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JsonRequestBodyRuleCopyWith<JsonRequestBodyRule> get copyWith => _$JsonRequestBodyRuleCopyWithImpl<JsonRequestBodyRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JsonRequestBodyRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonRequestBodyRule&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'RequestBodyRule.json(value: $value)';
}


}

/// @nodoc
abstract mixin class $JsonRequestBodyRuleCopyWith<$Res> implements $RequestBodyRuleCopyWith<$Res> {
  factory $JsonRequestBodyRuleCopyWith(JsonRequestBodyRule value, $Res Function(JsonRequestBodyRule) _then) = _$JsonRequestBodyRuleCopyWithImpl;
@useResult
$Res call({
@FrozenJsonValueConverter() Object? value
});




}
/// @nodoc
class _$JsonRequestBodyRuleCopyWithImpl<$Res>
    implements $JsonRequestBodyRuleCopyWith<$Res> {
  _$JsonRequestBodyRuleCopyWithImpl(this._self, this._then);

  final JsonRequestBodyRule _self;
  final $Res Function(JsonRequestBodyRule) _then;

/// Create a copy of RequestBodyRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,}) {
  return _then(JsonRequestBodyRule(
freezed == value ? _self.value : value ,
  ));
}


}

/// @nodoc
@JsonSerializable()

class FormRequestBodyRule implements RequestBodyRule {
  const FormRequestBodyRule(@FrozenJsonMapConverter() final  JsonMap fields, {final  String? $type}): _fields = fields,$type = $type ?? 'form';
  factory FormRequestBodyRule.fromJson(Map<String, dynamic> json) => _$FormRequestBodyRuleFromJson(json);

 final  JsonMap _fields;
@FrozenJsonMapConverter() JsonMap get fields {
  if (_fields is EqualUnmodifiableMapView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fields);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of RequestBodyRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormRequestBodyRuleCopyWith<FormRequestBodyRule> get copyWith => _$FormRequestBodyRuleCopyWithImpl<FormRequestBodyRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormRequestBodyRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormRequestBodyRule&&const DeepCollectionEquality().equals(other._fields, _fields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_fields));

@override
String toString() {
  return 'RequestBodyRule.form(fields: $fields)';
}


}

/// @nodoc
abstract mixin class $FormRequestBodyRuleCopyWith<$Res> implements $RequestBodyRuleCopyWith<$Res> {
  factory $FormRequestBodyRuleCopyWith(FormRequestBodyRule value, $Res Function(FormRequestBodyRule) _then) = _$FormRequestBodyRuleCopyWithImpl;
@useResult
$Res call({
@FrozenJsonMapConverter() JsonMap fields
});




}
/// @nodoc
class _$FormRequestBodyRuleCopyWithImpl<$Res>
    implements $FormRequestBodyRuleCopyWith<$Res> {
  _$FormRequestBodyRuleCopyWithImpl(this._self, this._then);

  final FormRequestBodyRule _self;
  final $Res Function(FormRequestBodyRule) _then;

/// Create a copy of RequestBodyRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fields = null,}) {
  return _then(FormRequestBodyRule(
null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as JsonMap,
  ));
}


}

/// @nodoc
@JsonSerializable()

class TextRequestBodyRule implements RequestBodyRule {
  const TextRequestBodyRule(this.value, {final  String? $type}): $type = $type ?? 'text';
  factory TextRequestBodyRule.fromJson(Map<String, dynamic> json) => _$TextRequestBodyRuleFromJson(json);

 final  String value;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RequestBodyRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextRequestBodyRuleCopyWith<TextRequestBodyRule> get copyWith => _$TextRequestBodyRuleCopyWithImpl<TextRequestBodyRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextRequestBodyRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextRequestBodyRule&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'RequestBodyRule.text(value: $value)';
}


}

/// @nodoc
abstract mixin class $TextRequestBodyRuleCopyWith<$Res> implements $RequestBodyRuleCopyWith<$Res> {
  factory $TextRequestBodyRuleCopyWith(TextRequestBodyRule value, $Res Function(TextRequestBodyRule) _then) = _$TextRequestBodyRuleCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$TextRequestBodyRuleCopyWithImpl<$Res>
    implements $TextRequestBodyRuleCopyWith<$Res> {
  _$TextRequestBodyRuleCopyWithImpl(this._self, this._then);

  final TextRequestBodyRule _self;
  final $Res Function(TextRequestBodyRule) _then;

/// Create a copy of RequestBodyRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(TextRequestBodyRule(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

PaginationRule _$PaginationRuleFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'none':
          return NoPaginationRule.fromJson(
            json
          );
                case 'pageNumber':
          return PageNumberPaginationRule.fromJson(
            json
          );
                case 'continuation':
          return ContinuationPaginationRule.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'PaginationRule',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$PaginationRule {



  /// Serializes this PaginationRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationRule);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaginationRule()';
}


}

/// @nodoc
class $PaginationRuleCopyWith<$Res>  {
$PaginationRuleCopyWith(PaginationRule _, $Res Function(PaginationRule) __);
}


/// Adds pattern-matching-related methods to [PaginationRule].
extension PaginationRulePatterns on PaginationRule {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NoPaginationRule value)?  none,TResult Function( PageNumberPaginationRule value)?  pageNumber,TResult Function( ContinuationPaginationRule value)?  continuation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NoPaginationRule() when none != null:
return none(_that);case PageNumberPaginationRule() when pageNumber != null:
return pageNumber(_that);case ContinuationPaginationRule() when continuation != null:
return continuation(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NoPaginationRule value)  none,required TResult Function( PageNumberPaginationRule value)  pageNumber,required TResult Function( ContinuationPaginationRule value)  continuation,}){
final _that = this;
switch (_that) {
case NoPaginationRule():
return none(_that);case PageNumberPaginationRule():
return pageNumber(_that);case ContinuationPaginationRule():
return continuation(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NoPaginationRule value)?  none,TResult? Function( PageNumberPaginationRule value)?  pageNumber,TResult? Function( ContinuationPaginationRule value)?  continuation,}){
final _that = this;
switch (_that) {
case NoPaginationRule() when none != null:
return none(_that);case PageNumberPaginationRule() when pageNumber != null:
return pageNumber(_that);case ContinuationPaginationRule() when continuation != null:
return continuation(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function( String variable,  int initial,  int step,  int pageSize,  PageEndCondition endCondition)?  pageNumber,TResult Function( ContinuationTarget target, @JsonKey(includeIfNull: false)  String? variable,  String responseField)?  continuation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NoPaginationRule() when none != null:
return none();case PageNumberPaginationRule() when pageNumber != null:
return pageNumber(_that.variable,_that.initial,_that.step,_that.pageSize,_that.endCondition);case ContinuationPaginationRule() when continuation != null:
return continuation(_that.target,_that.variable,_that.responseField);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function( String variable,  int initial,  int step,  int pageSize,  PageEndCondition endCondition)  pageNumber,required TResult Function( ContinuationTarget target, @JsonKey(includeIfNull: false)  String? variable,  String responseField)  continuation,}) {final _that = this;
switch (_that) {
case NoPaginationRule():
return none();case PageNumberPaginationRule():
return pageNumber(_that.variable,_that.initial,_that.step,_that.pageSize,_that.endCondition);case ContinuationPaginationRule():
return continuation(_that.target,_that.variable,_that.responseField);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function( String variable,  int initial,  int step,  int pageSize,  PageEndCondition endCondition)?  pageNumber,TResult? Function( ContinuationTarget target, @JsonKey(includeIfNull: false)  String? variable,  String responseField)?  continuation,}) {final _that = this;
switch (_that) {
case NoPaginationRule() when none != null:
return none();case PageNumberPaginationRule() when pageNumber != null:
return pageNumber(_that.variable,_that.initial,_that.step,_that.pageSize,_that.endCondition);case ContinuationPaginationRule() when continuation != null:
return continuation(_that.target,_that.variable,_that.responseField);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class NoPaginationRule implements PaginationRule {
  const NoPaginationRule({final  String? $type}): $type = $type ?? 'none';
  factory NoPaginationRule.fromJson(Map<String, dynamic> json) => _$NoPaginationRuleFromJson(json);



@JsonKey(name: 'type')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$NoPaginationRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoPaginationRule);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaginationRule.none()';
}


}




/// @nodoc
@JsonSerializable()

class PageNumberPaginationRule implements PaginationRule {
  const PageNumberPaginationRule({required this.variable, required this.initial, required this.step, required this.pageSize, required this.endCondition, final  String? $type}): $type = $type ?? 'pageNumber';
  factory PageNumberPaginationRule.fromJson(Map<String, dynamic> json) => _$PageNumberPaginationRuleFromJson(json);

 final  String variable;
 final  int initial;
 final  int step;
 final  int pageSize;
 final  PageEndCondition endCondition;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of PaginationRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageNumberPaginationRuleCopyWith<PageNumberPaginationRule> get copyWith => _$PageNumberPaginationRuleCopyWithImpl<PageNumberPaginationRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PageNumberPaginationRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageNumberPaginationRule&&(identical(other.variable, variable) || other.variable == variable)&&(identical(other.initial, initial) || other.initial == initial)&&(identical(other.step, step) || other.step == step)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.endCondition, endCondition) || other.endCondition == endCondition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variable,initial,step,pageSize,endCondition);

@override
String toString() {
  return 'PaginationRule.pageNumber(variable: $variable, initial: $initial, step: $step, pageSize: $pageSize, endCondition: $endCondition)';
}


}

/// @nodoc
abstract mixin class $PageNumberPaginationRuleCopyWith<$Res> implements $PaginationRuleCopyWith<$Res> {
  factory $PageNumberPaginationRuleCopyWith(PageNumberPaginationRule value, $Res Function(PageNumberPaginationRule) _then) = _$PageNumberPaginationRuleCopyWithImpl;
@useResult
$Res call({
 String variable, int initial, int step, int pageSize, PageEndCondition endCondition
});




}
/// @nodoc
class _$PageNumberPaginationRuleCopyWithImpl<$Res>
    implements $PageNumberPaginationRuleCopyWith<$Res> {
  _$PageNumberPaginationRuleCopyWithImpl(this._self, this._then);

  final PageNumberPaginationRule _self;
  final $Res Function(PageNumberPaginationRule) _then;

/// Create a copy of PaginationRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? variable = null,Object? initial = null,Object? step = null,Object? pageSize = null,Object? endCondition = null,}) {
  return _then(PageNumberPaginationRule(
variable: null == variable ? _self.variable : variable // ignore: cast_nullable_to_non_nullable
as String,initial: null == initial ? _self.initial : initial // ignore: cast_nullable_to_non_nullable
as int,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,endCondition: null == endCondition ? _self.endCondition : endCondition // ignore: cast_nullable_to_non_nullable
as PageEndCondition,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ContinuationPaginationRule implements PaginationRule {
  const ContinuationPaginationRule({required this.target, @JsonKey(includeIfNull: false) this.variable, this.responseField = 'continuation', final  String? $type}): $type = $type ?? 'continuation';
  factory ContinuationPaginationRule.fromJson(Map<String, dynamic> json) => _$ContinuationPaginationRuleFromJson(json);

 final  ContinuationTarget target;
@JsonKey(includeIfNull: false) final  String? variable;
@JsonKey() final  String responseField;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of PaginationRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContinuationPaginationRuleCopyWith<ContinuationPaginationRule> get copyWith => _$ContinuationPaginationRuleCopyWithImpl<ContinuationPaginationRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContinuationPaginationRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinuationPaginationRule&&(identical(other.target, target) || other.target == target)&&(identical(other.variable, variable) || other.variable == variable)&&(identical(other.responseField, responseField) || other.responseField == responseField));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,target,variable,responseField);

@override
String toString() {
  return 'PaginationRule.continuation(target: $target, variable: $variable, responseField: $responseField)';
}


}

/// @nodoc
abstract mixin class $ContinuationPaginationRuleCopyWith<$Res> implements $PaginationRuleCopyWith<$Res> {
  factory $ContinuationPaginationRuleCopyWith(ContinuationPaginationRule value, $Res Function(ContinuationPaginationRule) _then) = _$ContinuationPaginationRuleCopyWithImpl;
@useResult
$Res call({
 ContinuationTarget target,@JsonKey(includeIfNull: false) String? variable, String responseField
});




}
/// @nodoc
class _$ContinuationPaginationRuleCopyWithImpl<$Res>
    implements $ContinuationPaginationRuleCopyWith<$Res> {
  _$ContinuationPaginationRuleCopyWithImpl(this._self, this._then);

  final ContinuationPaginationRule _self;
  final $Res Function(ContinuationPaginationRule) _then;

/// Create a copy of PaginationRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? target = null,Object? variable = freezed,Object? responseField = null,}) {
  return _then(ContinuationPaginationRule(
target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as ContinuationTarget,variable: freezed == variable ? _self.variable : variable // ignore: cast_nullable_to_non_nullable
as String?,responseField: null == responseField ? _self.responseField : responseField // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
