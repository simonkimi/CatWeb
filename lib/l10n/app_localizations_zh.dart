// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get parser => '解析器';

  @override
  String get action => '动作器';

  @override
  String get positive => '确认';

  @override
  String get negative => '取消';

  @override
  String get selector => '选择器';

  @override
  String get search => '搜索';

  @override
  String get name => '名称';

  @override
  String get key => '键';

  @override
  String get value => '值';

  @override
  String get script => '脚本';

  @override
  String get filter => '过滤器';

  @override
  String get color => '颜色';

  @override
  String get add => '添加';

  @override
  String get remove => '移除';

  @override
  String get edit => '编辑';

  @override
  String get save => '保存';

  @override
  String get cancel => '取消';

  @override
  String get close => '关闭';

  @override
  String get apply => '应用';

  @override
  String get reset => '重置';

  @override
  String get back => '返回';

  @override
  String get setting => '设置';

  @override
  String get display => '显示';

  @override
  String get type => '类型';

  @override
  String get default_value => '默认';

  @override
  String get page => '页面';

  @override
  String get icon => '图标';

  @override
  String get none => '无';

  @override
  String get title => '标题';

  @override
  String get index => '索引';

  @override
  String get download => '下载';

  @override
  String get comment => '评论';

  @override
  String get security => '安全';

  @override
  String get about => '关于';

  @override
  String get advanced => '高级';

  @override
  String get delete => '删除';

  @override
  String get basic => '基础';

  @override
  String get exit => '退出';

  @override
  String get login => '登录';

  @override
  String get logout => '注销';

  @override
  String get import => '导入';

  @override
  String get reg => '正则';

  @override
  String get content => '内容';

  @override
  String get website => '网站';

  @override
  String get disable => '禁用';

  @override
  String get read => '阅读';

  @override
  String get identity => '身份';

  @override
  String get form => '表单';

  @override
  String get rule_edit => '规则编辑';

  @override
  String get exit_not_save => '您确定不保存而退出吗？\n所做的修改将不会保存。';

  @override
  String get rule_name_empty => '规则名称不能为空';

  @override
  String get base_url_empty => '基础Url不能为空';

  @override
  String get net_action => '请求方式';

  @override
  String get display_type => '显示方式';

  @override
  String get read_jump_to => '阅读跳转';

  @override
  String get item_jump_to => '项目跳转';

  @override
  String get auto_complete_jump_to => '自动补全设定';

  @override
  String get select_parser => '请选择解析器';

  @override
  String get select_net_action => '请选择请求方式';

  @override
  String get add_site => '添加站点';

  @override
  String get no_site => '没有找到任何站点';

  @override
  String get import_cookie => '将导入以下Cookies';

  @override
  String get login_with_security =>
      '登录地址和网站地址不在同一个域名下，安全模式已开启，将会保护您的认证令牌(可能造成某些网站异常)，若要关闭，请前往网站设置';

  @override
  String get login_success => '登录成功';

  @override
  String login_without_security(String description) {
    return '登录地址和网站地址不在同一个域名下，请确认您信任此规则发布者，否则您的认证令牌可能会被盗用! 是否继续登录？\n规则创建者解释如下：\n$description';
  }

  @override
  String get press_again_to_exist => '再按一次退出';

  @override
  String delete_confirm(String value) {
    return '确定要删除 $value 吗？';
  }

  @override
  String get network_not_success_flag => '没有请求到有效数据';

  @override
  String get basic_setting => '基础';

  @override
  String get page_manager => '页面';

  @override
  String get base_url => '基础URL';

  @override
  String get login_url => '登录URL';

  @override
  String get login_url_reg => 'Cookie登录URL正则';

  @override
  String get check_upgrade_url => '更新URL';

  @override
  String get script_clear => '确定清除脚本?';

  @override
  String get preview => '预览';

  @override
  String get dark_mask => '深色模式下预览图片变暗';

  @override
  String get image_concurrency => '同时加载图片数量';

  @override
  String get no_limit => '不限制';

  @override
  String get pre_load_count => '预加载数量';

  @override
  String get read_direction => '阅读方向';

  @override
  String get ltr => '从左到右';

  @override
  String get rtl => '从右到左';

  @override
  String get ttb => '从上到下';

  @override
  String get basic_info => '基础信息';

  @override
  String get next_page => '下一面';

  @override
  String get badge => '徽章';

  @override
  String get badge_item => '徽章项目';

  @override
  String get badge_content => '徽章内容';

  @override
  String get badge_type => '徽章类型';

  @override
  String get comment_item => '评论项目';

  @override
  String get comment_content => '评论内容';

  @override
  String get username => '用户名';

  @override
  String get comment_time => '评论时间';

  @override
  String get comment_score => '评论评分';

  @override
  String get tag => '分类';

  @override
  String get tag_color => '分类颜色';

  @override
  String get thumbnail => '缩略图';

  @override
  String get thumbnail_target => '目标';

  @override
  String get thumbnail_selector => '缩略图项目';

  @override
  String get thumbnail_img => '缩略图地址';

  @override
  String get thumbnail_width => '缩略图宽度';

  @override
  String get thumbnail_height => '缩略图高度';

  @override
  String get thumbnail_x => '缩略图X偏移';

  @override
  String get thumbnail_y => '缩略图Y偏移';

  @override
  String get cover => '封面';

  @override
  String get cover_img => '封面地址';

  @override
  String get cover_width => '封面宽度';

  @override
  String get cover_height => '封面高度';

  @override
  String get cover_x => '封面X偏移';

  @override
  String get cover_y => '封面Y偏移';

  @override
  String get subtitle => '副标题';

  @override
  String get upload_time => '上传时间';

  @override
  String get star => '评分';

  @override
  String get language => '语言';

  @override
  String get description => '描述';

  @override
  String get image_count => '总图片数';

  @override
  String get page_count => '总页数';

  @override
  String get image_pre_page => '每页图片数';

  @override
  String get blur_android_warning =>
      '由于Android设备限制，导致此功能在部分设备上无效，请优先使用Android自带模糊功能';
}
