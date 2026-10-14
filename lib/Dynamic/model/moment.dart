import 'package:flutter/material.dart';

/// 「动态」数据模型。单独放在 model 文件夹,和页面(怎么显示)分开,
/// 这样页面只管布局、模型只管数据结构,各司其职,也方便别处复用。
///
/// 没有写 extends,所以基类是 Object(Dart 里所有类默认都继承 Object)。
class Moment {
  final String name; // 发布人昵称
  final String time; // 发布时间(这里用写死的字符串)
  final String content; // 正文内容
  final IconData avatar; // 头像图标(简化,用 Icon 代替真实头像图)
  final int likes; // 点赞数
  final int comments; // 评论数

  const Moment({
    required this.name,
    required this.time,
    required this.content,
    required this.avatar,
    required this.likes,
    required this.comments,
  });
}

/// 写死的几条动态数据,用来填充列表(以后可换成网络请求的结果)。
const List<Moment> momentData = [
  Moment(
    name: '小明',
    time: '2 分钟前',
    content: '今天开始学 Flutter 的布局,Row 和 Column 真的好用!横着排用 Row,竖着排用 Column。',
    avatar: Icons.face,
    likes: 12,
    comments: 3,
  ),
  Moment(
    name: '阿强',
    time: '1 小时前',
    content: '搞懂了 Expanded,它能把剩余空间按比例撑满,再也不用手算宽度了。',
    avatar: Icons.sentiment_satisfied,
    likes: 34,
    comments: 8,
  ),
  Moment(
    name: '花花',
    time: '今天 09:30',
    content: '原来 Padding 和 SizedBox 都能做间距~ 布局其实就是一层套一层的盒子。',
    avatar: Icons.pets,
    likes: 56,
    comments: 15,
  ),
];
