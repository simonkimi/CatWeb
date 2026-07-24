// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_loader_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PageLoaderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageLoaderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageLoaderState()';
}


}

/// @nodoc
class $PageLoaderStateCopyWith<$Res>  {
$PageLoaderStateCopyWith(PageLoaderState _, $Res Function(PageLoaderState) __);
}


/// Adds pattern-matching-related methods to [PageLoaderState].
extension PageLoaderStatePatterns on PageLoaderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle value)?  idle,TResult Function( _Running value)?  loading,TResult Function( _End value)?  end,TResult Function( PageLoaderStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Running() when loading != null:
return loading(_that);case _End() when end != null:
return end(_that);case PageLoaderStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle value)  idle,required TResult Function( _Running value)  loading,required TResult Function( _End value)  end,required TResult Function( PageLoaderStateError value)  error,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _Running():
return loading(_that);case _End():
return end(_that);case PageLoaderStateError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle value)?  idle,TResult? Function( _Running value)?  loading,TResult? Function( _End value)?  end,TResult? Function( PageLoaderStateError value)?  error,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Running() when loading != null:
return loading(_that);case _End() when end != null:
return end(_that);case PageLoaderStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function()?  end,TResult Function( Object error,  StackTrace stackTrace)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Running() when loading != null:
return loading();case _End() when end != null:
return end();case PageLoaderStateError() when error != null:
return error(_that.error,_that.stackTrace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function()  end,required TResult Function( Object error,  StackTrace stackTrace)  error,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _Running():
return loading();case _End():
return end();case PageLoaderStateError():
return error(_that.error,_that.stackTrace);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function()?  end,TResult? Function( Object error,  StackTrace stackTrace)?  error,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Running() when loading != null:
return loading();case _End() when end != null:
return end();case PageLoaderStateError() when error != null:
return error(_that.error,_that.stackTrace);case _:
  return null;

}
}

}

/// @nodoc


class _Idle extends PageLoaderState {
  const _Idle(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageLoaderState.idle()';
}


}




/// @nodoc


class _Running extends PageLoaderState {
  const _Running(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Running);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageLoaderState.loading()';
}


}




/// @nodoc


class _End extends PageLoaderState {
  const _End(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _End);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageLoaderState.end()';
}


}




/// @nodoc


class PageLoaderStateError extends PageLoaderState {
  const PageLoaderStateError(this.error, this.stackTrace): super._();
  

 final  Object error;
 final  StackTrace stackTrace;

/// Create a copy of PageLoaderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageLoaderStateErrorCopyWith<PageLoaderStateError> get copyWith => _$PageLoaderStateErrorCopyWithImpl<PageLoaderStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageLoaderStateError&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'PageLoaderState.error(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $PageLoaderStateErrorCopyWith<$Res> implements $PageLoaderStateCopyWith<$Res> {
  factory $PageLoaderStateErrorCopyWith(PageLoaderStateError value, $Res Function(PageLoaderStateError) _then) = _$PageLoaderStateErrorCopyWithImpl;
@useResult
$Res call({
 Object error, StackTrace stackTrace
});




}
/// @nodoc
class _$PageLoaderStateErrorCopyWithImpl<$Res>
    implements $PageLoaderStateErrorCopyWith<$Res> {
  _$PageLoaderStateErrorCopyWithImpl(this._self, this._then);

  final PageLoaderStateError _self;
  final $Res Function(PageLoaderStateError) _then;

/// Create a copy of PageLoaderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? stackTrace = null,}) {
  return _then(PageLoaderStateError(
null == error ? _self.error : error ,null == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace,
  ));
}


}

// dart format on
