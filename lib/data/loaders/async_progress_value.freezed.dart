// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AsyncProgressValue<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AsyncProgressValue<$T>()';
  }
}

/// @nodoc
class $AsyncProgressValueCopyWith<T, $Res> {
  $AsyncProgressValueCopyWith(
      AsyncProgressValue<T> _, $Res Function(AsyncProgressValue<T>) __);
}

/// @nodoc

class AsyncProgressIdle<T> extends AsyncProgressValue<T> {
  const AsyncProgressIdle() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AsyncProgressIdle<T>);
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
  const AsyncProgressData(this.value) : super._();

  final T value;

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AsyncProgressDataCopyWith<T, AsyncProgressData<T>> get copyWith =>
      _$AsyncProgressDataCopyWithImpl<T, AsyncProgressData<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AsyncProgressData<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'AsyncProgressValue<$T>.data(value: $value)';
  }
}

/// @nodoc
abstract mixin class $AsyncProgressDataCopyWith<T, $Res>
    implements $AsyncProgressValueCopyWith<T, $Res> {
  factory $AsyncProgressDataCopyWith(AsyncProgressData<T> value,
          $Res Function(AsyncProgressData<T>) _then) =
      _$AsyncProgressDataCopyWithImpl;
  @useResult
  $Res call({T value});
}

/// @nodoc
class _$AsyncProgressDataCopyWithImpl<T, $Res>
    implements $AsyncProgressDataCopyWith<T, $Res> {
  _$AsyncProgressDataCopyWithImpl(this._self, this._then);

  final AsyncProgressData<T> _self;
  final $Res Function(AsyncProgressData<T>) _then;

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
  }) {
    return _then(AsyncProgressData<T>(
      freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class AsyncProgressLoading<T> extends AsyncProgressValue<T> {
  const AsyncProgressLoading(this.progress) : super._();

  final double progress;

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AsyncProgressLoadingCopyWith<T, AsyncProgressLoading<T>> get copyWith =>
      _$AsyncProgressLoadingCopyWithImpl<T, AsyncProgressLoading<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AsyncProgressLoading<T> &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  @override
  String toString() {
    return 'AsyncProgressValue<$T>.loading(progress: $progress)';
  }
}

/// @nodoc
abstract mixin class $AsyncProgressLoadingCopyWith<T, $Res>
    implements $AsyncProgressValueCopyWith<T, $Res> {
  factory $AsyncProgressLoadingCopyWith(AsyncProgressLoading<T> value,
          $Res Function(AsyncProgressLoading<T>) _then) =
      _$AsyncProgressLoadingCopyWithImpl;
  @useResult
  $Res call({double progress});
}

/// @nodoc
class _$AsyncProgressLoadingCopyWithImpl<T, $Res>
    implements $AsyncProgressLoadingCopyWith<T, $Res> {
  _$AsyncProgressLoadingCopyWithImpl(this._self, this._then);

  final AsyncProgressLoading<T> _self;
  final $Res Function(AsyncProgressLoading<T>) _then;

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? progress = null,
  }) {
    return _then(AsyncProgressLoading<T>(
      null == progress
          ? _self.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class AsyncProgressError<T> extends AsyncProgressValue<T> {
  const AsyncProgressError(this.error, this.stackTrace) : super._();

  final Object error;
  final StackTrace stackTrace;

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AsyncProgressErrorCopyWith<T, AsyncProgressError<T>> get copyWith =>
      _$AsyncProgressErrorCopyWithImpl<T, AsyncProgressError<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AsyncProgressError<T> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  @override
  String toString() {
    return 'AsyncProgressValue<$T>.error(error: $error, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $AsyncProgressErrorCopyWith<T, $Res>
    implements $AsyncProgressValueCopyWith<T, $Res> {
  factory $AsyncProgressErrorCopyWith(AsyncProgressError<T> value,
          $Res Function(AsyncProgressError<T>) _then) =
      _$AsyncProgressErrorCopyWithImpl;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$AsyncProgressErrorCopyWithImpl<T, $Res>
    implements $AsyncProgressErrorCopyWith<T, $Res> {
  _$AsyncProgressErrorCopyWithImpl(this._self, this._then);

  final AsyncProgressError<T> _self;
  final $Res Function(AsyncProgressError<T>) _then;

  /// Create a copy of AsyncProgressValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(AsyncProgressError<T>(
      null == error ? _self.error : error,
      null == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class AsyncProgressCached<T> extends AsyncProgressValue<T> {
  const AsyncProgressCached() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AsyncProgressCached<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AsyncProgressValue<$T>.cached()';
  }
}

// dart format on
