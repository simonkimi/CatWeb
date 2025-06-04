// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SitePageRule _$SitePageRuleFromJson(Map<String, dynamic> json) {
  return _SitePage.fromJson(json);
}

/// @nodoc
mixin _$SitePageRule {
  String get name;
  String get uuid;
  PageTemplate get template;
  String get url;
  SiteNetType get action;
  String get formData;
  String get icon;
  SiteDisplayType get displayType;
  String get flag;
  String get parserId;

  /// Create a copy of SitePageRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SitePageRuleCopyWith<SitePageRule> get copyWith =>
      _$SitePageRuleCopyWithImpl<SitePageRule>(
          this as SitePageRule, _$identity);

  /// Serializes this SitePageRule to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SitePageRule &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.template, template) ||
                other.template == template) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.formData, formData) ||
                other.formData == formData) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.displayType, displayType) ||
                other.displayType == displayType) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.parserId, parserId) ||
                other.parserId == parserId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, uuid, template, url,
      action, formData, icon, displayType, flag, parserId);

  @override
  String toString() {
    return 'SitePageRule(name: $name, uuid: $uuid, template: $template, url: $url, action: $action, formData: $formData, icon: $icon, displayType: $displayType, flag: $flag, parserId: $parserId)';
  }
}

/// @nodoc
abstract mixin class $SitePageRuleCopyWith<$Res> {
  factory $SitePageRuleCopyWith(
          SitePageRule value, $Res Function(SitePageRule) _then) =
      _$SitePageRuleCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String uuid,
      PageTemplate template,
      String url,
      SiteNetType action,
      String formData,
      String icon,
      SiteDisplayType displayType,
      String flag,
      String parserId});

  $PageTemplateCopyWith<$Res> get template;
}

/// @nodoc
class _$SitePageRuleCopyWithImpl<$Res> implements $SitePageRuleCopyWith<$Res> {
  _$SitePageRuleCopyWithImpl(this._self, this._then);

  final SitePageRule _self;
  final $Res Function(SitePageRule) _then;

  /// Create a copy of SitePageRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? template = null,
    Object? url = null,
    Object? action = null,
    Object? formData = null,
    Object? icon = null,
    Object? displayType = null,
    Object? flag = null,
    Object? parserId = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      template: null == template
          ? _self.template
          : template // ignore: cast_nullable_to_non_nullable
              as PageTemplate,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as SiteNetType,
      formData: null == formData
          ? _self.formData
          : formData // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      displayType: null == displayType
          ? _self.displayType
          : displayType // ignore: cast_nullable_to_non_nullable
              as SiteDisplayType,
      flag: null == flag
          ? _self.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      parserId: null == parserId
          ? _self.parserId
          : parserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of SitePageRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageTemplateCopyWith<$Res> get template {
    return $PageTemplateCopyWith<$Res>(_self.template, (value) {
      return _then(_self.copyWith(template: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _SitePage extends SitePageRule {
  const _SitePage(
      {this.name = '',
      required this.uuid,
      required this.template,
      this.url = '',
      this.action = SiteNetType.get,
      this.formData = '',
      this.icon = '',
      this.displayType = SiteDisplayType.show,
      this.flag = '',
      this.parserId = ''})
      : super._();
  factory _SitePage.fromJson(Map<String, dynamic> json) =>
      _$SitePageFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  final String uuid;
  @override
  final PageTemplate template;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final SiteNetType action;
  @override
  @JsonKey()
  final String formData;
  @override
  @JsonKey()
  final String icon;
  @override
  @JsonKey()
  final SiteDisplayType displayType;
  @override
  @JsonKey()
  final String flag;
  @override
  @JsonKey()
  final String parserId;

  /// Create a copy of SitePageRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SitePageCopyWith<_SitePage> get copyWith =>
      __$SitePageCopyWithImpl<_SitePage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SitePageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SitePage &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.template, template) ||
                other.template == template) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.formData, formData) ||
                other.formData == formData) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.displayType, displayType) ||
                other.displayType == displayType) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.parserId, parserId) ||
                other.parserId == parserId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, uuid, template, url,
      action, formData, icon, displayType, flag, parserId);

  @override
  String toString() {
    return 'SitePageRule(name: $name, uuid: $uuid, template: $template, url: $url, action: $action, formData: $formData, icon: $icon, displayType: $displayType, flag: $flag, parserId: $parserId)';
  }
}

/// @nodoc
abstract mixin class _$SitePageCopyWith<$Res>
    implements $SitePageRuleCopyWith<$Res> {
  factory _$SitePageCopyWith(_SitePage value, $Res Function(_SitePage) _then) =
      __$SitePageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String uuid,
      PageTemplate template,
      String url,
      SiteNetType action,
      String formData,
      String icon,
      SiteDisplayType displayType,
      String flag,
      String parserId});

  @override
  $PageTemplateCopyWith<$Res> get template;
}

/// @nodoc
class __$SitePageCopyWithImpl<$Res> implements _$SitePageCopyWith<$Res> {
  __$SitePageCopyWithImpl(this._self, this._then);

  final _SitePage _self;
  final $Res Function(_SitePage) _then;

  /// Create a copy of SitePageRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? template = null,
    Object? url = null,
    Object? action = null,
    Object? formData = null,
    Object? icon = null,
    Object? displayType = null,
    Object? flag = null,
    Object? parserId = null,
  }) {
    return _then(_SitePage(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      template: null == template
          ? _self.template
          : template // ignore: cast_nullable_to_non_nullable
              as PageTemplate,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as SiteNetType,
      formData: null == formData
          ? _self.formData
          : formData // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      displayType: null == displayType
          ? _self.displayType
          : displayType // ignore: cast_nullable_to_non_nullable
              as SiteDisplayType,
      flag: null == flag
          ? _self.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      parserId: null == parserId
          ? _self.parserId
          : parserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of SitePageRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageTemplateCopyWith<$Res> get template {
    return $PageTemplateCopyWith<$Res>(_self.template, (value) {
      return _then(_self.copyWith(template: value));
    });
  }
}

// dart format on
