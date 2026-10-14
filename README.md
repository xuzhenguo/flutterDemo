# flutter_application_1 · Flutter 学习 Demo

一个用来入门 Flutter 的练习项目，从 iOS / Objective-C 开发背景切换过来的视角编写，
源码里带有大量中文注释，并不断用 iOS 概念做类比（UITabBarController、UITableView、
cellForRowAt、push 传参等），方便有原生开发经验的人快速理解 Flutter。

## 功能概览

应用是一个底部三 Tab 的结构（相当于 iOS 的 `UITabBarController`）：

| Tab | 页面 | 说明 |
| --- | --- | --- |
| 首页 | `HomePage` | 三级页面导航：分类列表 → 知识点列表 → 知识点详情 |
| 动态 | `DynamicPage` | 一个仿「朋友圈」的动态列表，用来练习 Row / Column / Expanded / Padding 布局 |
| 个人中心 | `ProfilePage` | 占位页，后续继续填充 |

### 首页的三级跳转

1. **一级 · 分类列表**（`Home/home_page.dart`）— 用 `ListView.separated` 展示所有知识点分类。
2. **二级 · 知识点列表**（`Home/category_page.dart`）— 点分类进入，展示该分类下的知识点，分类数据通过构造函数传入。
3. **三级 · 详情页**（`Home/point_detail_page.dart`）— 点知识点进入，用 `SingleChildScrollView` 展示可滚动的正文。

### 状态管理要点

- `MainTabPage` 用 `StatefulWidget` 保存「当前选中第几个 Tab」，点击时通过 `setState` 刷新。
- 用 `IndexedStack` 承载三个页面，切换 Tab 时页面不销毁、状态（如列表滚动位置）得以保留。

## 目录结构

```
lib/
├── main.dart              # 入口：runApp + MaterialApp 全局配置
├── main_tab_page.dart     # 底部 Tab 容器（UITabBarController）
├── Home/                  # 首页模块（三级页面）
│   ├── home_page.dart
│   ├── category_page.dart
│   ├── point_detail_page.dart
│   └── model/             # 数据模型：knowledge.dart / contact.dart
├── Dynamic/               # 动态模块
│   ├── dynamic_page.dart
│   └── model/moment.dart  # 动态数据模型与示例数据
└── Profile/               # 个人中心模块
    └── profile_page.dart
```

## 运行方式

需要先安装 [Flutter SDK](https://docs.flutter.dev/get-started/install)（本项目 Dart SDK 要求 `^3.13.5`）。

```bash
# 拉取依赖
flutter pub get

# 查看可用设备
flutter devices

# 运行（连接设备 / 模拟器后）
flutter run
```

常用命令：

```bash
flutter analyze      # 静态检查
flutter test         # 运行测试
flutter build apk    # 构建 Android 包
flutter build ios    # 构建 iOS 包（需 macOS + Xcode）
```

## 技术栈

- Flutter / Dart
- Material Design 组件库
- 纯内置示例数据，无网络请求、无第三方状态管理库，专注基础组件与布局练习

## 学习参考

- [Flutter 官方文档](https://docs.flutter.dev/)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)
