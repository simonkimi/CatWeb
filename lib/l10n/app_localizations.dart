import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('zh')];

  /// No description provided for @parser.
  ///
  /// In zh, this message translates to:
  /// **'解析器'**
  String get parser;

  /// No description provided for @action.
  ///
  /// In zh, this message translates to:
  /// **'动作器'**
  String get action;

  /// No description provided for @positive.
  ///
  /// In zh, this message translates to:
  /// **'确认'**
  String get positive;

  /// No description provided for @negative.
  ///
  /// In zh, this message translates to:
  /// **'取消'**
  String get negative;

  /// No description provided for @selector.
  ///
  /// In zh, this message translates to:
  /// **'选择器'**
  String get selector;

  /// No description provided for @search.
  ///
  /// In zh, this message translates to:
  /// **'搜索'**
  String get search;

  /// No description provided for @name.
  ///
  /// In zh, this message translates to:
  /// **'名称'**
  String get name;

  /// No description provided for @key.
  ///
  /// In zh, this message translates to:
  /// **'键'**
  String get key;

  /// No description provided for @value.
  ///
  /// In zh, this message translates to:
  /// **'值'**
  String get value;

  /// No description provided for @script.
  ///
  /// In zh, this message translates to:
  /// **'脚本'**
  String get script;

  /// No description provided for @filter.
  ///
  /// In zh, this message translates to:
  /// **'过滤器'**
  String get filter;

  /// No description provided for @color.
  ///
  /// In zh, this message translates to:
  /// **'颜色'**
  String get color;

  /// No description provided for @add.
  ///
  /// In zh, this message translates to:
  /// **'添加'**
  String get add;

  /// No description provided for @remove.
  ///
  /// In zh, this message translates to:
  /// **'移除'**
  String get remove;

  /// No description provided for @edit.
  ///
  /// In zh, this message translates to:
  /// **'编辑'**
  String get edit;

  /// No description provided for @save.
  ///
  /// In zh, this message translates to:
  /// **'保存'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In zh, this message translates to:
  /// **'取消'**
  String get cancel;

  /// No description provided for @close.
  ///
  /// In zh, this message translates to:
  /// **'关闭'**
  String get close;

  /// No description provided for @apply.
  ///
  /// In zh, this message translates to:
  /// **'应用'**
  String get apply;

  /// No description provided for @reset.
  ///
  /// In zh, this message translates to:
  /// **'重置'**
  String get reset;

  /// No description provided for @back.
  ///
  /// In zh, this message translates to:
  /// **'返回'**
  String get back;

  /// No description provided for @setting.
  ///
  /// In zh, this message translates to:
  /// **'设置'**
  String get setting;

  /// No description provided for @display.
  ///
  /// In zh, this message translates to:
  /// **'显示'**
  String get display;

  /// No description provided for @type.
  ///
  /// In zh, this message translates to:
  /// **'类型'**
  String get type;

  /// No description provided for @default_value.
  ///
  /// In zh, this message translates to:
  /// **'默认'**
  String get default_value;

  /// No description provided for @page.
  ///
  /// In zh, this message translates to:
  /// **'页面'**
  String get page;

  /// No description provided for @icon.
  ///
  /// In zh, this message translates to:
  /// **'图标'**
  String get icon;

  /// No description provided for @none.
  ///
  /// In zh, this message translates to:
  /// **'无'**
  String get none;

  /// No description provided for @title.
  ///
  /// In zh, this message translates to:
  /// **'标题'**
  String get title;

  /// No description provided for @index.
  ///
  /// In zh, this message translates to:
  /// **'索引'**
  String get index;

  /// No description provided for @download.
  ///
  /// In zh, this message translates to:
  /// **'下载'**
  String get download;

  /// No description provided for @comment.
  ///
  /// In zh, this message translates to:
  /// **'评论'**
  String get comment;

  /// No description provided for @security.
  ///
  /// In zh, this message translates to:
  /// **'安全'**
  String get security;

  /// No description provided for @about.
  ///
  /// In zh, this message translates to:
  /// **'关于'**
  String get about;

  /// No description provided for @advanced.
  ///
  /// In zh, this message translates to:
  /// **'高级'**
  String get advanced;

  /// No description provided for @delete.
  ///
  /// In zh, this message translates to:
  /// **'删除'**
  String get delete;

  /// No description provided for @basic.
  ///
  /// In zh, this message translates to:
  /// **'基础'**
  String get basic;

  /// No description provided for @exit.
  ///
  /// In zh, this message translates to:
  /// **'退出'**
  String get exit;

  /// No description provided for @login.
  ///
  /// In zh, this message translates to:
  /// **'登录'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In zh, this message translates to:
  /// **'注销'**
  String get logout;

  /// No description provided for @import.
  ///
  /// In zh, this message translates to:
  /// **'导入'**
  String get import;

  /// No description provided for @reg.
  ///
  /// In zh, this message translates to:
  /// **'正则'**
  String get reg;

  /// No description provided for @content.
  ///
  /// In zh, this message translates to:
  /// **'内容'**
  String get content;

  /// No description provided for @website.
  ///
  /// In zh, this message translates to:
  /// **'网站'**
  String get website;

  /// No description provided for @disable.
  ///
  /// In zh, this message translates to:
  /// **'禁用'**
  String get disable;

  /// No description provided for @read.
  ///
  /// In zh, this message translates to:
  /// **'阅读'**
  String get read;

  /// No description provided for @identity.
  ///
  /// In zh, this message translates to:
  /// **'身份'**
  String get identity;

  /// No description provided for @form.
  ///
  /// In zh, this message translates to:
  /// **'表单'**
  String get form;

  /// No description provided for @rule_edit.
  ///
  /// In zh, this message translates to:
  /// **'规则编辑'**
  String get rule_edit;

  /// No description provided for @exit_not_save.
  ///
  /// In zh, this message translates to:
  /// **'您确定不保存而退出吗？\n所做的修改将不会保存。'**
  String get exit_not_save;

  /// No description provided for @rule_name_empty.
  ///
  /// In zh, this message translates to:
  /// **'规则名称不能为空'**
  String get rule_name_empty;

  /// No description provided for @base_url_empty.
  ///
  /// In zh, this message translates to:
  /// **'基础Url不能为空'**
  String get base_url_empty;

  /// No description provided for @net_action.
  ///
  /// In zh, this message translates to:
  /// **'请求方式'**
  String get net_action;

  /// No description provided for @display_type.
  ///
  /// In zh, this message translates to:
  /// **'显示方式'**
  String get display_type;

  /// No description provided for @read_jump_to.
  ///
  /// In zh, this message translates to:
  /// **'阅读跳转'**
  String get read_jump_to;

  /// No description provided for @item_jump_to.
  ///
  /// In zh, this message translates to:
  /// **'项目跳转'**
  String get item_jump_to;

  /// No description provided for @auto_complete_jump_to.
  ///
  /// In zh, this message translates to:
  /// **'自动补全设定'**
  String get auto_complete_jump_to;

  /// No description provided for @select_parser.
  ///
  /// In zh, this message translates to:
  /// **'请选择解析器'**
  String get select_parser;

  /// No description provided for @select_net_action.
  ///
  /// In zh, this message translates to:
  /// **'请选择请求方式'**
  String get select_net_action;

  /// No description provided for @add_site.
  ///
  /// In zh, this message translates to:
  /// **'添加站点'**
  String get add_site;

  /// No description provided for @no_site.
  ///
  /// In zh, this message translates to:
  /// **'没有找到任何站点'**
  String get no_site;

  /// No description provided for @import_cookie.
  ///
  /// In zh, this message translates to:
  /// **'将导入以下Cookies'**
  String get import_cookie;

  /// No description provided for @login_with_security.
  ///
  /// In zh, this message translates to:
  /// **'登录地址和网站地址不在同一个域名下，安全模式已开启，将会保护您的认证令牌(可能造成某些网站异常)，若要关闭，请前往网站设置'**
  String get login_with_security;

  /// No description provided for @login_success.
  ///
  /// In zh, this message translates to:
  /// **'登录成功'**
  String get login_success;

  /// No description provided for @login_without_security.
  ///
  /// In zh, this message translates to:
  /// **'登录地址和网站地址不在同一个域名下，请确认您信任此规则发布者，否则您的认证令牌可能会被盗用! 是否继续登录？\n规则创建者解释如下：\n{description}'**
  String login_without_security(String description);

  /// No description provided for @press_again_to_exist.
  ///
  /// In zh, this message translates to:
  /// **'再按一次退出'**
  String get press_again_to_exist;

  /// No description provided for @delete_confirm.
  ///
  /// In zh, this message translates to:
  /// **'确定要删除 {value} 吗？'**
  String delete_confirm(String value);

  /// No description provided for @network_not_success_flag.
  ///
  /// In zh, this message translates to:
  /// **'没有请求到有效数据'**
  String get network_not_success_flag;

  /// No description provided for @basic_setting.
  ///
  /// In zh, this message translates to:
  /// **'基础'**
  String get basic_setting;

  /// No description provided for @page_manager.
  ///
  /// In zh, this message translates to:
  /// **'页面'**
  String get page_manager;

  /// No description provided for @base_url.
  ///
  /// In zh, this message translates to:
  /// **'基础URL'**
  String get base_url;

  /// No description provided for @login_url.
  ///
  /// In zh, this message translates to:
  /// **'登录URL'**
  String get login_url;

  /// No description provided for @login_url_reg.
  ///
  /// In zh, this message translates to:
  /// **'Cookie登录URL正则'**
  String get login_url_reg;

  /// No description provided for @check_upgrade_url.
  ///
  /// In zh, this message translates to:
  /// **'更新URL'**
  String get check_upgrade_url;

  /// No description provided for @script_clear.
  ///
  /// In zh, this message translates to:
  /// **'确定清除脚本?'**
  String get script_clear;

  /// No description provided for @preview.
  ///
  /// In zh, this message translates to:
  /// **'预览'**
  String get preview;

  /// No description provided for @dark_mask.
  ///
  /// In zh, this message translates to:
  /// **'深色模式下预览图片变暗'**
  String get dark_mask;

  /// No description provided for @image_concurrency.
  ///
  /// In zh, this message translates to:
  /// **'同时加载图片数量'**
  String get image_concurrency;

  /// No description provided for @no_limit.
  ///
  /// In zh, this message translates to:
  /// **'不限制'**
  String get no_limit;

  /// No description provided for @pre_load_count.
  ///
  /// In zh, this message translates to:
  /// **'预加载数量'**
  String get pre_load_count;

  /// No description provided for @read_direction.
  ///
  /// In zh, this message translates to:
  /// **'阅读方向'**
  String get read_direction;

  /// No description provided for @ltr.
  ///
  /// In zh, this message translates to:
  /// **'从左到右'**
  String get ltr;

  /// No description provided for @rtl.
  ///
  /// In zh, this message translates to:
  /// **'从右到左'**
  String get rtl;

  /// No description provided for @ttb.
  ///
  /// In zh, this message translates to:
  /// **'从上到下'**
  String get ttb;

  /// No description provided for @basic_info.
  ///
  /// In zh, this message translates to:
  /// **'基础信息'**
  String get basic_info;

  /// No description provided for @next_page.
  ///
  /// In zh, this message translates to:
  /// **'下一面'**
  String get next_page;

  /// No description provided for @badge.
  ///
  /// In zh, this message translates to:
  /// **'徽章'**
  String get badge;

  /// No description provided for @badge_item.
  ///
  /// In zh, this message translates to:
  /// **'徽章项目'**
  String get badge_item;

  /// No description provided for @badge_content.
  ///
  /// In zh, this message translates to:
  /// **'徽章内容'**
  String get badge_content;

  /// No description provided for @badge_type.
  ///
  /// In zh, this message translates to:
  /// **'徽章类型'**
  String get badge_type;

  /// No description provided for @comment_item.
  ///
  /// In zh, this message translates to:
  /// **'评论项目'**
  String get comment_item;

  /// No description provided for @comment_content.
  ///
  /// In zh, this message translates to:
  /// **'评论内容'**
  String get comment_content;

  /// No description provided for @username.
  ///
  /// In zh, this message translates to:
  /// **'用户名'**
  String get username;

  /// No description provided for @comment_time.
  ///
  /// In zh, this message translates to:
  /// **'评论时间'**
  String get comment_time;

  /// No description provided for @comment_score.
  ///
  /// In zh, this message translates to:
  /// **'评论评分'**
  String get comment_score;

  /// No description provided for @tag.
  ///
  /// In zh, this message translates to:
  /// **'分类'**
  String get tag;

  /// No description provided for @tag_color.
  ///
  /// In zh, this message translates to:
  /// **'分类颜色'**
  String get tag_color;

  /// No description provided for @thumbnail.
  ///
  /// In zh, this message translates to:
  /// **'缩略图'**
  String get thumbnail;

  /// No description provided for @thumbnail_target.
  ///
  /// In zh, this message translates to:
  /// **'目标'**
  String get thumbnail_target;

  /// No description provided for @thumbnail_selector.
  ///
  /// In zh, this message translates to:
  /// **'缩略图项目'**
  String get thumbnail_selector;

  /// No description provided for @thumbnail_img.
  ///
  /// In zh, this message translates to:
  /// **'缩略图地址'**
  String get thumbnail_img;

  /// No description provided for @thumbnail_width.
  ///
  /// In zh, this message translates to:
  /// **'缩略图宽度'**
  String get thumbnail_width;

  /// No description provided for @thumbnail_height.
  ///
  /// In zh, this message translates to:
  /// **'缩略图高度'**
  String get thumbnail_height;

  /// No description provided for @thumbnail_x.
  ///
  /// In zh, this message translates to:
  /// **'缩略图X偏移'**
  String get thumbnail_x;

  /// No description provided for @thumbnail_y.
  ///
  /// In zh, this message translates to:
  /// **'缩略图Y偏移'**
  String get thumbnail_y;

  /// No description provided for @cover.
  ///
  /// In zh, this message translates to:
  /// **'封面'**
  String get cover;

  /// No description provided for @cover_img.
  ///
  /// In zh, this message translates to:
  /// **'封面地址'**
  String get cover_img;

  /// No description provided for @cover_width.
  ///
  /// In zh, this message translates to:
  /// **'封面宽度'**
  String get cover_width;

  /// No description provided for @cover_height.
  ///
  /// In zh, this message translates to:
  /// **'封面高度'**
  String get cover_height;

  /// No description provided for @cover_x.
  ///
  /// In zh, this message translates to:
  /// **'封面X偏移'**
  String get cover_x;

  /// No description provided for @cover_y.
  ///
  /// In zh, this message translates to:
  /// **'封面Y偏移'**
  String get cover_y;

  /// No description provided for @subtitle.
  ///
  /// In zh, this message translates to:
  /// **'副标题'**
  String get subtitle;

  /// No description provided for @upload_time.
  ///
  /// In zh, this message translates to:
  /// **'上传时间'**
  String get upload_time;

  /// No description provided for @star.
  ///
  /// In zh, this message translates to:
  /// **'评分'**
  String get star;

  /// No description provided for @language.
  ///
  /// In zh, this message translates to:
  /// **'语言'**
  String get language;

  /// No description provided for @description.
  ///
  /// In zh, this message translates to:
  /// **'描述'**
  String get description;

  /// No description provided for @image_count.
  ///
  /// In zh, this message translates to:
  /// **'总图片数'**
  String get image_count;

  /// No description provided for @page_count.
  ///
  /// In zh, this message translates to:
  /// **'总页数'**
  String get page_count;

  /// No description provided for @image_pre_page.
  ///
  /// In zh, this message translates to:
  /// **'每页图片数'**
  String get image_pre_page;

  /// No description provided for @blur_android_warning.
  ///
  /// In zh, this message translates to:
  /// **'由于Android设备限制，导致此功能在部分设备上无效，请优先使用Android自带模糊功能'**
  String get blur_android_warning;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
