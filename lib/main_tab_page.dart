import 'package:flutter/material.dart';
// 导入三个 Tab 对应的页面。注意路径都是从 lib 下的文件夹开始。
import 'Home/home_page.dart';
import 'Dynamic/dynamic_page.dart';
import 'Profile/profile_page.dart';

/// MainTabPage：底部 Tab 的「容器页」，相当于 iOS 的 UITabBarController。
///
/// 为什么用 StatefulWidget？
/// 因为「当前选中的是第几个 tab」这个值会随用户点击而变化，
/// 界面要跟着变 —— 凡是「界面会随数据变化」的场景，就要用 StatefulWidget。
/// (之前的 HomePage 内容固定，所以用 StatelessWidget 就够了。)
class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  // StatefulWidget 必须配一个 State 对象，真正的「可变数据 + build」都写在 State 里。
  // 这行相当于告诉框架：我的状态由 _MainTabPageState 管理。
  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

/// 下划线开头 _ 表示「私有」(只在本文件可见)，相当于 OC 的内部实现类。
class _MainTabPageState extends State<MainTabPage> {
  // _currentIndex：当前选中的 tab 下标(0=首页, 1=动态, 2=个人中心)。
  // 这就是会变化的「状态」，相当于 UITabBarController.selectedIndex。
  int _currentIndex = 0;

  // 三个 tab 对应的页面列表，顺序和底部按钮一一对应。
  // const 表示这三个页面对象是编译期常量，不会每次 build 都重建。
  static const List<Widget> _pages = [
    HomePage(), // index 0
    DynamicPage(), // index 1
    ProfilePage(), // index 2
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body：显示当前选中的那个页面。
      //
      // IndexedStack：把三个页面都「叠」在一起，只显示第 _currentIndex 个。
      // 好处是切换 tab 时另外两个页面不会被销毁，状态会保留
      // (比如首页列表滚动的位置)，行为和 UITabBarController 一致。
      // 如果直接写 _pages[_currentIndex]，切走的页面会被销毁、回来时重建。
      body: IndexedStack(index: _currentIndex, children: _pages),

      // bottomNavigationBar：底部导航栏，相当于 iOS 的 UITabBar。
      // 用 Theme 包一层，把点击时的「水波纹 + 高亮」颜色设为透明，
      // 就能去掉那个半透明灰色的圆形点击效果(Material 默认的 ripple)。
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent, // 水波纹颜色 → 透明
          highlightColor: Colors.transparent, // 长按高亮 → 透明
          splashFactory: NoSplash.splashFactory, // 彻底不生成水波纹
        ),
        child: BottomNavigationBar(
        // currentIndex：告诉它当前高亮第几个。
        currentIndex: _currentIndex,

        // type.fixed：固定模式，所有 tab 平均分布、始终显示文字
        //(3 个及以上时如果不设，默认会变成只高亮项显示文字的 shifting 效果)。
        type: BottomNavigationBarType.fixed,

        // onTap：点击某个 tab 的回调，参数 index 是被点的下标。
        onTap: (index) {
          // setState：通知框架「状态变了，请重新 build」。
          // 这是 Flutter 状态驱动 UI 的核心：改数据必须包在 setState 里，
          // 否则界面不会刷新。相当于手动触发一次 UI 更新。
          setState(() {
            _currentIndex = index;
          });
        },

        // items：底部每个按钮,数量和顺序要和 _pages 对应。
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), // 未选中时的图标
            activeIcon: Icon(Icons.home), // 选中时的图标(实心)
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: '动态',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: '个人中心',
          ),
        ],
        ),
      ),
    );
  }
}
