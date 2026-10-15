// import：导入 Flutter 的 Material 组件库，相当于 OC 里 #import <UIKit/UIKit.h>。
import 'package:flutter/material.dart';
// 导入底部 Tab 容器页，它现在是 App 的首页。
import 'main_tab_page.dart';
// 全局颜色常量（主题种子色等集中在这里）。
import 'theme/app_colors.dart';

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
    // 由种子色推导出整套配色；下面主题和 AppBar 都复用它，避免重复写死颜色。
    final colorScheme = ColorScheme.fromSeed(seedColor: AppColors.seed);
    // MaterialApp 是 App 外壳，提供主题、路由(内置 Navigator)、导航等全局能力。
    return MaterialApp(
      title: 'Flutter 学习 Demo',
      // 关掉右上角的 DEBUG 斜条标识（只在 debug 模式下才会显示）。
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: colorScheme,
        // 统一所有页面 AppBar 的背景色：集中到这里设一次，
        // 各页面就不用再逐个写 backgroundColor，改配色也只改这一处。
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.inversePrimary,
        ),
      ),
      // home：App 启动后显示的第一个页面。
      // 现在是底部 Tab 容器(MainTabPage)，里面再切换首页/动态/个人中心。
      home: const MainTabPage(),
    );
  }
}
