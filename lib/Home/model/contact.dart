// IconData 来自 Material 库，所以要导入它。
import 'package:flutter/material.dart';

/// Contact：联系人数据模型，相当于 iOS 里的一个 Model(struct / NSObject 子类)。
/// 模型类一般单独放在 model 文件夹，方便多个页面共用。
class Contact {
  final String name; // 姓名。final = 一旦赋值不可改，相当于 Swift 的 let。
  final String phone; // 电话
  final IconData icon; // 头像用的图标

  // 构造函数。{required ...} 表示命名参数且必传，相当于 Swift 的 init(name:phone:icon:)。
  const Contact({required this.name, required this.phone, required this.icon});
}
