import 'package:flutter/material.dart';

/// ProfilePage：第三个 Tab「个人中心」页面。
/// 同样先做占位页，后面再填头像、设置项等内容。
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('个人中心'),
      ),
      body: const Center(
        child: Text('这里是「个人中心」页', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
