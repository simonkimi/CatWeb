// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_data_loader.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PagingState<TItem> {
  Map<int, BasePageData<TItem>> get pageData =>
      throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get startPage => throw _privateConstructorUsedError;
  bool get isEnd => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PagingStateCopyWith<TItem, PagingState<TItem>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagingStateCopyWith<TItem, $Res> {
  factory $PagingStateCopyWith(
          PagingState<TItem> value, $Res Function(PagingState<TItem>) then) =
      _$PagingStateCopyWithImpl<TItem, $Res, PagingState<TItem>>;
  @useResult
  $Res call(
      {Map<int, BasePageData<TItem>> pageData,
      int currentPage,
      int startPage,
      bool isEnd});
}

/// @nodoc
class _$PagingStateCopyWithImpl<TItem, $Res, $Val extends PagingState<TItem>>
    implements $PagingStateCopyWith<TItem, $Res> {
  _$PagingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageData = null,
    Object? currentPage = null,
    Object? startPage = null,
    Object? isEnd = null,
  }) {
    return _then(_value.copyWith(
      pageData: null == pageData
          ? _value.pageData
          : pageData // ignore: cast_nullable_to_non_nullable
              as Map<int, BasePageData<TItem>>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      startPage: null == startPage
          ? _value.startPage
          : startPage // ignore: cast_nullable_to_non_nullable
              as int,
      isEnd: null == isEnd
          ? _value.isEnd
          : isEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PagingStateImplCopyWith<TItem, $Res>
    implements $PagingStateCopyWith<TItem, $Res> {
  factory _$$PagingStateImplCopyWith(_$PagingStateImpl<TItem> value,
          $Res Function(_$PagingStateImpl<TItem>) then) =
      __$$PagingStateImplCopyWithImpl<TItem, $Res>;
  @override
  @useResult
  $Res call(
      {Map<int, BasePageData<TItem>> pageData,
      int currentPage,
      int startPage,
      bool isEnd});
}

/// @nodoc
class __$$PagingStateImplCopyWithImpl<TItem, $Res>
    extends _$PagingStateCopyWithImpl<TItem, $Res, _$PagingStateImpl<TItem>>
    implements _$$PagingStateImplCopyWith<TItem, $Res> {
  __$$PagingStateImplCopyWithImpl(_$PagingStateImpl<TItem> _value,
      $Res Function(_$PagingStateImpl<TItem>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageData = null,
    Object? currentPage = null,
    Object? startPage = null,
    Object? isEnd = null,
  }) {
    return _then(_$PagingStateImpl<TItem>(
      pageData: null == pageData
          ? _value._pageData
          : pageData // ignore: cast_nullable_to_non_nullable
              as Map<int, BasePageData<TItem>>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      startPage: null == startPage
          ? _value.startPage
          : startPage // ignore: cast_nullable_to_non_nullable
              as int,
      isEnd: null == isEnd
          ? _value.isEnd
          : isEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PagingStateImpl<TItem> implements _PagingState<TItem> {
  const _$PagingStateImpl(
      {required final Map<int, BasePageData<TItem>> pageData = const {},
      required this.currentPage = 0,
      required this.startPage = 0,
      required this.isEnd = false})
      : _pageData = pageData;

  final Map<int, BasePageData<TItem>> _pageData;
  @override
  @JsonKey()
  Map<int, BasePageData<TItem>> get pageData {
    if (_pageData is EqualUnmodifiableMapView) return _pageData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pageData);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int startPage;
  @override
  @JsonKey()
  final bool isEnd;

  @override
  String toString() {
    return 'PagingState<$TItem>(pageData: $pageData, currentPage: $currentPage, startPage: $startPage, isEnd: $isEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagingStateImpl<TItem> &&
            const DeepCollectionEquality().equals(other._pageData, _pageData) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.startPage, startPage) ||
                other.startPage == startPage) &&
            (identical(other.isEnd, isEnd) || other.isEnd == isEnd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pageData),
      currentPage,
      startPage,
      isEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PagingStateImplCopyWith<TItem, _$PagingStateImpl<TItem>> get copyWith =>
      __$$PagingStateImplCopyWithImpl<TItem, _$PagingStateImpl<TItem>>(
          this, _$identity);
}

abstract class _PagingState<TItem> implements PagingState<TItem> {
  const factory _PagingState(
      {required final Map<int, BasePageData<TItem>> pageData,
      required final int currentPage,
      required final int startPage,
      required final bool isEnd}) = _$PagingStateImpl<TItem>;

  @override
  Map<int, BasePageData<TItem>> get pageData;
  @override
  int get currentPage;
  @override
  int get startPage;
  @override
  bool get isEnd;
  @override
  @JsonKey(ignore: true)
  _$$PagingStateImplCopyWith<TItem, _$PagingStateImpl<TItem>> get copyWith =>
      throw _privateConstructorUsedError;
}
