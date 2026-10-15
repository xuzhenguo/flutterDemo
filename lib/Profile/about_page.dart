import 'package:flutter/material.dart';

/// AboutPage：个人中心「关于」点进来的页面(学习版)。
///
/// 作用：练习「从列表行 Navigator.push 到一个真正的新页面」，
/// 并展示一个简单的信息排版(应用名 / 版本 / 一段说明)。
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar 背景色已在 main.dart 的 appBarTheme 里统一设置，这里不用再写。
      appBar: AppBar(
        title: const Text('关于'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          // 顶部一个居中的 App 图标 + 名称 + 版本号。
          const Center(
            child: FlutterLogo(size: 72),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Flutter 学习 Demo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(
              'v1.0.0',
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),
          ),
          const SizedBox(height: 32),
          // 一段说明文字，四周留白。
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              '这是一个用来入门 Flutter 的练习项目：底部三 Tab 结构，'
              '首页含三级页面导航，源码带详细中文注释，'
              '并不断用 iOS 概念做类比，方便有原生开发经验的人快速理解。',
              style: TextStyle(fontSize: 14, height: 1.6),
            ),
          ),
        ],
      ),
    );
  }
}
