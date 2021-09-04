import 'package:flutter/material.dart';

class ViewDemo extends StatelessWidget {
  const ViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

//纯PageView
class PageViewDemo extends StatelessWidget {
  const PageViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        //pageSnapping: false, //默认是开启回弹，没翻过去页，自动翻页，设置为fasle不自动翻页
        //reverse: true, //顺序倒置
        //scrollDirection: Axis.vertical, //翻页方向 （垂直滚动） 默认为水平
        onPageChanged: (currentPage) =>
            print(currentPage), //翻页改变的change事件，返回参数为当前页面索引值
        controller: PageController(
          initialPage: 1, //控制第一个显示界面
          keepPage: false, //默认会记住翻到哪一页 如果不想记住设置为false
          viewportFraction: 0.9, //可视口占用比例 默认1.0
        ),
        children: [
          Container(
            color: Colors.brown[900],
            alignment: Alignment(0.0, 0.0),
            child: Text(
              'ONE',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          Container(
            color: Colors.grey[900],
            alignment: Alignment(0.0, 0.0),
            child: Text(
              'Two',
              style: TextStyle(fontSize: 32.0, color: Colors.green),
            ),
          ),
          Container(
            color: Colors.blue[900],
            alignment: Alignment(0.0, 0.0),
            child: Text(
              'Three',
              style: TextStyle(fontSize: 32.0, color: Colors.yellow),
            ),
          ),
        ],
      ),
    );
  }
}

//PageView builder
class PageViewBuilderDemo extends StatelessWidget {
  const PageViewBuilderDemo({Key? key}) : super(key: key);

  Widget _pageViewBuilder(BuildContext context, int index) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201704%2F15%2F20170415171444_jhSLU.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1633100864&t=a77dfd3e13b25d973270ef037ec60e1e',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '索尔',
                style: TextStyle(
                  color: Colors.purple[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Text(
                'yydsyydsyyds',
                style: TextStyle(
                  color: Colors.purple[200],
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        itemCount: 2,
        itemBuilder: _pageViewBuilder,
      ),
    );
  }
}

//GridView.count网格视图  限制拜访child数量
class GridViewCountDemo extends StatelessWidget {
  const GridViewCountDemo({Key? key}) : super(key: key);

  List<Widget> _buildTitles(int count) {
    return List.generate(
      count,
      (index) => Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          '索尔$index',
          style: TextStyle(
            color: Colors.purple[300],
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3, //交叉轴显示数量
        crossAxisSpacing: 16.0, //交叉轴间隔
        mainAxisSpacing: 16.0, //主轴间隔
        scrollDirection: Axis.horizontal, // 滚动方向 水平滚动
        children: _buildTitles(100),
      ),
    );
  }
}

//GridView.extent网格视图  限制每个child的高度
class GridViewExtentDemo extends StatelessWidget {
  const GridViewExtentDemo({Key? key}) : super(key: key);

  List<Widget> _buildTitles(int count) {
    return List.generate(
      count,
      (index) => Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          '索尔$index',
          style: TextStyle(
            color: Colors.purple[300],
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.extent(
        maxCrossAxisExtent:
            150.0, //在主轴方向最大的高度 区分于count的  这里是限制内部每个child在主轴方向排列的高度
        crossAxisSpacing: 16.0, //交叉轴间隔
        mainAxisSpacing: 16.0, //主轴间隔
        scrollDirection: Axis.horizontal, // 滚动方向 水平滚动
        children: _buildTitles(100),
      ),
    );
  }
}

//GridView.builder网格视图  按需生成
class GridViewBuilderDemo extends StatelessWidget {
  const GridViewBuilderDemo({Key? key}) : super(key: key);

  Widget _gridItemBuilder(BuildContext context, int index) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201704%2F15%2F20170415171444_jhSLU.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1633100864&t=a77dfd3e13b25d973270ef037ec60e1e',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '索尔',
                style: TextStyle(
                  color: Colors.purple[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Text(
                'yydsyydsyyds',
                style: TextStyle(
                  color: Colors.purple[200],
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // scrollDirection: Axis.horizontal, //排列方式 ，默认水平
      //SliverGridDelegateWithFixedCrossAxisCount
      // SliverGridDelegateWithMaxCrossAxisExtent
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //交叉轴数量 // SliverGridDelegateWithFixedCrossAxisCount
        //maxCrossAxisExtent:
        //120.0, //主轴方向限制每个child的高度SliverGridDelegateWithMaxCrossAxisExtent
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ), //控制项目视图的显示
      itemCount: 4,
      itemBuilder: _gridItemBuilder,
    );
  }
}
