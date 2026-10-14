import 'package:flutter/material.dart';
import 'model/knowledge.dart';
import 'category_page.dart';

/// 【一级页面】首页：显示所有知识点「分类」。
/// 点某个分类 → 进入二级(该分类的知识点列表) → 再点 → 三级(详情)。
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter 知识点'),
      ),
      // ListView.separated：带「分隔线」的列表(UITableView)。每两行间自动插一条分隔。
      //   列表「按需构建」:只有要上屏的行才创建,数据再多也不卡。
      body: ListView.separated(
        // itemCount：一共多少行。这里数据源直接用 model 里定义好的 knowledgeData。
        itemCount: knowledgeData.length,
        // separatorBuilder：两行之间的分隔,统一返回一条高度 1 的灰线。
        separatorBuilder: (context, index) => const Divider(height: 1),
        // itemBuilder：构建第 index 行(相当于 cellForRowAt)。
        itemBuilder: (context, index) {
          // 取出当前行对应的「分类」数据。
          final category = knowledgeData[index];
          return ListTile(
            // 行首序号(index 从 0 起,所以 +1 显示成 1. 2. 3.)
            leading: CircleAvatar(child: Text('${index + 1}')),
            // 主标题:分类名,并通过 style 调大字号、加粗一点。
            title: Text(
              category.title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            // 副标题:顺带显示这个分类下有几个知识点。
            subtitle: Text('${category.points.length} 个知识点'),
            // 行尾灰色右箭头,暗示可点进去。
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () {
              // 点击分类 → 跳到【二级】页面，把选中的 category 传过去。
              //
              // Navigator.push：把新页面压入导航栈，相当于 pushViewController。
              // MaterialPageRoute：描述"怎么过渡过去"(自带平台默认转场动画 +
              //   自动在新页面左上角生成返回按钮)。
              // builder: (context) => 页面：真正要跳转去的那个页面。
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(category: category),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
