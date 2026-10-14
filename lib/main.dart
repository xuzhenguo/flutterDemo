// import：导入 Flutter 的 Material 组件库，相当于 OC 里 #import <UIKit/UIKit.h>。
import 'package:flutter/material.dart';
// 导入底部 Tab 容器页，它现在是 App 的首页。
import 'main_tab_page.dart';

// main() 是整个程序的入口函数，相当于 iOS 的 @UIApplicationMain。
// runApp() 把根组件挂到屏幕上开始渲染。
void main() {
  runApp(const MyApp());
}

/// MyApp：应用的「根组件」，整个 App 的全局配置，相当于 iOS 的 AppDelegate。
/// 注意：MaterialApp 整个 App 只写这一次。
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp 是 App 外壳，提供主题、路由(内置 Navigator)、导航等全局能力。
    return MaterialApp(
      title: 'List Demo',
      // 关掉右上角的 DEBUG 斜条标识（只在 debug 模式下才会显示）。
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home：App 启动后显示的第一个页面。
      // 现在是底部 Tab 容器(MainTabPage)，里面再切换首页/动态/个人中心。
      home: const MainTabPage(),
    );
  }
}
