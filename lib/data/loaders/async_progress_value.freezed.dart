// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_progress_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AsyncProgressValue<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncProgressValue<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncProgressValue<$T>()';
}


}

/// @nodoc
class $AsyncProgressValueCopyWith<T,$Res>  {
$AsyncProgressValueCopyWith(AsyncProgressValue<T> _, $Res Function(AsyncProgressValue<T>) __);
}


/// Adds pattern-matching-related methods to [AsyncProgressValue].
extension AsyncProgressValuePatterns<T> on AsyncProgressValue<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AsyncProgressIdle<T> value)?  idle,TResult Function( AsyncProgressData<T> value)?  data,TResult Function( AsyncProgressLoading<T> value)?  loading,TResult Function( AsyncProgressError<T> value)?  error,TResult Function( AsyncProgressCached<T> value)?  cached,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AsyncProgressIdle() when idle != null:
return idle(_that);case AsyncProgressData() when data != null:
return data(_that);case AsyncProgressLoading() when loading != null:
return loading(_that);case AsyncProgressError() when error != null:
return error(_that);case AsyncProgressCached() when cached != null:
return cached(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AsyncProgressIdle<T> value)  idle,required TResult Function( AsyncProgressData<T> value)  data,required TResult Function( AsyncProgressLoading<T> value)  loading,required TResult Function( AsyncProgressError<T> value)  error,required TResult Function( AsyncProgressCached<T> value)  cached,}){
final _that = this;
switch (_that) {
case AsyncProgressIdle():
return idle(_that);case AsyncProgressData():
return data(_that);case AsyncProgressLoading():
return loading(_that);case AsyncProgressError():
return error(_that);case AsyncProgressCached():
return cached(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AsyncProgressIdle<T> value)?  idle,TResult? Function( AsyncProgressData<T> value)?  data,TResult? Function( AsyncProgressLoading<T> value)?  loading,TResult? Function( AsyncProgressError<T> value)?  error,TResult? Function( AsyncProgressCached<T> value)?  cached,}){
final _that = this;
switch (_that) {
case AsyncProgressIdle() when idle != null:
return idle(_that);case AsyncProgressData() when data != null:
return data(_that);case AsyncProgressLoading() when loading != null:
return loading(_that);case AsyncProgressError() when error != null:
return error(_that);case AsyncProgressCached() when cached != null:
return cached(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( T value)?  data,TResult Function( double progress)?  loading,TResult Function( Object error,  StackTrace stackTrace)?  error,TResult Function()?  cached,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AsyncProgressIdle() when idle != null:
return idle();case AsyncProgressData() when data != null:
return data(_that.value);case AsyncProgressLoading() when loading != null:
return loading(_that.progress);case AsyncProgressError() when error != null:
return error(_that.error,_that.stackTrace);case AsyncProgressCached() when cached != null:
return cached();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( T value)  data,required TResult Function( double progress)  loading,required TResult Function( Object error,  StackTrace stackTrace)  error,required TResult Function()  cached,}) {final _that = this;
switch (_that) {
case AsyncProgressIdle():
return idle();case AsyncProgressData():
return data(_that.value);case AsyncProgressLoading():
return loading(_that.progress);case AsyncProgressError():
return error(_that.error,_that.stackTrace);case AsyncProgressCached():
return cached();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( T value)?  data,TResult? Function( double progress)?  loading,TResult? Function( Object error,  StackTrace stackTrace)?  error,TResult? Function()?  cached,}) {final _that = this;
switch (_that) {
case AsyncProgressIdle() when idle != null:
return idle();case AsyncProgressData() when data != null:
return data(_that.value);case AsyncProgressLoading() when loading != null:
return loading(_that.progress);case AsyncProgressError() when error != null:
return error(_that.error,_that.stackTrace);case AsyncProgressCached() when cached != null:
return cached();case _:
  return null;

}
}

}

/// @nodoc


class AsyncProgressIdle<T> extends AsyncProgressValue<T> {
  const AsyncProgressIdle(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncProgressIdle<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncProgressValue<$T>.idle()';
}


}




/// @nodoc


class AsyncProgressData<T> extends AsyncProgressValue<T> {
  const AsyncProgressData(this.value): super._();
  

