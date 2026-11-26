// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EnvResult {

 String get id; bool get global; String? get value;
/// Create a copy of EnvResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnvResultCopyWith<EnvResult> get copyWith => _$EnvResultCopyWithImpl<EnvResult>(this as EnvResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EnvResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnvResult&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.global, _this.global) || other.global == _this.global)&&(identical(other.value, _this.value) || other.value == _this.value));
}


@override
int get hashCode {
  final _this = this as EnvResult;
  return Object.hash(runtimeType,_this.id,_this.global,_this.value);
}

@override
String toString() {
  final _this = this as EnvResult;
  return 'EnvResult(id: ${_this.id}, global: ${_this.global}, value: ${_this.value})';
}


}

/// @nodoc
abstract mixin class $EnvResultCopyWith<$Res>  {
  factory $EnvResultCopyWith(EnvResult value, $Res Function(EnvResult) _then) = _$EnvResultCopyWithImpl;
@useResult
$Res call({
 String id, bool global, String? value
});




}
/// @nodoc
class _$EnvResultCopyWithImpl<$Res>
    implements $EnvResultCopyWith<$Res> {
  _$EnvResultCopyWithImpl(this._self, this._then);

  final EnvResult _self;
  final $Res Function(EnvResult) _then;

/// Create a copy of EnvResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? global = null,Object? value = freezed,}) {
  return _then(EnvResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,global: null == global ? _self.global : global // ignore: cast_nullable_to_non_nullable
as bool,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EnvResult].
extension EnvResultPatterns on EnvResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EnvResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EnvResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EnvResult value)  $default,){
final _that = this;
switch (_that) {
case _EnvResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EnvResult value)?  $default,){
final _that = this;
switch (_that) {
case _EnvResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  bool global,  String? value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnvResult() when $default != null:
return $default(_that.id,_that.global,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  bool global,  String? value)  $default,) {final _that = this;
switch (_that) {
case _EnvResult():
return $default(_that.id,_that.global,_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  bool global,  String? value)?  $default,) {final _that = this;
switch (_that) {
case _EnvResult() when $default != null:
return $default(_that.id,_that.global,_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _EnvResult implements EnvResult {
  const _EnvResult({required this.id, required this.global, this.value});
  

@override final  String id;
@override final  bool global;
@override final  String? value;

/// Create a copy of EnvResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnvResultCopyWith<_EnvResult> get copyWith => __$EnvResultCopyWithImpl<_EnvResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnvResult&&(identical(other.id, id) || other.id == id)&&(identical(other.global, global) || other.global == global)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,global,value);
}

@override
String toString() {
    return 'EnvResult(id: $id, global: $global, value: $value)';
}


}

/// @nodoc
abstract mixin class _$EnvResultCopyWith<$Res> implements $EnvResultCopyWith<$Res> {
  factory _$EnvResultCopyWith(_EnvResult value, $Res Function(_EnvResult) _then) = __$EnvResultCopyWithImpl;
@override @useResult
$Res call({
 String id, bool global, String? value
});




}
/// @nodoc
class __$EnvResultCopyWithImpl<$Res>
    implements _$EnvResultCopyWith<$Res> {
  __$EnvResultCopyWithImpl(this._self, this._then);

  final _EnvResult _self;
  final $Res Function(_EnvResult) _then;

/// Create a copy of EnvResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? global = null,Object? value = freezed,}) {
  return _then(_EnvResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,global: null == global ? _self.global : global // ignore: cast_nullable_to_non_nullable
as bool,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ImageResult {

 String? get url; String? get cacheKey; double? get width; double? get height; double? get x; double? get y;
/// Create a copy of ImageResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageResultCopyWith<ImageResult> get copyWith => _$ImageResultCopyWithImpl<ImageResult>(this as ImageResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ImageResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageResult&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.cacheKey, _this.cacheKey) || other.cacheKey == _this.cacheKey)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.x, _this.x) || other.x == _this.x)&&(identical(other.y, _this.y) || other.y == _this.y));
}


@override
int get hashCode {
  final _this = this as ImageResult;
  return Object.hash(runtimeType,_this.url,_this.cacheKey,_this.width,_this.height,_this.x,_this.y);
}

@override
String toString() {
  final _this = this as ImageResult;
  return 'ImageResult(url: ${_this.url}, cacheKey: ${_this.cacheKey}, width: ${_this.width}, height: ${_this.height}, x: ${_this.x}, y: ${_this.y})';
}


}

/// @nodoc
abstract mixin class $ImageResultCopyWith<$Res>  {
  factory $ImageResultCopyWith(ImageResult value, $Res Function(ImageResult) _then) = _$ImageResultCopyWithImpl;
@useResult
$Res call({
 String? url, String? cacheKey, double? width, double? height, double? x, double? y
});




}
/// @nodoc
class _$ImageResultCopyWithImpl<$Res>
    implements $ImageResultCopyWith<$Res> {
  _$ImageResultCopyWithImpl(this._self, this._then);

  final ImageResult _self;
  final $Res Function(ImageResult) _then;

/// Create a copy of ImageResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? cacheKey = freezed,Object? width = freezed,Object? height = freezed,Object? x = freezed,Object? y = freezed,}) {
  return _then(ImageResult(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,cacheKey: freezed == cacheKey ? _self.cacheKey : cacheKey // ignore: cast_nullable_to_non_nullable
as String?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,x: freezed == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double?,y: freezed == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageResult].
extension ImageResultPatterns on ImageResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageResult value)  $default,){
final _that = this;
switch (_that) {
case _ImageResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageResult value)?  $default,){
final _that = this;
switch (_that) {
case _ImageResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? url,  String? cacheKey,  double? width,  double? height,  double? x,  double? y)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageResult() when $default != null:
return $default(_that.url,_that.cacheKey,_that.width,_that.height,_that.x,_that.y);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? url,  String? cacheKey,  double? width,  double? height,  double? x,  double? y)  $default,) {final _that = this;
switch (_that) {
case _ImageResult():
return $default(_that.url,_that.cacheKey,_that.width,_that.height,_that.x,_that.y);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? url,  String? cacheKey,  double? width,  double? height,  double? x,  double? y)?  $default,) {final _that = this;
switch (_that) {
case _ImageResult() when $default != null:
return $default(_that.url,_that.cacheKey,_that.width,_that.height,_that.x,_that.y);case _:
  return null;

}
}

}

/// @nodoc


class _ImageResult implements ImageResult {
  const _ImageResult({this.url, this.cacheKey, this.width, this.height, this.x, this.y});
  

@override final  String? url;
@override final  String? cacheKey;
@override final  double? width;
@override final  double? height;
@override final  double? x;
@override final  double? y;

/// Create a copy of ImageResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageResultCopyWith<_ImageResult> get copyWith => __$ImageResultCopyWithImpl<_ImageResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageResult&&(identical(other.url, url) || other.url == url)&&(identical(other.cacheKey, cacheKey) || other.cacheKey == cacheKey)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}


@override
int get hashCode {
    return Object.hash(runtimeType,url,cacheKey,width,height,x,y);
}

@override
String toString() {
    return 'ImageResult(url: $url, cacheKey: $cacheKey, width: $width, height: $height, x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class _$ImageResultCopyWith<$Res> implements $ImageResultCopyWith<$Res> {
  factory _$ImageResultCopyWith(_ImageResult value, $Res Function(_ImageResult) _then) = __$ImageResultCopyWithImpl;
@override @useResult
$Res call({
 String? url, String? cacheKey, double? width, double? height, double? x, double? y
});




}
/// @nodoc
class __$ImageResultCopyWithImpl<$Res>
    implements _$ImageResultCopyWith<$Res> {
  __$ImageResultCopyWithImpl(this._self, this._then);

  final _ImageResult _self;
  final $Res Function(_ImageResult) _then;

/// Create a copy of ImageResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? cacheKey = freezed,Object? width = freezed,Object? height = freezed,Object? x = freezed,Object? y = freezed,}) {
  return _then(_ImageResult(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,cacheKey: freezed == cacheKey ? _self.cacheKey : cacheKey // ignore: cast_nullable_to_non_nullable
as String?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,x: freezed == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double?,y: freezed == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$ListParserResult {

 List<ListParserResultItem> get items; String? get nextPage; bool? get isSuccess; String? get failMessage; List<EnvResult> get envs; List<ParseError> get errors;
/// Create a copy of ListParserResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListParserResultCopyWith<ListParserResult> get copyWith => _$ListParserResultCopyWithImpl<ListParserResult>(this as ListParserResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ListParserResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListParserResult&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.nextPage, _this.nextPage) || other.nextPage == _this.nextPage)&&(identical(other.isSuccess, _this.isSuccess) || other.isSuccess == _this.isSuccess)&&(identical(other.failMessage, _this.failMessage) || other.failMessage == _this.failMessage)&&const DeepCollectionEquality().equals(other.envs, _this.envs)&&const DeepCollectionEquality().equals(other.errors, _this.errors));
}


@override
int get hashCode {
  final _this = this as ListParserResult;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.nextPage,_this.isSuccess,_this.failMessage,const DeepCollectionEquality().hash(_this.envs),const DeepCollectionEquality().hash(_this.errors));
}

@override
String toString() {
  final _this = this as ListParserResult;
  return 'ListParserResult(items: ${_this.items}, nextPage: ${_this.nextPage}, isSuccess: ${_this.isSuccess}, failMessage: ${_this.failMessage}, envs: ${_this.envs}, errors: ${_this.errors})';
}


}

/// @nodoc
abstract mixin class $ListParserResultCopyWith<$Res>  {
  factory $ListParserResultCopyWith(ListParserResult value, $Res Function(ListParserResult) _then) = _$ListParserResultCopyWithImpl;
@useResult
$Res call({
 List<ListParserResultItem> items, String? nextPage, bool? isSuccess, String? failMessage, List<EnvResult> envs, List<ParseError> errors
});




}
/// @nodoc
class _$ListParserResultCopyWithImpl<$Res>
    implements $ListParserResultCopyWith<$Res> {
  _$ListParserResultCopyWithImpl(this._self, this._then);

  final ListParserResult _self;
  final $Res Function(ListParserResult) _then;

/// Create a copy of ListParserResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? nextPage = freezed,Object? isSuccess = freezed,Object? failMessage = freezed,Object? envs = null,Object? errors = null,}) {
  return _then(ListParserResult(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ListParserResultItem>,nextPage: freezed == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as String?,isSuccess: freezed == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool?,failMessage: freezed == failMessage ? _self.failMessage : failMessage // ignore: cast_nullable_to_non_nullable
as String?,envs: null == envs ? _self.envs : envs // ignore: cast_nullable_to_non_nullable
as List<EnvResult>,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<ParseError>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListParserResult].
extension ListParserResultPatterns on ListParserResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListParserResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListParserResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListParserResult value)  $default,){
final _that = this;
switch (_that) {
case _ListParserResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListParserResult value)?  $default,){
final _that = this;
switch (_that) {
case _ListParserResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ListParserResultItem> items,  String? nextPage,  bool? isSuccess,  String? failMessage,  List<EnvResult> envs,  List<ParseError> errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListParserResult() when $default != null:
return $default(_that.items,_that.nextPage,_that.isSuccess,_that.failMessage,_that.envs,_that.errors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ListParserResultItem> items,  String? nextPage,  bool? isSuccess,  String? failMessage,  List<EnvResult> envs,  List<ParseError> errors)  $default,) {final _that = this;
switch (_that) {
case _ListParserResult():
return $default(_that.items,_that.nextPage,_that.isSuccess,_that.failMessage,_that.envs,_that.errors);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ListParserResultItem> items,  String? nextPage,  bool? isSuccess,  String? failMessage,  List<EnvResult> envs,  List<ParseError> errors)?  $default,) {final _that = this;
switch (_that) {
case _ListParserResult() when $default != null:
return $default(_that.items,_that.nextPage,_that.isSuccess,_that.failMessage,_that.envs,_that.errors);case _:
  return null;

}
}

}

/// @nodoc


class _ListParserResult implements ListParserResult {
  const _ListParserResult({required  List<ListParserResultItem> items, this.nextPage, this.isSuccess, this.failMessage, required  List<EnvResult> envs, required  List<ParseError> errors}): _items = items,_envs = envs,_errors = errors;
  

 final  List<ListParserResultItem> _items;
@override List<ListParserResultItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? nextPage;
@override final  bool? isSuccess;
@override final  String? failMessage;
 final  List<EnvResult> _envs;
@override List<EnvResult> get envs {
  if (_envs is EqualUnmodifiableListView) return _envs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_envs);
}

 final  List<ParseError> _errors;
@override List<ParseError> get errors {
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_errors);
}


/// Create a copy of ListParserResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListParserResultCopyWith<_ListParserResult> get copyWith => __$ListParserResultCopyWithImpl<_ListParserResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListParserResult&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.nextPage, nextPage) || other.nextPage == nextPage)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.failMessage, failMessage) || other.failMessage == failMessage)&&const DeepCollectionEquality().equals(other.envs, _envs)&&const DeepCollectionEquality().equals(other.errors, _errors));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),nextPage,isSuccess,failMessage,const DeepCollectionEquality().hash(_envs),const DeepCollectionEquality().hash(_errors));
}

@override
String toString() {
    return 'ListParserResult(items: $items, nextPage: $nextPage, isSuccess: $isSuccess, failMessage: $failMessage, envs: $envs, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$ListParserResultCopyWith<$Res> implements $ListParserResultCopyWith<$Res> {
  factory _$ListParserResultCopyWith(_ListParserResult value, $Res Function(_ListParserResult) _then) = __$ListParserResultCopyWithImpl;
@override @useResult
$Res call({
 List<ListParserResultItem> items, String? nextPage, bool? isSuccess, String? failMessage, List<EnvResult> envs, List<ParseError> errors
});




}
/// @nodoc
class __$ListParserResultCopyWithImpl<$Res>
    implements _$ListParserResultCopyWith<$Res> {
  __$ListParserResultCopyWithImpl(this._self, this._then);

  final _ListParserResult _self;
  final $Res Function(_ListParserResult) _then;

/// Create a copy of ListParserResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? nextPage = freezed,Object? isSuccess = freezed,Object? failMessage = freezed,Object? envs = null,Object? errors = null,}) {
  return _then(_ListParserResult(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ListParserResultItem>,nextPage: freezed == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as String?,isSuccess: freezed == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool?,failMessage: freezed == failMessage ? _self.failMessage : failMessage // ignore: cast_nullable_to_non_nullable
as String?,envs: null == envs ? _self._envs : envs // ignore: cast_nullable_to_non_nullable
as List<EnvResult>,errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<ParseError>,
  ));
}


}

/// @nodoc
mixin _$ListParserResultItem {

 String? get title; String? get subtitle; String? get uploadTime; double? get star; int? get imageCount; ImageResult? get previewImage; List<TagResult> get badges; List<TagResult> get tags; String? get language; String? get idCode; String? get paper;
/// Create a copy of ListParserResultItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListParserResultItemCopyWith<ListParserResultItem> get copyWith => _$ListParserResultItemCopyWithImpl<ListParserResultItem>(this as ListParserResultItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ListParserResultItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListParserResultItem&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.subtitle, _this.subtitle) || other.subtitle == _this.subtitle)&&(identical(other.uploadTime, _this.uploadTime) || other.uploadTime == _this.uploadTime)&&(identical(other.star, _this.star) || other.star == _this.star)&&(identical(other.imageCount, _this.imageCount) || other.imageCount == _this.imageCount)&&(identical(other.previewImage, _this.previewImage) || other.previewImage == _this.previewImage)&&const DeepCollectionEquality().equals(other.badges, _this.badges)&&const DeepCollectionEquality().equals(other.tags, _this.tags)&&(identical(other.language, _this.language) || other.language == _this.language)&&(identical(other.idCode, _this.idCode) || other.idCode == _this.idCode)&&(identical(other.paper, _this.paper) || other.paper == _this.paper));
}


@override
int get hashCode {
  final _this = this as ListParserResultItem;
  return Object.hash(runtimeType,_this.title,_this.subtitle,_this.uploadTime,_this.star,_this.imageCount,_this.previewImage,const DeepCollectionEquality().hash(_this.badges),const DeepCollectionEquality().hash(_this.tags),_this.language,_this.idCode,_this.paper);
}

@override
String toString() {
  final _this = this as ListParserResultItem;
  return 'ListParserResultItem(title: ${_this.title}, subtitle: ${_this.subtitle}, uploadTime: ${_this.uploadTime}, star: ${_this.star}, imageCount: ${_this.imageCount}, previewImage: ${_this.previewImage}, badges: ${_this.badges}, tags: ${_this.tags}, language: ${_this.language}, idCode: ${_this.idCode}, paper: ${_this.paper})';
}


}

/// @nodoc
abstract mixin class $ListParserResultItemCopyWith<$Res>  {
  factory $ListParserResultItemCopyWith(ListParserResultItem value, $Res Function(ListParserResultItem) _then) = _$ListParserResultItemCopyWithImpl;
@useResult
$Res call({
 String? title, String? subtitle, String? uploadTime, double? star, int? imageCount, ImageResult? previewImage, List<TagResult> badges, List<TagResult> tags, String? language, String? idCode, String? paper
});


$ImageResultCopyWith<$Res>? get previewImage;

}
/// @nodoc
class _$ListParserResultItemCopyWithImpl<$Res>
    implements $ListParserResultItemCopyWith<$Res> {
  _$ListParserResultItemCopyWithImpl(this._self, this._then);

  final ListParserResultItem _self;
  final $Res Function(ListParserResultItem) _then;

/// Create a copy of ListParserResultItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? subtitle = freezed,Object? uploadTime = freezed,Object? star = freezed,Object? imageCount = freezed,Object? previewImage = freezed,Object? badges = null,Object? tags = null,Object? language = freezed,Object? idCode = freezed,Object? paper = freezed,}) {
  return _then(ListParserResultItem(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,uploadTime: freezed == uploadTime ? _self.uploadTime : uploadTime // ignore: cast_nullable_to_non_nullable
as String?,star: freezed == star ? _self.star : star // ignore: cast_nullable_to_non_nullable
as double?,imageCount: freezed == imageCount ? _self.imageCount : imageCount // ignore: cast_nullable_to_non_nullable
as int?,previewImage: freezed == previewImage ? _self.previewImage : previewImage // ignore: cast_nullable_to_non_nullable
as ImageResult?,badges: null == badges ? _self.badges : badges // ignore: cast_nullable_to_non_nullable
as List<TagResult>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<TagResult>,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,idCode: freezed == idCode ? _self.idCode : idCode // ignore: cast_nullable_to_non_nullable
as String?,paper: freezed == paper ? _self.paper : paper // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ListParserResultItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageResultCopyWith<$Res>? get previewImage {
    if (_self.previewImage == null) {
    return null;
  }

  return $ImageResultCopyWith<$Res>(_self.previewImage!, (value) {
    return _then(_self.copyWith(previewImage: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListParserResultItem].
extension ListParserResultItemPatterns on ListParserResultItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListParserResultItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListParserResultItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListParserResultItem value)  $default,){
final _that = this;
switch (_that) {
case _ListParserResultItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListParserResultItem value)?  $default,){
final _that = this;
switch (_that) {
case _ListParserResultItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? subtitle,  String? uploadTime,  double? star,  int? imageCount,  ImageResult? previewImage,  List<TagResult> badges,  List<TagResult> tags,  String? language,  String? idCode,  String? paper)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListParserResultItem() when $default != null:
return $default(_that.title,_that.subtitle,_that.uploadTime,_that.star,_that.imageCount,_that.previewImage,_that.badges,_that.tags,_that.language,_that.idCode,_that.paper);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? subtitle,  String? uploadTime,  double? star,  int? imageCount,  ImageResult? previewImage,  List<TagResult> badges,  List<TagResult> tags,  String? language,  String? idCode,  String? paper)  $default,) {final _that = this;
switch (_that) {
case _ListParserResultItem():
return $default(_that.title,_that.subtitle,_that.uploadTime,_that.star,_that.imageCount,_that.previewImage,_that.badges,_that.tags,_that.language,_that.idCode,_that.paper);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? subtitle,  String? uploadTime,  double? star,  int? imageCount,  ImageResult? previewImage,  List<TagResult> badges,  List<TagResult> tags,  String? language,  String? idCode,  String? paper)?  $default,) {final _that = this;
switch (_that) {
case _ListParserResultItem() when $default != null:
return $default(_that.title,_that.subtitle,_that.uploadTime,_that.star,_that.imageCount,_that.previewImage,_that.badges,_that.tags,_that.language,_that.idCode,_that.paper);case _:
  return null;

}
}

}

/// @nodoc


class _ListParserResultItem implements ListParserResultItem {
  const _ListParserResultItem({this.title, this.subtitle, this.uploadTime, this.star, this.imageCount, this.previewImage, required  List<TagResult> badges, required  List<TagResult> tags, this.language, this.idCode, this.paper}): _badges = badges,_tags = tags;
  

@override final  String? title;
@override final  String? subtitle;
@override final  String? uploadTime;
@override final  double? star;
@override final  int? imageCount;
@override final  ImageResult? previewImage;
 final  List<TagResult> _badges;
@override List<TagResult> get badges {
  if (_badges is EqualUnmodifiableListView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_badges);
}

 final  List<TagResult> _tags;
@override List<TagResult> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  String? language;
@override final  String? idCode;
@override final  String? paper;

/// Create a copy of ListParserResultItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListParserResultItemCopyWith<_ListParserResultItem> get copyWith => __$ListParserResultItemCopyWithImpl<_ListParserResultItem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListParserResultItem&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.uploadTime, uploadTime) || other.uploadTime == uploadTime)&&(identical(other.star, star) || other.star == star)&&(identical(other.imageCount, imageCount) || other.imageCount == imageCount)&&(identical(other.previewImage, previewImage) || other.previewImage == previewImage)&&const DeepCollectionEquality().equals(other.badges, _badges)&&const DeepCollectionEquality().equals(other.tags, _tags)&&(identical(other.language, language) || other.language == language)&&(identical(other.idCode, idCode) || other.idCode == idCode)&&(identical(other.paper, paper) || other.paper == paper));
}


@override
int get hashCode {
    return Object.hash(runtimeType,title,subtitle,uploadTime,star,imageCount,previewImage,const DeepCollectionEquality().hash(_badges),const DeepCollectionEquality().hash(_tags),language,idCode,paper);
}

@override
String toString() {
    return 'ListParserResultItem(title: $title, subtitle: $subtitle, uploadTime: $uploadTime, star: $star, imageCount: $imageCount, previewImage: $previewImage, badges: $badges, tags: $tags, language: $language, idCode: $idCode, paper: $paper)';
}


}

/// @nodoc
abstract mixin class _$ListParserResultItemCopyWith<$Res> implements $ListParserResultItemCopyWith<$Res> {
  factory _$ListParserResultItemCopyWith(_ListParserResultItem value, $Res Function(_ListParserResultItem) _then) = __$ListParserResultItemCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? subtitle, String? uploadTime, double? star, int? imageCount, ImageResult? previewImage, List<TagResult> badges, List<TagResult> tags, String? language, String? idCode, String? paper
});


@override $ImageResultCopyWith<$Res>? get previewImage;

}
/// @nodoc
class __$ListParserResultItemCopyWithImpl<$Res>
    implements _$ListParserResultItemCopyWith<$Res> {
  __$ListParserResultItemCopyWithImpl(this._self, this._then);

  final _ListParserResultItem _self;
  final $Res Function(_ListParserResultItem) _then;

/// Create a copy of ListParserResultItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? subtitle = freezed,Object? uploadTime = freezed,Object? star = freezed,Object? imageCount = freezed,Object? previewImage = freezed,Object? badges = null,Object? tags = null,Object? language = freezed,Object? idCode = freezed,Object? paper = freezed,}) {
  return _then(_ListParserResultItem(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,uploadTime: freezed == uploadTime ? _self.uploadTime : uploadTime // ignore: cast_nullable_to_non_nullable
as String?,star: freezed == star ? _self.star : star // ignore: cast_nullable_to_non_nullable
as double?,imageCount: freezed == imageCount ? _self.imageCount : imageCount // ignore: cast_nullable_to_non_nullable
as int?,previewImage: freezed == previewImage ? _self.previewImage : previewImage // ignore: cast_nullable_to_non_nullable
as ImageResult?,badges: null == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as List<TagResult>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TagResult>,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,idCode: freezed == idCode ? _self.idCode : idCode // ignore: cast_nullable_to_non_nullable
as String?,paper: freezed == paper ? _self.paper : paper // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ListParserResultItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageResultCopyWith<$Res>? get previewImage {
    if (_self.previewImage == null) {
    return null;
  }

  return $ImageResultCopyWith<$Res>(_self.previewImage!, (value) {
    return _then(_self.copyWith(previewImage: value));
  });
}
}

/// @nodoc
mixin _$TagResult {

 String? get text; String? get color; String? get category;
/// Create a copy of TagResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagResultCopyWith<TagResult> get copyWith => _$TagResultCopyWithImpl<TagResult>(this as TagResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TagResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagResult&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.color, _this.color) || other.color == _this.color)&&(identical(other.category, _this.category) || other.category == _this.category));
}


@override
int get hashCode {
  final _this = this as TagResult;
  return Object.hash(runtimeType,_this.text,_this.color,_this.category);
}

@override
String toString() {
  final _this = this as TagResult;
  return 'TagResult(text: ${_this.text}, color: ${_this.color}, category: ${_this.category})';
}


}

