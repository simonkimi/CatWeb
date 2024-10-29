// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_progress_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AsyncProgressValue<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T value) data,
    required TResult Function(double progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
    required TResult Function() cached,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T value)? data,
    TResult? Function(double progress)? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
    TResult? Function()? cached,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T value)? data,
    TResult Function(double progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    TResult Function()? cached,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AsyncProgressIdle<T> value) idle,
    required TResult Function(AsyncProgressData<T> value) data,
    required TResult Function(AsyncProgressLoading<T> value) loading,
    required TResult Function(AsyncProgressError<T> value) error,
    required TResult Function(AsyncProgressCached<T> value) cached,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AsyncProgressIdle<T> value)? idle,
    TResult? Function(AsyncProgressData<T> value)? data,
    TResult? Function(AsyncProgressLoading<T> value)? loading,
    TResult? Function(AsyncProgressError<T> value)? error,
    TResult? Function(AsyncProgressCached<T> value)? cached,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AsyncProgressIdle<T> value)? idle,
    TResult Function(AsyncProgressData<T> value)? data,
    TResult Function(AsyncProgressLoading<T> value)? loading,
    TResult Function(AsyncProgressError<T> value)? error,
    TResult Function(AsyncProgressCached<T> value)? cached,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsyncProgressValueCopyWith<T, $Res> {
  factory $AsyncProgressValueCopyWith(AsyncProgressValue<T> value,
          $Res Function(AsyncProgressValue<T>) then) =
      _$AsyncProgressValueCopyWithImpl<T, $Res, AsyncProgressValue<T>>;
}

