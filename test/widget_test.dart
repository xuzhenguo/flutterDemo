// 本项目的 Widget 冒烟测试。
//
// 验证 App 启动后底部三个 Tab 正常显示，并且可以切换到「个人中心」页。
// 用 WidgetTester 可以模拟点击、滚动等交互，并断言界面上的文字/组件是否存在。

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_demo/main.dart';

void main() {
  testWidgets('底部三 Tab 正常显示并可切换', (WidgetTester tester) async {
    // 构建 App 并渲染一帧。
    await tester.pumpWidget(const MyApp());

    // 启动后默认停在「首页」，应能看到首页导航栏标题。
    expect(find.text('Flutter 知识点'), findsOneWidget);

    // 底部三个 Tab 的文字标签都应存在。
    expect(find.text('首页'), findsOneWidget);
    expect(find.text('动态'), findsOneWidget);
    expect(find.text('个人中心'), findsOneWidget);

    // 切换前，「个人中心」页的内容还在屏幕外（Offstage），找不到。
    expect(find.text('Flutter 学习者'), findsNothing);

    // 点击「个人中心」Tab 并等待动画结束。
    await tester.tap(find.text('个人中心'));
    await tester.pumpAndSettle();

    // 切换后应出现「个人中心」页顶部卡片里的昵称。
    expect(find.text('Flutter 学习者'), findsOneWidget);
  });

  testWidgets('动态页点赞可切换(空心→实心)', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // 切到「动态」Tab。
    await tester.tap(find.text('动态'));
    await tester.pumpAndSettle();

    // 初始：至少有一个「未点赞」的空心爱心，没有实心爱心。
    expect(find.byIcon(Icons.favorite_border), findsWidgets);
    expect(find.byIcon(Icons.favorite), findsNothing);

    // 点第一条动态的点赞按钮。
    await tester.tap(find.byIcon(Icons.favorite_border).first);
    await tester.pumpAndSettle();

    // 点完后应出现一个实心爱心(该条已点赞)。
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
}
