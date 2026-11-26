// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectorScript {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectorScript);
}


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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SelectorScript_Output value)?  output,TResult Function( SelectorScript_Replace value)?  replace,TResult Function( SelectorScript_JavaScript value)?  javaScript,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SelectorScript_Output() when output != null:
return output(_that);case SelectorScript_Replace() when replace != null:
return replace(_that);case SelectorScript_JavaScript() when javaScript != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SelectorScript_Output value)  output,required TResult Function( SelectorScript_Replace value)  replace,required TResult Function( SelectorScript_JavaScript value)  javaScript,}){
final _that = this;
switch (_that) {
case SelectorScript_Output():
return output(_that);case SelectorScript_Replace():
return replace(_that);case SelectorScript_JavaScript():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SelectorScript_Output value)?  output,TResult? Function( SelectorScript_Replace value)?  replace,TResult? Function( SelectorScript_JavaScript value)?  javaScript,}){
final _that = this;
switch (_that) {
case SelectorScript_Output() when output != null:
return output(_that);case SelectorScript_Replace() when replace != null:
return replace(_that);case SelectorScript_JavaScript() when javaScript != null:
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
case SelectorScript_Output() when output != null:
return output();case SelectorScript_Replace() when replace != null:
return replace(_that.values);case SelectorScript_JavaScript() when javaScript != null:
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
case SelectorScript_Output():
return output();case SelectorScript_Replace():
return replace(_that.values);case SelectorScript_JavaScript():
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
case SelectorScript_Output() when output != null:
return output();case SelectorScript_Replace() when replace != null:
return replace(_that.values);case SelectorScript_JavaScript() when javaScript != null:
return javaScript(_that.source);case _:
  return null;

}
}

}

/// @nodoc


class SelectorScript_Output extends SelectorScript {
  const SelectorScript_Output(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectorScript_Output);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SelectorScript.output()';
}


}




/// @nodoc


class SelectorScript_Replace extends SelectorScript {
  const SelectorScript_Replace({required  Map<String, String> values}): _values = values,super._();
  

 final  Map<String, String> _values;
 Map<String, String> get values {
  if (_values is EqualUnmodifiableMapView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_values);
}


/// Create a copy of SelectorScript
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectorScript_ReplaceCopyWith<SelectorScript_Replace> get copyWith => _$SelectorScript_ReplaceCopyWithImpl<SelectorScript_Replace>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectorScript_Replace&&const DeepCollectionEquality().equals(other.values, _values));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_values));
}

@override
String toString() {
    return 'SelectorScript.replace(values: $values)';
}


}

/// @nodoc
abstract mixin class $SelectorScript_ReplaceCopyWith<$Res> implements $SelectorScriptCopyWith<$Res> {
  factory $SelectorScript_ReplaceCopyWith(SelectorScript_Replace value, $Res Function(SelectorScript_Replace) _then) = _$SelectorScript_ReplaceCopyWithImpl;
@useResult
$Res call({
 Map<String, String> values
});




}
/// @nodoc
class _$SelectorScript_ReplaceCopyWithImpl<$Res>
    implements $SelectorScript_ReplaceCopyWith<$Res> {
  _$SelectorScript_ReplaceCopyWithImpl(this._self, this._then);

  final SelectorScript_Replace _self;
  final $Res Function(SelectorScript_Replace) _then;

/// Create a copy of SelectorScript
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? values = null,}) {
  return _then(SelectorScript_Replace(
values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

/// @nodoc


class SelectorScript_JavaScript extends SelectorScript {
  const SelectorScript_JavaScript({required this.source}): super._();
  

 final  String source;

/// Create a copy of SelectorScript
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectorScript_JavaScriptCopyWith<SelectorScript_JavaScript> get copyWith => _$SelectorScript_JavaScriptCopyWithImpl<SelectorScript_JavaScript>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectorScript_JavaScript&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode {
    return Object.hash(runtimeType,source);
}

@override
String toString() {
    return 'SelectorScript.javaScript(source: $source)';
}


}

/// @nodoc
abstract mixin class $SelectorScript_JavaScriptCopyWith<$Res> implements $SelectorScriptCopyWith<$Res> {
  factory $SelectorScript_JavaScriptCopyWith(SelectorScript_JavaScript value, $Res Function(SelectorScript_JavaScript) _then) = _$SelectorScript_JavaScriptCopyWithImpl;
@useResult
$Res call({
 String source
});




}
/// @nodoc
class _$SelectorScript_JavaScriptCopyWithImpl<$Res>
    implements $SelectorScript_JavaScriptCopyWith<$Res> {
  _$SelectorScript_JavaScriptCopyWithImpl(this._self, this._then);

  final SelectorScript_JavaScript _self;
  final $Res Function(SelectorScript_JavaScript) _then;

/// Create a copy of SelectorScript
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? source = null,}) {
  return _then(SelectorScript_JavaScript(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
