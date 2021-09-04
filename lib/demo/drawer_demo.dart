import 'package:flutter/material.dart';

class DeawerDemo extends StatelessWidget {
  const DeawerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
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
    );
  }
}