/// @nodoc
abstract mixin class $TagResultCopyWith<$Res>  {
  factory $TagResultCopyWith(TagResult value, $Res Function(TagResult) _then) = _$TagResultCopyWithImpl;
@useResult
$Res call({
 String? text, String? color, String? category
});




}
/// @nodoc
class _$TagResultCopyWithImpl<$Res>
    implements $TagResultCopyWith<$Res> {
  _$TagResultCopyWithImpl(this._self, this._then);

  final TagResult _self;
  final $Res Function(TagResult) _then;

/// Create a copy of TagResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = freezed,Object? color = freezed,Object? category = freezed,}) {
  return _then(TagResult(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TagResult].
extension TagResultPatterns on TagResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TagResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TagResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TagResult value)  $default,){
final _that = this;
switch (_that) {
case _TagResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TagResult value)?  $default,){
final _that = this;
switch (_that) {
case _TagResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? text,  String? color,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TagResult() when $default != null:
return $default(_that.text,_that.color,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? text,  String? color,  String? category)  $default,) {final _that = this;
switch (_that) {
case _TagResult():
return $default(_that.text,_that.color,_that.category);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? text,  String? color,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _TagResult() when $default != null:
return $default(_that.text,_that.color,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _TagResult implements TagResult {
  const _TagResult({this.text, this.color, this.category});
  

@override final  String? text;
@override final  String? color;
@override final  String? category;

/// Create a copy of TagResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagResultCopyWith<_TagResult> get copyWith => __$TagResultCopyWithImpl<_TagResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagResult&&(identical(other.text, text) || other.text == text)&&(identical(other.color, color) || other.color == color)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text,color,category);
}

@override
String toString() {
    return 'TagResult(text: $text, color: $color, category: $category)';
}


}

/// @nodoc
abstract mixin class _$TagResultCopyWith<$Res> implements $TagResultCopyWith<$Res> {
  factory _$TagResultCopyWith(_TagResult value, $Res Function(_TagResult) _then) = __$TagResultCopyWithImpl;
@override @useResult
$Res call({
 String? text, String? color, String? category
});




}
/// @nodoc
class __$TagResultCopyWithImpl<$Res>
    implements _$TagResultCopyWith<$Res> {
  __$TagResultCopyWithImpl(this._self, this._then);

  final _TagResult _self;
  final $Res Function(_TagResult) _then;

/// Create a copy of TagResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = freezed,Object? color = freezed,Object? category = freezed,}) {
  return _then(_TagResult(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