 final  T value;

/// Create a copy of AsyncProgressValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncProgressDataCopyWith<T, AsyncProgressData<T>> get copyWith => _$AsyncProgressDataCopyWithImpl<T, AsyncProgressData<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncProgressData<T>&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'AsyncProgressValue<$T>.data(value: $value)';
}


}

/// @nodoc
abstract mixin class $AsyncProgressDataCopyWith<T,$Res> implements $AsyncProgressValueCopyWith<T, $Res> {
  factory $AsyncProgressDataCopyWith(AsyncProgressData<T> value, $Res Function(AsyncProgressData<T>) _then) = _$AsyncProgressDataCopyWithImpl;
@useResult
$Res call({
 T value
});




}
/// @nodoc
class _$AsyncProgressDataCopyWithImpl<T,$Res>
    implements $AsyncProgressDataCopyWith<T, $Res> {
  _$AsyncProgressDataCopyWithImpl(this._self, this._then);

  final AsyncProgressData<T> _self;
  final $Res Function(AsyncProgressData<T>) _then;

/// Create a copy of AsyncProgressValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,}) {
  return _then(AsyncProgressData<T>(
freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class AsyncProgressLoading<T> extends AsyncProgressValue<T> {
  const AsyncProgressLoading(this.progress): super._();
  

 final  double progress;

/// Create a copy of AsyncProgressValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncProgressLoadingCopyWith<T, AsyncProgressLoading<T>> get copyWith => _$AsyncProgressLoadingCopyWithImpl<T, AsyncProgressLoading<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncProgressLoading<T>&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,progress);

@override
String toString() {
  return 'AsyncProgressValue<$T>.loading(progress: $progress)';
}


}

/// @nodoc
abstract mixin class $AsyncProgressLoadingCopyWith<T,$Res> implements $AsyncProgressValueCopyWith<T, $Res> {
  factory $AsyncProgressLoadingCopyWith(AsyncProgressLoading<T> value, $Res Function(AsyncProgressLoading<T>) _then) = _$AsyncProgressLoadingCopyWithImpl;
@useResult
$Res call({
 double progress
});




}
/// @nodoc
class _$AsyncProgressLoadingCopyWithImpl<T,$Res>
    implements $AsyncProgressLoadingCopyWith<T, $Res> {
  _$AsyncProgressLoadingCopyWithImpl(this._self, this._then);

  final AsyncProgressLoading<T> _self;
  final $Res Function(AsyncProgressLoading<T>) _then;

/// Create a copy of AsyncProgressValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,}) {
  return _then(AsyncProgressLoading<T>(
null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class AsyncProgressError<T> extends AsyncProgressValue<T> {
  const AsyncProgressError(this.error, this.stackTrace): super._();
  

 final  Object error;
 final  StackTrace stackTrace;

/// Create a copy of AsyncProgressValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncProgressErrorCopyWith<T, AsyncProgressError<T>> get copyWith => _$AsyncProgressErrorCopyWithImpl<T, AsyncProgressError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncProgressError<T>&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'AsyncProgressValue<$T>.error(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $AsyncProgressErrorCopyWith<T,$Res> implements $AsyncProgressValueCopyWith<T, $Res> {
  factory $AsyncProgressErrorCopyWith(AsyncProgressError<T> value, $Res Function(AsyncProgressError<T>) _then) = _$AsyncProgressErrorCopyWithImpl;
@useResult
$Res call({
 Object error, StackTrace stackTrace
});




}
/// @nodoc
class _$AsyncProgressErrorCopyWithImpl<T,$Res>
    implements $AsyncProgressErrorCopyWith<T, $Res> {
  _$AsyncProgressErrorCopyWithImpl(this._self, this._then);

  final AsyncProgressError<T> _self;
  final $Res Function(AsyncProgressError<T>) _then;

/// Create a copy of AsyncProgressValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? stackTrace = null,}) {
  return _then(AsyncProgressError<T>(
null == error ? _self.error : error ,null == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace,
  ));
}


}

/// @nodoc


class AsyncProgressCached<T> extends AsyncProgressValue<T> {
  const AsyncProgressCached(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncProgressCached<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncProgressValue<$T>.cached()';
}


}




// dart format on
