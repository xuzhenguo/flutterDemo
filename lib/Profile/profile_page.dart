import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'about_page.dart';

/// ProfilePage：第三个 Tab「个人中心」页面（学习版）。
///
/// 这里做一个常见的「我的」页面，用来练习几个高频布局/组件：
///   - 顶部个人信息卡片：头像 + (昵称 / 简介)，点一下弹出「编辑资料」对话框
///   - 分组的设置列表：一行行带图标的条目，点「关于」会跳到真正的新页面
///
/// 页面本身没有可变状态，所以用 StatelessWidget 就够了
/// (相当于 iOS 里一个内容写死、没有可变状态的 UIViewController)。
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 整页背景设成浅灰：这样下面白色的卡片/分组能「浮」出来，
      // 是「我的」页面常见的分组灰底效果(类似 iOS 的 grouped UITableView 背景)。
      backgroundColor: AppColors.pageBackground,
      // AppBar 背景色已在 main.dart 的 appBarTheme 里统一设置，这里不用再写。
      appBar: AppBar(
        title: const Text('个人中心'),
      ),
      // ListView：把整页做成可上下滚动，条目再多也不会溢出屏幕。
      body: ListView(
        children: [
          // ===== 1. 顶部个人信息卡片 =====
          _buildHeader(context),

          const SizedBox(height: 12), // 卡片与下面分组之间留一段灰色间隔

          // ===== 2. 第一组设置项 =====
          _buildGroup(
            context,
            items: [
              _MenuItem(Icons.star_outline, '我的收藏'),
              _MenuItem(Icons.access_time, '浏览历史'),
              _MenuItem(Icons.download_outlined, '我的下载'),
            ],
          ),

          const SizedBox(height: 12),

          // ===== 3. 第二组设置项 =====
          _buildGroup(
            context,
            items: [
              _MenuItem(Icons.settings_outlined, '设置'),
              // 「关于」给了自定义 onTap：点它会 Navigator.push 到 AboutPage。
              _MenuItem(
                Icons.info_outline,
                '关于',
                onTap: (context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
  // PROFILE_PLACEHOLDER

  /// 顶部个人信息卡片：头像 + (昵称 / 简介)，整体白底一块，点一下弹对话框。
  Widget _buildHeader(BuildContext context) {
    // 用 Material + InkWell：既能做白底，点击时又有水波纹反馈。
    return Material(
      color: Colors.white, // 卡片白底，衬在灰色页面背景上
      child: InkWell(
        onTap: () => _showEditProfileDialog(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          // Row：头像在左、文字在右，横向排列。
          child: Row(
            // 交叉轴(垂直方向)对齐方式。center=垂直居中。
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 圆形头像：这里先用一个图标占位，真实项目里换成网络/本地图片。
              const CircleAvatar(
                radius: 32, // 半径，决定头像大小
                backgroundColor: AppColors.avatarBackground,
                child: Icon(Icons.person, size: 36, color: AppColors.seed),
              ),
              const SizedBox(width: 16), // 头像和文字之间的横向间距
              // Expanded：让右侧文字区占满「头像之外」的剩余宽度，
              // 这样长昵称/简介才能正常换行或省略，不会把 Row 向右撑爆。
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // 文字靠左对齐
                  children: const [
                    Text(
                      'Flutter 学习者',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '从 iOS 转 Flutter，记录学习过程',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis, // 简介过长时用省略号
                    ),
                  ],
                ),
              ),
              // 行尾灰色右箭头，暗示「点进去可以编辑资料」。
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  /// 点头像卡片弹出的「编辑资料」对话框(学习版，只展示交互，不真的改数据)。
  void _showEditProfileDialog(BuildContext context) {
    // showDialog：弹出一个居中的模态对话框，相当于 iOS 的 UIAlertController。
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('编辑资料'),
          content: const Text('这里之后可以放昵称、头像的编辑表单。'),
          actions: [
            // 关闭按钮：Navigator.pop 把对话框从栈里弹走。
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('知道了'),
            ),
          ],
        );
      },
    );
  }

  /// 构建「一组」设置项：白底卡片 + 若干行，行与行之间带分隔线。
  /// [items]：这一组要显示哪些条目。
  Widget _buildGroup(BuildContext context, {required List<_MenuItem> items}) {
    // 用 Material 而不是 Container 来做白底：
    // ListTile 的点击水波纹是画在「最近的 Material 层」上的，
    // 如果直接用 Container(color:) 当背景，会盖住水波纹(调试模式下还会报警告)。
    // 所以这里用 Material(color:) 既提供白底，又让水波纹正常显示。
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          // 集合 for：把每个数据项展开成一行，相当于循环往 children 里塞组件。
          // 末尾的 ...[] 是「展开(spread)」：把一次循环产生的多个组件摊平进列表。
          for (int i = 0; i < items.length; i++) ...[
            ListTile(
              leading:
                  Icon(items[i].icon, color: AppColors.seed), // 行首图标
              title: Text(items[i].title), // 条目文字
              trailing: const Icon(Icons.chevron_right,
                  color: Colors.grey), // 右箭头
              onTap: () {
                // 如果这个条目带了自定义 onTap(比如「关于」要跳页)，就执行它；
                // 否则给个默认的轻提示(SnackBar，类似 iOS 的短暂 toast)。
                final custom = items[i].onTap;
                if (custom != null) {
                  custom(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('点击了「${items[i].title}」'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                }
              },
            ),
            // 除最后一行外，每行底部补一条「左侧缩进」的分隔线，
            // indent: 56 让分隔线从文字处开始、避开左边图标，更美观。
            if (i != items.length - 1) const Divider(height: 1, indent: 56),
          ],
        ],
      ),
    );
  }
}

/// 一个设置项的「数据模型」：图标 + 文字标题 + (可选)点击行为。
/// 用一个小类把数据打包，比到处传零散参数更清晰(相当于 OC 里的一个 Model)。
class _MenuItem {
  final IconData icon; // 行首图标
  final String title; // 条目标题
  // 可选的自定义点击回调；为 null 时用默认的 SnackBar 轻提示。
  final void Function(BuildContext context)? onTap;
  const _MenuItem(this.icon, this.title, {this.onTap});
}
