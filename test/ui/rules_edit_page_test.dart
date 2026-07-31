import 'package:catweb/l10n/app_localizations.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_add_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('rule editor exposes forms and no JSON source editor', (
    tester,
  ) async {
    await tester.pumpWidget(
      const CupertinoApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: RulesEditPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('基础'), findsOneWidget);
    expect(find.text('页面'), findsOneWidget);
    expect(find.text('解析器'), findsOneWidget);
    expect(find.text('高级'), findsOneWidget);
    expect(find.text('名称'), findsOneWidget);
    expect(find.text('基础URL'), findsOneWidget);
    expect(find.text('标志'), findsOneWidget);
    expect(find.text('登录URL'), findsOneWidget);
    expect(find.text('Schema v2 JSON'), findsNothing);

    await tester.tap(find.text('页面'));
    await tester.pumpAndSettle();
    expect(find.text('添加'), findsOneWidget);

    await tester.tap(find.text('解析器'));
    await tester.pumpAndSettle();
    expect(find.text('添加'), findsOneWidget);
  });

  testWidgets('selector editor restores xpath parameters and scripts', (
    tester,
  ) async {
    await tester.pumpWidget(
      const CupertinoApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: RulesEditPage(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('解析器'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('通用列表'));
    await tester.pumpAndSettle();

    expect(find.text('基础规则'), findsOneWidget);
    expect(find.text('附加字段'), findsOneWidget);
    expect(find.text('项目选择器'), findsOneWidget);

    await tester.tap(find.text('项目选择器'));
    await tester.pumpAndSettle();
    expect(find.text('选择器'), findsOneWidget);
    expect(find.text('类型'), findsOneWidget);
    expect(find.text('xpath'), findsOneWidget);
    expect(find.text('函数'), findsOneWidget);
    expect(find.text('正则'), findsOneWidget);
    expect(find.text('替换'), findsOneWidget);
    expect(find.text('默认值'), findsOneWidget);
    expect(find.text('脚本'), findsOneWidget);

    await tester.tap(find.text('函数'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('attr'));
    await tester.pumpAndSettle();
    expect(find.text('参数'), findsOneWidget);

    await tester.tap(find.text('脚本'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Js脚本'));
    await tester.pumpAndSettle();
    expect(find.text('JavaScript'), findsOneWidget);
    expect(find.text('Schema v2 JSON'), findsNothing);
  });

  testWidgets('list page restores subpages filters and filter script', (
    tester,
  ) async {
    await tester.pumpWidget(
      const CupertinoApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: RulesEditPage(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('页面'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('主页'));
    await tester.pumpAndSettle();

    expect(find.text('基础'), findsOneWidget);
    expect(find.text('子页面'), findsOneWidget);
    expect(find.text('筛选'), findsOneWidget);

    await tester.tap(find.text('筛选'));
    await tester.pumpAndSettle();
    expect(find.text('脚本'), findsOneWidget);
    expect(find.text('同人志'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('搜索画廊标签'),
      300,
      scrollable: find.byType(Scrollable).last,
    );
    expect(find.text('搜索画廊标签'), findsOneWidget);
    expect(find.text('Schema v2 JSON'), findsNothing);
  });
}
