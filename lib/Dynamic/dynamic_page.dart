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
        title: const Text('动态'),
      ),
      // 列表:每条动态之间用一条浅灰分隔线隔开。
      body: ListView.separated(
        itemCount: momentData.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        // 每一行用 _MomentItem 构建。它是个 StatefulWidget，
        // 这样「点赞」才能记住自己是否被点过(局部状态)。
        itemBuilder: (context, index) => _MomentItem(moment: momentData[index]),
      ),
    );
  }
}

/// 单条动态。做成 StatefulWidget 是为了练习「局部状态」：
/// 点一下爱心能在「已赞/未赞」之间切换，并实时更新数量和颜色。
///
/// 整体结构(从外到内一层层套盒子):
///   Padding(四周留白)
///     └ Column(整条动态竖向排:头部 / 正文 / 底部操作栏)
///          ├ Row     —— 头部:头像 + (昵称 / 时间)
///          ├ Text    —— 正文
///          └ Row     —— 底部:点赞 + 评论
class _MomentItem extends StatefulWidget {
  final Moment moment;

  const _MomentItem({required this.moment});

  @override
  State<_MomentItem> createState() => _MomentItemState();
}

class _MomentItemState extends State<_MomentItem> {
  // 当前这条动态「我有没有点过赞」。初始都未点。
  bool _liked = false;

  // 显示的点赞数:在原始数据基础上，点过就 +1。
  // (真实项目里会把状态提交到后端;这里只做本地演示。)
  int get _likeCount => widget.moment.likes + (_liked ? 1 : 0);

  // 点爱心:切换状态并用 setState 通知框架重建这一行。
  void _toggleLike() {
    setState(() => _liked = !_liked);
  }

  @override
  Widget build(BuildContext context) {
    // widget.moment：State 里通过 widget 访问外部传进来的数据。
    final moment = widget.moment;
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
                      moment.name,
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
              // 点赞:整块(图标+数字)用 InkWell 包起来做成可点区域。
              // 点一下 → _toggleLike → setState → 这一行重建 → 图标和数字跟着变。
              InkWell(
                onTap: _toggleLike,
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // 只占内容宽度，别撑满
                    children: [
                      // 已赞:实心红心;未赞:空心灰心。
                      Icon(
                        _liked ? Icons.favorite : Icons.favorite_border,
                        size: 18,
                        color: _liked ? Colors.red : Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$_likeCount',
                        style: TextStyle(
                          color: _liked ? Colors.red : Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 两组之间留 16 的间距。
              const SizedBox(width: 16),

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

