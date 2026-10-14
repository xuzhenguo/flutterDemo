import 'package:flutter/material.dart';
import 'model/knowledge.dart';

/// 【三级页面】知识点详情页。显示某个 KnowledgePoint 的标题和正文。
///
/// 它需要「展示哪个知识点」的数据，所以通过构造函数把 point 传进来 ——
/// 这就是 Flutter 的页面传参方式，相当于 iOS 给目标 VC 的属性赋值后再 push。
class PointDetailPage extends StatelessWidget {
  final KnowledgePoint point; // 由上一个页面传入的知识点数据

  const PointDetailPage({super.key, required this.point});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(point.title), // 用传入数据的标题当导航栏标题
      ),
      // SingleChildScrollView：让内容在超出屏幕时可以上下滚动，
      // 避免正文太长时溢出报错。
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16), // 四周留 16 的内边距
        child: Text(
          point.content,
          style: const TextStyle(fontSize: 16, height: 1.6), // height=行高倍数
        ),
      ),
    );
  }
}
