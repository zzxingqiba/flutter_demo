import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/demo/about_detail.dart';
import 'package:flutter_demo/demo/drawer_demo.dart';
import 'package:flutter_demo/demo/navigator_demo.dart';
import 'package:flutter_demo/demo/sliver_demo.dart';
import 'package:flutter_demo/demo/view_demo.dart';

void main() {
  runApp(MyApp());
  //设置statusBar状态栏为透明 形成沉浸式
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, //主题色
        highlightColor: Color.fromRGBO(255, 255, 255, 0), //点击后的颜色
        splashColor: Color.fromRGBO(255, 255, 255, 0), //水波纹颜色  两值相等则去除水波纹效果
      ),
      routes: {
        '/': (context) => Home(),
        '/about': (context) => PageDemo(title: 'About'), //配置路由
      },
      // home: NavigatorDemo(), //设置跟路由 如果不使用这个 请使用下面配置路由的默认根路由
      initialRoute: '/',
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[200], //界面颜色
        appBar: AppBar(
          title: Text('HHHH'), //appbar的标题(导航头)
          elevation: 0.0, //appbar的下阴影
          //如果写了drawer 需要去掉 它会自带一个图标打开抽屉,但是这里利用builder中的context，
          //相当于key，可以调用身上的方法将抽屉打开
          leading: Builder(
            //leading左边显示区
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'ok', //长按有提示
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: [
            //action左边显示区
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'ok', //长按有提示
              onPressed: () => print('ok'),
            ),
            IconButton(
              icon: Icon(Icons.mail),
              tooltip: 'ok', //长按有提示
              onPressed: () => print('ok'),
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black38, //未选中颜色
            indicatorColor: Colors.black54, //指示器颜色
            indicatorSize: TabBarIndicatorSize.label, //这是其大小
            tabs: [
              Tab(icon: Icon(Icons.local_activity)),
              Tab(icon: Icon(Icons.local_hospital_sharp)),
              Tab(icon: Icon(Icons.local_bar_outlined))
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ViewDemo(),
            SliverDemo(),
            Icon(
              Icons.local_bar_outlined,
              size: 128.0,
              color: Colors.black12,
            )
          ],
        ),
        drawer: DeawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}

class BottomNavigationBarDemo extends StatefulWidget {
  BottomNavigationBarDemo({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarDemoState createState() =>
      _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTapHandler,
      type: BottomNavigationBarType.shifting, //设置下面导航的type
      fixedColor: Colors.deepPurple, //选中颜色
      unselectedItemColor: Colors.black, //未选中颜色
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'A'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'B'),
        BottomNavigationBarItem(icon: Icon(Icons.place), label: 'C'),
        BottomNavigationBarItem(icon: Icon(Icons.one_k), label: 'D'),
      ],
    );
  }

  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
