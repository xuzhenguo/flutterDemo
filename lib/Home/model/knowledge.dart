// 知识点数据模型。整个"学习手册"的数据结构分两层:
//   KnowledgeCategory(一级分类) ─ 包含多个 ─> KnowledgePoint(知识点)
// 页面则有三级:分类列表 → 知识点列表 → 知识点详情。

/// 三级详情用到的「知识点」。既是二级列表里的一行，也是三级详情页的内容来源。
class KnowledgePoint {
  final String title; // 知识点标题(二级列表显示 + 三级页标题)
  final String content; // 知识点正文(三级详情页显示)

  const KnowledgePoint({required this.title, required this.content});
}

/// 一级「分类」，比如 UI组件、布局、Dart语法。
class KnowledgeCategory {
  final String title; // 分类标题(一级列表显示)
  final List<KnowledgePoint> points; // 该分类下的所有知识点(二级列表数据源)

  const KnowledgeCategory({required this.title, required this.points});
}

/// 全部数据。const 常量，相当于写死的本地数据源(以后可换成网络请求)。
/// 想加内容，照着格式往这里加分类或知识点即可。
const List<KnowledgeCategory> knowledgeData = [
  // ============ 一级分类 1：UI 组件 ============
  KnowledgeCategory(
    title: 'UI 组件',
    points: [
      KnowledgePoint(
        title: 'Container 容器',
        content: 'Container 是最常用的容器组件，相当于 iOS 的一个 UIView。\n\n'
            '它可以设置宽高、内外边距(padding/margin)、背景色、圆角、边框、阴影等。\n\n'
            '常用写法:\n'
            'Container(\n'
            '  width: 100,\n'
            '  height: 100,\n'
            '  color: Colors.blue,\n'
            '  child: Text("hi"),\n'
            ')',
      ),
      // PLACEHOLDER_UI_POINTS
      KnowledgePoint(
        title: 'Text 文本',
        content: 'Text 用来显示文字，相当于 iOS 的 UILabel。\n\n'
            '通过 style(TextStyle) 设置字号、颜色、粗细等:\n'
            'Text(\n'
            '  "你好",\n'
            '  style: TextStyle(fontSize: 20, color: Colors.red,\n'
            '    fontWeight: FontWeight.bold),\n'
            ')\n\n'
            'maxLines + overflow 可控制超长文字的省略号显示。',
      ),
      KnowledgePoint(
        title: 'Image 图片',
        content: 'Image 用来显示图片，相当于 iOS 的 UIImageView。\n\n'
            '常见几种来源:\n'
            '• Image.asset("images/a.png") —— 项目内置图片\n'
            '• Image.network("https://...") —— 网络图片\n'
            '• Image.file(file) —— 本地文件\n\n'
            'fit 属性控制填充方式(BoxFit.cover/contain 等)，类似 iOS 的 contentMode。',
      ),
      KnowledgePoint(
        title: 'Button 按钮',
        content: '按钮有好几种,对应不同视觉风格:\n\n'
            '• ElevatedButton —— 带阴影的凸起按钮(主操作)\n'
            '• TextButton —— 纯文字按钮(次要操作)\n'
            '• OutlinedButton —— 带边框的按钮\n'
            '• IconButton —— 纯图标按钮,常放在导航栏\n\n'
            '核心参数都是 onPressed(点击回调)和 child(按钮里的内容):\n'
            'ElevatedButton(\n'
            '  onPressed: () { print("点了"); },\n'
            '  child: Text("提交"),\n'
            ')\n\n'
            '把 onPressed 设为 null,按钮会变灰、不可点(disabled 状态)。',
      ),
      KnowledgePoint(
        title: 'Icon 图标',
        content: 'Icon 显示一个矢量图标,相当于 iOS 的 SF Symbols。\n\n'
            'Flutter 内置了成百上千个 Material 图标,通过 Icons.xxx 取用:\n'
            'Icon(Icons.home, size: 24, color: Colors.blue)\n\n'
            '• size 控制大小,color 控制颜色\n'
            '• 很多组件(按钮、导航栏项)都能直接塞一个 Icon 进去',
      ),
      KnowledgePoint(
        title: 'TextField 输入框',
        content: 'TextField 让用户输入文字,相当于 iOS 的 UITextField。\n\n'
            '常用参数:\n'
            '• controller —— 用 TextEditingController 读取/设置输入内容\n'
            '• decoration —— 用 InputDecoration 设置提示文字、边框、图标\n'
            '• onChanged —— 文字每次变化的回调\n'
            '• obscureText: true —— 密码输入(圆点遮挡)\n\n'
            'TextField(\n'
            '  decoration: InputDecoration(hintText: "请输入"),\n'
            '  onChanged: (text) { print(text); },\n'
            ')',
      ),
      KnowledgePoint(
        title: 'Card 卡片',
        content: 'Card 是一个自带圆角和阴影的容器,用来把一组信息"框"成一张卡片。\n\n'
            '常和 Column / ListTile 组合,做列表里的卡片项:\n'
            'Card(\n'
            '  child: ListTile(title: Text("标题")),\n'
            ')\n\n'
            '• elevation 控制阴影深浅\n'
            '• shape 配合 RoundedRectangleBorder 可自定义圆角大小',
      ),
    ],
  ),
  // PLACEHOLDER_CATEGORIES
  // ============ 一级分类 2：布局 ============
  KnowledgeCategory(
    title: '布局',
    points: [
      KnowledgePoint(
        title: 'Row / Column 线性布局',
        content: 'Row(横向排列)和 Column(纵向排列)是最基础的布局组件，\n'
            '相当于 iOS 里横/竖方向的 UIStackView。\n\n'
            '• mainAxisAlignment：主轴(排列方向)上的对齐\n'
            '• crossAxisAlignment：交叉轴(垂直方向)上的对齐\n\n'
            'children 里放一组子组件，它们按方向依次排开。',
      ),
      KnowledgePoint(
        title: 'Stack 层叠布局',
        content: 'Stack 让子组件相互重叠，相当于把多个 view addSubview 叠在一起。\n\n'
            '配合 Positioned 可以精确定位某个子组件的上下左右位置，\n'
            '常用于图片上叠加文字、角标等场景。',
      ),
      KnowledgePoint(
        title: 'Expanded / Flexible 弹性布局',
        content: '在 Row/Column 里用 Expanded 包住子组件，它会按比例占满剩余空间，\n'
            '类似 iOS AutoLayout 里的等比/撑满约束。\n\n'
            '多个 Expanded 用 flex 控制占比(默认都是 1，即均分)。',
      ),
      KnowledgePoint(
        title: 'Padding / 内边距',
        content: 'Padding 给子组件四周留出空白,相当于 iOS 的内容 inset。\n\n'
            'Padding(\n'
            '  padding: EdgeInsets.all(16),       // 四周都 16\n'
            '  child: Text("内容"),\n'
            ')\n\n'
            'EdgeInsets 的几种写法:\n'
            '• all(16) —— 四边相同\n'
            '• symmetric(horizontal: 16, vertical: 8) —— 左右 / 上下\n'
            '• only(left: 10, top: 5) —— 单独指定某几边',
      ),
      KnowledgePoint(
        title: 'SizedBox 固定尺寸 / 间距',
        content: 'SizedBox 是个指定了宽高的空盒子,两个最常见用途:\n\n'
            '1. 当"间距":在两个组件之间塞一段固定空白\n'
            '   SizedBox(height: 12)   // 竖向留 12 的空\n'
            '   SizedBox(width: 8)     // 横向留 8 的空\n\n'
            '2. 给子组件强制一个尺寸\n'
            '   SizedBox(width: 100, height: 40, child: Button(...))\n\n'
            'SizedBox.shrink() 则是尺寸为 0 的隐形盒子,常用来表示"这里什么都不放"。',
      ),
      KnowledgePoint(
        title: 'Center / Align 对齐',
        content: 'Center 让子组件在可用空间里居中,是最常用的对齐方式:\n'
            'Center(child: Text("居中"))\n\n'
            'Align 则能精确指定对齐位置,通过 alignment 参数:\n'
            '• Alignment.topLeft —— 左上\n'
            '• Alignment.bottomRight —— 右下\n'
            '• Alignment.center —— 居中(等价于 Center)',
      ),
      KnowledgePoint(
        title: 'Wrap 自动换行',
        content: 'Wrap 像 Row/Column,但一行(列)排不下时会自动换到下一行,\n'
            '很适合标签云、一堆大小不一的 Chip 这种场景。\n\n'
            'Wrap(\n'
            '  spacing: 8,       // 主轴方向子组件间距\n'
            '  runSpacing: 8,    // 换行后行与行的间距\n'
            '  children: [ Chip(...), Chip(...), ... ],\n'
            ')',
      ),
      KnowledgePoint(
        title: 'ListView / GridView 滚动列表',
        content: 'ListView 是可滚动的线性列表(本 App 用的就是它),\n'
            'GridView 是可滚动的网格(类似 iOS 的 UICollectionView)。\n\n'
            '数据多时一定要用 .builder 构造函数(按需构建,只渲染可见项):\n'
            'ListView.builder(\n'
            '  itemCount: list.length,\n'
            '  itemBuilder: (context, index) => Text(list[index]),\n'
            ')\n\n'
            'ListView.separated 则在每两项之间多加一条分隔线。',
      ),
    ],
  ),
  // ============ 一级分类 3：Dart 语法 ============
  KnowledgeCategory(
    title: 'Dart 语法',
    points: [
      KnowledgePoint(
        title: '变量与类型',
        content: 'Dart 是强类型语言。常用声明方式:\n\n'
            '• var —— 自动推断类型\n'
            '• final —— 运行时赋一次值，不可改(相当于 Swift 的 let)\n'
            '• const —— 编译期常量\n'
            '• 明确类型：int、double、String、bool、List、Map 等\n\n'
            '变量名后加 ? 表示可空(如 String?)，类似 Swift 的可选类型。',
      ),
      KnowledgePoint(
        title: '函数与命名参数',
        content: 'Dart 函数支持命名参数，用 {} 包起来:\n\n'
            'void greet({required String name, int age = 0}) {}\n\n'
            '• required 表示必传\n'
            '• age = 0 表示有默认值\n\n'
            '这就是你在各种 Widget 构造里看到 name: xxx 这种写法的来源。',
      ),
      KnowledgePoint(
        title: '异步 async / await',
        content: 'Dart 用 Future 表示「将来才有结果」的异步操作，\n'
            '类似 JS 的 Promise。\n\n'
            'Future<String> loadData() async {\n'
            '  await Future.delayed(Duration(seconds: 1));\n'
            '  return "完成";\n'
            '}\n\n'
            'async 标记异步函数，await 等待结果，写起来像同步代码。',
      ),
      KnowledgePoint(
        title: '集合 List / Map / Set',
        content: 'Dart 三种常用集合:\n\n'
            '• List —— 有序数组:[1, 2, 3],用 list[0] 取值\n'
            '• Map —— 键值对:{"name": "张三", "age": 18},用 map["name"] 取值\n'
            '• Set —— 不重复的集合:{1, 2, 3}\n\n'
            '常用操作:\n'
            'list.add(4);          // 加元素\n'
            'list.length;          // 个数\n'
            'list.map((e) => e*2); // 遍历变换\n'
            'list.where((e) => e>1); // 过滤',
      ),
      KnowledgePoint(
        title: '空安全 null safety',
        content: 'Dart 默认变量不能为 null,从源头避免空指针崩溃。\n\n'
            '• String s —— 不可为空,必须有值\n'
            '• String? s —— 可空,可能是 null\n\n'
            '处理可空值的几个符号:\n'
            '• s?.length —— s 为 null 时整体返回 null,不崩(可选链)\n'
            '• s ?? "默认" —— s 为 null 就用默认值\n'
            '• s! —— 断言"我保证它不是 null"(用错会崩,慎用)',
      ),
      KnowledgePoint(
        title: '类与构造函数',
        content: 'Dart 用 class 定义类,本项目的 Contact、KnowledgePoint 都是例子。\n\n'
            'class Person {\n'
            '  final String name;\n'
            '  Person({required this.name});  // 命名参数构造\n'
            '}\n\n'
            '• extends 继承父类(如所有页面 extends StatelessWidget)\n'
            '• @override 表示重写父类方法(如 build 方法)\n'
            '• this.name 在构造里是"把传入值直接赋给成员变量"的简写',
      ),
      KnowledgePoint(
        title: '级联操作符 ..',
        content: '.. 让你对同一个对象连续调用多个方法/赋值,不用重复写对象名。\n\n'
            '普通写法:\n'
            'var p = Paint();\n'
            'p.color = Colors.red;\n'
            'p.strokeWidth = 2;\n\n'
            '级联写法(等价):\n'
            'var p = Paint()\n'
            '  ..color = Colors.red\n'
            '  ..strokeWidth = 2;',
      ),
      KnowledgePoint(
        title: '条件渲染与循环',
        content: '在 build 里拼 Widget 时常用这几招:\n\n'
            '• 三元表达式:isVip ? Text("会员") : Text("普通")\n'
            '• 集合 if:children 列表里写 if (cond) Widget() 决定是否放\n'
            '• 集合 for:[for (var e in list) Text(e)] 批量生成一组组件\n\n'
            '例:\n'
            'Column(children: [\n'
            '  if (isLogin) Text("已登录"),\n'
            '  for (var name in names) Text(name),\n'
            '])',
      ),
    ],
  ),
  // ============ 一级分类 4：交互与导航 ============
  KnowledgeCategory(
    title: '交互与导航',
    points: [
      KnowledgePoint(
        title: '页面跳转 Navigator.push',
        content: 'Flutter 用"栈"管理页面。push 把新页面压到栈顶(跳过去),\n'
            'pop 出栈(返回上一页),就是本 App 点列表进详情用的方式。\n\n'
            'Navigator.push(\n'
            '  context,\n'
            '  MaterialPageRoute(builder: (context) => 详情页()),\n'
            ');\n\n'
            'MaterialPageRoute 自带平台默认转场动画,并自动在新页面左上角生成返回按钮。',
      ),
      KnowledgePoint(
        title: '返回与回传数据',
        content: 'Navigator.pop(context) 返回上一页。\n'
            '还能带一个结果回去:pop(context, "选中的值")。\n\n'
            '上一页用 await 接收这个结果:\n'
            'final result = await Navigator.push(context, ...);\n'
            'print(result); // 拿到下一页 pop 回来的值\n\n'
            '适合"进二级页选一个东西,选完带回来"的场景。',
      ),
      KnowledgePoint(
        title: '弹窗 showDialog',
        content: 'showDialog 弹出一个模态对话框(相当于 iOS 的 UIAlertController)。\n\n'
            'showDialog(\n'
            '  context: context,\n'
            '  builder: (context) => AlertDialog(\n'
            '    title: Text("提示"),\n'
            '    content: Text("确定删除吗?"),\n'
            '    actions: [\n'
            '      TextButton(onPressed: () => Navigator.pop(context),\n'
            '        child: Text("取消")),\n'
            '    ],\n'
            '  ),\n'
            ');',
      ),
      KnowledgePoint(
        title: '轻提示 SnackBar',
        content: 'SnackBar 是底部弹出的短暂提示条(类似安卓 Toast)。\n\n'
            'ScaffoldMessenger.of(context).showSnackBar(\n'
            '  SnackBar(content: Text("已保存")),\n'
            ');\n\n'
            '它会自己弹出几秒后消失,适合"操作成功/失败"这种一次性反馈。',
      ),
    ],
  ),
  // ============ 一级分类 5：状态与生命周期 ============
  KnowledgeCategory(
    title: '状态与生命周期',
    points: [
      KnowledgePoint(
        title: '两种 Widget:无状态 vs 有状态',
        content: 'Flutter 组件分两类:\n\n'
            '• StatelessWidget —— 无状态,内容一次画好就不变\n'
            '  (本 App 的首页、详情页都是,因为数据固定)\n'
            '• StatefulWidget —— 有状态,内容会随数据变化而刷新\n'
            '  (本 App 的底部 Tab 容器就是,因为选中项会变)\n\n'
            '判断口诀:界面会不会"动"?会动就用 Stateful,不会就用 Stateless。',
      ),
      KnowledgePoint(
        title: 'setState 刷新界面',
        content: 'StatefulWidget 里改数据,必须包在 setState 里,界面才会刷新:\n\n'
            'setState(() {\n'
            '  _count++;   // 改变量\n'
            '});           // 括号结束 → 框架重新执行 build,界面更新\n\n'
            '直接写 _count++ 而不包 setState,数据虽然变了,但界面不会重画。\n'
            '这是 Flutter"状态驱动 UI"的核心规则。',
      ),
      KnowledgePoint(
        title: '生命周期 initState / dispose',
        content: 'StatefulWidget 的 State 有几个关键生命周期方法:\n\n'
            '• initState() —— 页面创建时调一次,适合做初始化\n'
            '  (如创建 controller、发起首次网络请求)\n'
            '• build() —— 每次需要重画界面时调用\n'
            '• dispose() —— 页面销毁时调一次,适合释放资源\n'
            '  (如 controller.dispose(),防止内存泄漏)\n\n'
            '类似 iOS 的 viewDidLoad / viewWillDisappear。',
      ),
      KnowledgePoint(
        title: 'BuildContext 是什么',
        content: 'build(BuildContext context) 里那个 context,\n'
            '代表"当前 Widget 在整棵界面树里的位置"。\n\n'
            '很多操作都要靠它顺着树往上找东西:\n'
            '• Theme.of(context) —— 找最近的主题配置\n'
            '• Navigator.of(context) —— 找最近的导航器来跳页\n'
            '• MediaQuery.of(context) —— 拿屏幕尺寸等信息\n\n'
            '简单理解:context 是"我在哪",框架靠它定位和找资源。',
      ),
    ],
  ),
];
