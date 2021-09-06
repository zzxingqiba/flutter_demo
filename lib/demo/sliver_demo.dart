import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/about_detail.dart';

class SliverDemo extends StatelessWidget {
  const SliverDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: Text('哈哈哈'), //与下面的title留一个就好
            // pinned: true, //是否固定住bar
            // floating: true, //往下滑消失 向上稍微滑动一点 立即出现bar
            expandedHeight: 178.0, //伸展空间
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true, //标题居中
              // titlePadding: EdgeInsets.all(0.0), //默认有padding 需要自己调整下
              title: Text(
                '哇哈哈哈哈',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  // letterSpacing: 3.0,
                ),
              ),
              background: Image.network(
                'https://img0.baidu.com/it/u=728913830,1403643466&fm=26&fmt=auto&gp=0.jpg',
                fit: BoxFit.cover, //填充
              ),
            ),
          ),
          SliverSafeArea(
            //刘海屏  SliverSafeArea显示在安全区域
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver:
                  SliverListDemo(), //SliverGrid没有padding属性 ，所以要嵌套一层SliverPadding
            ),
          ),
        ],
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  const SliverGridDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            color: Colors.brown[900],
            alignment: Alignment(0.0, 0.0),
            child: Text(
              '$index',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          );
        },
        childCount: 5,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  const SliverListDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: 32.0,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 14.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Container(
                      child: AspectRatio(
                        // AspectRatio作用于父控件，根据aspectRatio计算父控件的宽或者高，AspectRatio的子控件将填充满父控件，子控件的宽高无效
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          'https://img1.baidu.com/it/u=2233362797,2905857249&fm=26&fmt=auto&gp=0.jpg',
                          fit: BoxFit.cover, //填充
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          //溅墨效果区域  InkWell用户点击出现水波纹效果
                          splashColor: Colors.white.withOpacity(0.3), //溅墨颜色
                          highlightColor: Colors.white.withOpacity(0.1), //高亮颜色
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AboutDetail(title: '索尔$index'),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: 5,
      ),
    );
  }
}
