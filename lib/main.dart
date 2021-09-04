import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
            Icon(
              Icons.local_activity,
              size: 128.0,
              color: Colors.black12,
            ),
            Icon(
              Icons.local_hospital_sharp,
              size: 128.0,
              color: Colors.black12,
            ),
            Icon(
              Icons.local_bar_outlined,
              size: 128.0,
              color: Colors.black12,
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // DrawerHeader(
              //   child: Text('heading'.toUpperCase()),
              //   decoration: BoxDecoration(
              //     color: Colors.grey[100],
              //   ),
              // ),
              UserAccountsDrawerHeader(
                accountName: Text(
                  'Zz',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                accountEmail: Text(
                  '2570467322@qq.com',
                  style: TextStyle(
                    color: Colors.grey[100],
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  //用户头像
                  backgroundImage: NetworkImage(
                      'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201704%2F15%2F20170415171444_jhSLU.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1633100864&t=a77dfd3e13b25d973270ef037ec60e1e'),
                ),
                decoration: BoxDecoration(
                  //头部区域背景
                  color: Colors.yellow[400], //背景颜色
                  image: DecorationImage(
                      //背景图片
                      image: NetworkImage(
                          'https://img1.baidu.com/it/u=2233362797,2905857249&fm=26&fmt=auto&gp=0.jpg'),
                      fit: BoxFit.cover, //填充
                      colorFilter: ColorFilter.mode(
                          Colors.red[300]!.withOpacity(0.4),
                          BlendMode.hardLight)),
                ),
              ),
              ListTile(
                title: Text(
                  'Messages',
                  textAlign: TextAlign.right, //文字靠右显示
                ),
                trailing: Icon(
                  //文字右边的图标  左边是leading
                  Icons.message,
                  color: Colors.yellow,
                  size: 22.0,
                ),
                onTap: () => Navigator.pop(context), //点击后关闭
              ),
              ListTile(
                title: Text(
                  'Favorite',
                  textAlign: TextAlign.right, //文字靠右显示
                ),
                trailing: Icon(
                  Icons.message,
                  color: Colors.yellow,
                  size: 22.0,
                ),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text(
                  'Settings',
                  textAlign: TextAlign.right, //文字靠右显示
                ),
                trailing: Icon(
                  Icons.message,
                  color: Colors.yellow,
                  size: 22.0,
                ),
                onTap: () => Navigator.pop(context),
              )
            ],
          ),
        ),
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
