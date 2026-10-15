import 'package:flutter/material.dart';

/// 全局颜色常量。把散落在各页面里的「魔法颜色值」收到一处集中管理，
/// 改配色只改这里即可，也避免同一个颜色在多个文件里被写死好几遍。
/// (真实项目里通常还会配合 ThemeData / ColorScheme 一起用。)
class AppColors {
  // 构造函数设为私有，禁止被实例化：这个类只用来存静态常量。
  AppColors._();

  /// 主题种子色：整个 App 的配色都由它推导(见 main.dart 的 ColorScheme.fromSeed)。
  static const Color seed = Colors.deepPurple;

  /// 分组页「灰底」背景色(个人中心那种 iOS 分组列表的浅灰)。
  static const Color pageBackground = Color(0xFFF2F2F7);

  /// 头像占位背景色(浅紫)。
  static const Color avatarBackground = Color(0xFFD1C4E9);
}
