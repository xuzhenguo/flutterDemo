import 'package:flutter/material.dart';
// 数据模型和示例数据已拆到 model/moment.dart,这里导入使用。
import 'model/moment.dart';

/// DynamicPage：第二个 Tab「动态」页面。
/// 这里做一个简单的动态列表,专门用来练习布局(Row / Column / Expanded / Padding 等)。
class DynamicPage extends StatelessWidget {
  const DynamicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('动态'),
      ),
      // 列表:每条动态之间用一条浅灰分隔线隔开。
      body: ListView.separated(
        itemCount: momentData.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        // 每一行调用 _buildMomentItem 构建,代码拆出去,build 方法更清爽。
        itemBuilder: (context, index) => _buildMomentItem(momentData[index]),
      ),
    );
  }

  /// 构建单条动态。这是本页布局练习的核心。
  ///
  /// 整体结构(从外到内一层层套盒子):
  ///   Padding(四周留白)
  ///     └ Column(整条动态竖向排:头部 / 正文 / 底部操作栏)
  ///          ├ Row     —— 头部:头像 + (昵称 / 时间)
  ///          ├ Text    —— 正文
  ///          └ Row     —— 底部:点赞 + 评论
  Widget _buildMomentItem(Moment moment) {
    return Padding(
      // 四周留白:左右 16,上下 12。EdgeInsets.symmetric 分别设水平/垂直方向。
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      // Column:子组件「竖向」依次排列。
      child: Column(
        // 交叉轴(这里是水平方向)靠左对齐,让正文、头部都从左边起。
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== 头部:头像 + 昵称/时间,横向排 → 用 Row =====
          Row(
            children: [
              // 圆形头像(简化成一个图标)。
              CircleAvatar(
                backgroundColor: Colors.deepPurple.shade100,
                child: Icon(moment.avatar, color: Colors.deepPurple),
              ),
              // 头像和文字之间留 10 的横向间距。
              const SizedBox(width: 10),
              // 昵称在上、时间在下 → 竖向排 → 用 Column。
              // 用 Expanded 包住:让文字区占满「头像之外的剩余宽度」,
              // 有了明确的宽度上限,下面 Text 的 maxLines + ellipsis 才能生效,
              // 否则 Row 会让文字无限向右撑开 → 右边越界报错。
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //moment.name
                      "1341234123412341o23u41i23u4oi123uoi4123oi4u12o3u412io34u1oi234uo1i23u4o1i234uo1i234u1o2i34ui13o24",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1, // 最多一行
                      overflow: TextOverflow.ellipsis, // 超出部分显示省略号
                    ),
                    Text(
                      moment.time,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // 头部和正文之间留 8 的竖向间距。
          const SizedBox(height: 8),

          // ===== 正文 =====
          Text(
            moment.content,
            style: const TextStyle(fontSize: 15, height: 1.5), // height=行高倍数
          ),

          const SizedBox(height: 8),

          // ===== 底部操作栏:点赞 + 评论,横向排 → 用 Row =====
          Row(
            children: [
              // 点赞:一个爱心图标 + 数字,用小 Row 组合。
              Icon(Icons.favorite_border, size: 18, color: Colors.grey.shade600),
              const SizedBox(width: 4),
              Text('${moment.likes}', style: TextStyle(color: Colors.grey.shade600)),

              // 两组之间留 20 的间距。
              const SizedBox(width: 20),

              // 评论:气泡图标 + 数字。
              Icon(Icons.chat_bubble_outline, size: 18, color: Colors.grey.shade600),
              const SizedBox(width: 4),
              Text('${moment.comments}', style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
        ],
      ),
    );
  }
}

