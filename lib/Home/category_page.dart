import 'package:flutter/material.dart';
import 'model/knowledge.dart';
import 'point_detail_page.dart';

/// 【二级页面】知识点列表页。显示某个分类下的所有知识点。
/// 由一级页面把选中的 category 传进来。
class CategoryPage extends StatelessWidget {
  final KnowledgeCategory category; // 上一页传入的分类

  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title), // 导航栏显示分类名
      ),
      // ListView.separated：带「分隔线」的列表，相当于 iOS 的 UITableView。
      //   .separated 这个「命名构造函数」会在每两行之间自动插一条分隔。
      //   列表是「按需构建」的：只有即将滚动到屏幕上的行才会被创建，
      //   所以哪怕有一万条数据也不卡 —— 类似 cellForRowAt 的复用机制。
      body: ListView.separated(
        // itemCount：一共有多少行。这里 = 该分类下知识点的数量。
        itemCount: category.points.length,

        // separatorBuilder：构建「两行之间的分隔」。
        //   框架会在第 0 行和第 1 行之间、第 1 行和第 2 行之间……各调用一次,
        //   参数 index 是「上面那一行」的下标。
        //   这里统一返回一条高度 1 的灰色分割线(Divider)。
        separatorBuilder: (context, index) => const Divider(height: 1),

        // itemBuilder：构建「第 index 行」长什么样,是列表的核心。
        //   每要显示一行,框架就带着该行下标 index 调用它一次,返回这行的 Widget。
        //   相当于 UITableView 的 cellForRowAt。
        itemBuilder: (context, index) {
          // 用下标从数据里取出当前这一行对应的知识点。
          final point = category.points[index];
          // ListTile：现成的「列表行」组件,帮你排好「左图标 + 标题 + 右箭头」的常见样式。
          return ListTile(
            // leading：行首控件。CircleAvatar 是个圆形,里面放序号(index 从 0 开始,所以 +1)。
            leading: CircleAvatar(child: Text('${index + 1}')),
            // title：这一行的主文字,显示知识点标题。
            title: Text(point.title),
            // trailing：行尾控件,放一个灰色右箭头,暗示「可点进去」。
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            // onTap：点这一行时触发的回调。
            onTap: () {
              // 点击知识点 → 跳到【三级】详情页,并把该知识点数据 point 传过去。
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PointDetailPage(point: point),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