/// @nodoc
class _$AsyncProgressValueCopyWithImpl<T, $Res,
        $Val extends AsyncProgressValue<T>>
    implements $AsyncProgressValueCopyWith<T, $Res> {
  _$AsyncProgressValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AsyncProgressIdleImplCopyWith<T, $Res> {
  factory _$$AsyncProgressIdleImplCopyWith(_$AsyncProgressIdleImpl<T> value,
          $Res Function(_$AsyncProgressIdleImpl<T>) then) =
      __$$AsyncProgressIdleImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$AsyncProgressIdleImplCopyWithImpl<T, $Res>
    extends _$AsyncProgressValueCopyWithImpl<T, $Res,
        _$AsyncProgressIdleImpl<T>>
    implements _$$AsyncProgressIdleImplCopyWith<T, $Res> {
  __$$AsyncProgressIdleImplCopyWithImpl(_$AsyncProgressIdleImpl<T> _value,
      $Res Function(_$AsyncProgressIdleImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AsyncProgressIdleImpl<T> extends AsyncProgressIdle<T> {
  const _$AsyncProgressIdleImpl() : super._();

  @override
  String toString() {
    return 'AsyncProgressValue<$T>.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AsyncProgressIdleImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T value) data,
    required TResult Function(double progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
    required TResult Function() cached,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T value)? data,
    TResult? Function(double progress)? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
    TResult? Function()? cached,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T value)? data,
    TResult Function(double progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    TResult Function()? cached,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AsyncProgressIdle<T> value) idle,
    required TResult Function(AsyncProgressData<T> value) data,
    required TResult Function(AsyncProgressLoading<T> value) loading,
    required TResult Function(AsyncProgressError<T> value) error,
    required TResult Function(AsyncProgressCached<T> value) cached,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AsyncProgressIdle<T> value)? idle,
    TResult? Function(AsyncProgressData<T> value)? data,
    TResult? Function(AsyncProgressLoading<T> value)? loading,
    TResult? Function(AsyncProgressError<T> value)? error,
    TResult? Function(AsyncProgressCached<T> value)? cached,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AsyncProgressIdle<T> value)? idle,
    TResult Function(AsyncProgressData<T> value)? data,
    TResult Function(AsyncProgressLoading<T> value)? loading,
    TResult Function(AsyncProgressError<T> value)? error,
    TResult Function(AsyncProgressCached<T> value)? cached,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class AsyncProgressIdle<T> extends AsyncProgressValue<T> {
  const factory AsyncProgressIdle() = _$AsyncProgressIdleImpl<T>;
  const AsyncProgressIdle._() : super._();
}

/// @nodoc
abstract class _$$AsyncProgressDataImplCopyWith<T, $Res> {
  factory _$$AsyncProgressDataImplCopyWith(_$AsyncProgressDataImpl<T> value,
          $Res Function(_$AsyncProgressDataImpl<T>) then) =
      __$$AsyncProgressDataImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$AsyncProgressDataImplCopyWithImpl<T, $Res>
    extends _$AsyncProgressValueCopyWithImpl<T, $Res,
        _$AsyncProgressDataImpl<T>>
    implements _$$AsyncProgressDataImplCopyWith<T, $Res> {
  __$$AsyncProgressDataImplCopyWithImpl(_$AsyncProgressDataImpl<T> _value,
      $Res Function(_$AsyncProgressDataImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$AsyncProgressDataImpl<T>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$AsyncProgressDataImpl<T> extends AsyncProgressData<T> {
  const _$AsyncProgressDataImpl(this.value) : super._();

  @override
  final T value;

  @override
  String toString() {
    return 'AsyncProgressValue<$T>.data(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AsyncProgressDataImpl<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AsyncProgressDataImplCopyWith<T, _$AsyncProgressDataImpl<T>>
      get copyWith =>
          __$$AsyncProgressDataImplCopyWithImpl<T, _$AsyncProgressDataImpl<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T value) data,
    required TResult Function(double progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
    required TResult Function() cached,
  }) {
    return data(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T value)? data,
    TResult? Function(double progress)? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
    TResult? Function()? cached,
  }) {
    return data?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T value)? data,
    TResult Function(double progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    TResult Function()? cached,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AsyncProgressIdle<T> value) idle,
    required TResult Function(AsyncProgressData<T> value) data,
    required TResult Function(AsyncProgressLoading<T> value) loading,
    required TResult Function(AsyncProgressError<T> value) error,
    required TResult Function(AsyncProgressCached<T> value) cached,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AsyncProgressIdle<T> value)? idle,
    TResult? Function(AsyncProgressData<T> value)? data,
    TResult? Function(AsyncProgressLoading<T> value)? loading,
    TResult? Function(AsyncProgressError<T> value)? error,
    TResult? Function(AsyncProgressCached<T> value)? cached,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AsyncProgressIdle<T> value)? idle,
    TResult Function(AsyncProgressData<T> value)? data,
    TResult Function(AsyncProgressLoading<T> value)? loading,
    TResult Function(AsyncProgressError<T> value)? error,
    TResult Function(AsyncProgressCached<T> value)? cached,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class AsyncProgressData<T> extends AsyncProgressValue<T> {
  const factory AsyncProgressData(final T value) = _$AsyncProgressDataImpl<T>;
  const AsyncProgressData._() : super._();

  T get value;

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AsyncProgressDataImplCopyWith<T, _$AsyncProgressDataImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AsyncProgressLoadingImplCopyWith<T, $Res> {
  factory _$$AsyncProgressLoadingImplCopyWith(
          _$AsyncProgressLoadingImpl<T> value,
          $Res Function(_$AsyncProgressLoadingImpl<T>) then) =
      __$$AsyncProgressLoadingImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({double progress});
}

/// @nodoc
class __$$AsyncProgressLoadingImplCopyWithImpl<T, $Res>
    extends _$AsyncProgressValueCopyWithImpl<T, $Res,
        _$AsyncProgressLoadingImpl<T>>
    implements _$$AsyncProgressLoadingImplCopyWith<T, $Res> {
  __$$AsyncProgressLoadingImplCopyWithImpl(_$AsyncProgressLoadingImpl<T> _value,
      $Res Function(_$AsyncProgressLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
  }) {
    return _then(_$AsyncProgressLoadingImpl<T>(
      null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$AsyncProgressLoadingImpl<T> extends AsyncProgressLoading<T> {
  const _$AsyncProgressLoadingImpl(this.progress) : super._();

  @override
  final double progress;

  @override
  String toString() {
    return 'AsyncProgressValue<$T>.loading(progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AsyncProgressLoadingImpl<T> &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AsyncProgressLoadingImplCopyWith<T, _$AsyncProgressLoadingImpl<T>>
      get copyWith => __$$AsyncProgressLoadingImplCopyWithImpl<T,
          _$AsyncProgressLoadingImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T value) data,
    required TResult Function(double progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
    required TResult Function() cached,
  }) {
    return loading(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T value)? data,
    TResult? Function(double progress)? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
    TResult? Function()? cached,
  }) {
    return loading?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T value)? data,
    TResult Function(double progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    TResult Function()? cached,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AsyncProgressIdle<T> value) idle,
    required TResult Function(AsyncProgressData<T> value) data,
    required TResult Function(AsyncProgressLoading<T> value) loading,
    required TResult Function(AsyncProgressError<T> value) error,
    required TResult Function(AsyncProgressCached<T> value) cached,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AsyncProgressIdle<T> value)? idle,
    TResult? Function(AsyncProgressData<T> value)? data,
    TResult? Function(AsyncProgressLoading<T> value)? loading,
    TResult? Function(AsyncProgressError<T> value)? error,
    TResult? Function(AsyncProgressCached<T> value)? cached,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AsyncProgressIdle<T> value)? idle,
    TResult Function(AsyncProgressData<T> value)? data,
    TResult Function(AsyncProgressLoading<T> value)? loading,
    TResult Function(AsyncProgressError<T> value)? error,
    TResult Function(AsyncProgressCached<T> value)? cached,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AsyncProgressLoading<T> extends AsyncProgressValue<T> {
  const factory AsyncProgressLoading(final double progress) =
      _$AsyncProgressLoadingImpl<T>;
  const AsyncProgressLoading._() : super._();

  double get progress;

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AsyncProgressLoadingImplCopyWith<T, _$AsyncProgressLoadingImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AsyncProgressErrorImplCopyWith<T, $Res> {
  factory _$$AsyncProgressErrorImplCopyWith(_$AsyncProgressErrorImpl<T> value,
          $Res Function(_$AsyncProgressErrorImpl<T>) then) =
      __$$AsyncProgressErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$$AsyncProgressErrorImplCopyWithImpl<T, $Res>
    extends _$AsyncProgressValueCopyWithImpl<T, $Res,
        _$AsyncProgressErrorImpl<T>>
    implements _$$AsyncProgressErrorImplCopyWith<T, $Res> {
  __$$AsyncProgressErrorImplCopyWithImpl(_$AsyncProgressErrorImpl<T> _value,
      $Res Function(_$AsyncProgressErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(_$AsyncProgressErrorImpl<T>(
      null == error ? _value.error : error,
      null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$AsyncProgressErrorImpl<T> extends AsyncProgressError<T> {
  const _$AsyncProgressErrorImpl(this.error, this.stackTrace) : super._();

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'AsyncProgressValue<$T>.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AsyncProgressErrorImpl<T> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AsyncProgressErrorImplCopyWith<T, _$AsyncProgressErrorImpl<T>>
      get copyWith => __$$AsyncProgressErrorImplCopyWithImpl<T,
          _$AsyncProgressErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T value) data,
    required TResult Function(double progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
    required TResult Function() cached,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T value)? data,
    TResult? Function(double progress)? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
    TResult? Function()? cached,
  }) {
    return error?.call(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T value)? data,
    TResult Function(double progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    TResult Function()? cached,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AsyncProgressIdle<T> value) idle,
    required TResult Function(AsyncProgressData<T> value) data,
    required TResult Function(AsyncProgressLoading<T> value) loading,
    required TResult Function(AsyncProgressError<T> value) error,
    required TResult Function(AsyncProgressCached<T> value) cached,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AsyncProgressIdle<T> value)? idle,
    TResult? Function(AsyncProgressData<T> value)? data,
    TResult? Function(AsyncProgressLoading<T> value)? loading,
    TResult? Function(AsyncProgressError<T> value)? error,
    TResult? Function(AsyncProgressCached<T> value)? cached,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AsyncProgressIdle<T> value)? idle,
    TResult Function(AsyncProgressData<T> value)? data,
    TResult Function(AsyncProgressLoading<T> value)? loading,
    TResult Function(AsyncProgressError<T> value)? error,
    TResult Function(AsyncProgressCached<T> value)? cached,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AsyncProgressError<T> extends AsyncProgressValue<T> {
  const factory AsyncProgressError(
          final Object error, final StackTrace stackTrace) =
      _$AsyncProgressErrorImpl<T>;
  const AsyncProgressError._() : super._();

  Object get error;
  StackTrace get stackTrace;

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AsyncProgressErrorImplCopyWith<T, _$AsyncProgressErrorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AsyncProgressCachedImplCopyWith<T, $Res> {
  factory _$$AsyncProgressCachedImplCopyWith(_$AsyncProgressCachedImpl<T> value,
          $Res Function(_$AsyncProgressCachedImpl<T>) then) =
      __$$AsyncProgressCachedImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$AsyncProgressCachedImplCopyWithImpl<T, $Res>
    extends _$AsyncProgressValueCopyWithImpl<T, $Res,
        _$AsyncProgressCachedImpl<T>>
    implements _$$AsyncProgressCachedImplCopyWith<T, $Res> {
  __$$AsyncProgressCachedImplCopyWithImpl(_$AsyncProgressCachedImpl<T> _value,
      $Res Function(_$AsyncProgressCachedImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AsyncProgressCachedImpl<T> extends AsyncProgressCached<T> {
  const _$AsyncProgressCachedImpl() : super._();

  @override
  String toString() {
    return 'AsyncProgressValue<$T>.cached()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AsyncProgressCachedImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T value) data,
    required TResult Function(double progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
    required TResult Function() cached,
  }) {
    return cached();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T value)? data,
    TResult? Function(double progress)? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
    TResult? Function()? cached,
  }) {
    return cached?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T value)? data,
    TResult Function(double progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    TResult Function()? cached,
    required TResult orElse(),
  }) {
    if (cached != null) {
      return cached();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AsyncProgressIdle<T> value) idle,
    required TResult Function(AsyncProgressData<T> value) data,
    required TResult Function(AsyncProgressLoading<T> value) loading,
    required TResult Function(AsyncProgressError<T> value) error,
    required TResult Function(AsyncProgressCached<T> value) cached,
  }) {
    return cached(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AsyncProgressIdle<T> value)? idle,
    TResult? Function(AsyncProgressData<T> value)? data,
    TResult? Function(AsyncProgressLoading<T> value)? loading,
    TResult? Function(AsyncProgressError<T> value)? error,
    TResult? Function(AsyncProgressCached<T> value)? cached,
  }) {
    return cached?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AsyncProgressIdle<T> value)? idle,
    TResult Function(AsyncProgressData<T> value)? data,
    TResult Function(AsyncProgressLoading<T> value)? loading,
    TResult Function(AsyncProgressError<T> value)? error,
    TResult Function(AsyncProgressCached<T> value)? cached,
    required TResult orElse(),
  }) {
    if (cached != null) {
      return cached(this);
    }
    return orElse();
  }
}

abstract class AsyncProgressCached<T> extends AsyncProgressValue<T> {
  const factory AsyncProgressCached() = _$AsyncProgressCachedImpl<T>;
  const AsyncProgressCached._() : super._();
}
