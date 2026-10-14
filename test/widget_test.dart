// 本项目的 Widget 冒烟测试。
//
// 验证 App 启动后底部三个 Tab 正常显示，并且可以切换到「个人中心」页。
// 用 WidgetTester 可以模拟点击、滚动等交互，并断言界面上的文字/组件是否存在。

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

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

    // 切换前，「个人中心」页的占位文字还在屏幕外（Offstage），找不到。
    expect(find.text('这里是「个人中心」页'), findsNothing);

    // 点击「个人中心」Tab 并等待动画结束。
    await tester.tap(find.text('个人中心'));
    await tester.pumpAndSettle();

    // 切换后应出现「个人中心」页的占位文字。
    expect(find.text('这里是「个人中心」页'), findsOneWidget);
  });
}
