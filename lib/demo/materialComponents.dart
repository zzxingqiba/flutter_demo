import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';

class MaterialComponents extends StatelessWidget {
  const MaterialComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          ListItem(
            title: 'FloatingActionButtonDemo',
            page: FloatingActionButtonDemo(),
          )
        ],
      ),
    );
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  const FloatingActionButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //普通按钮
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      elevation: 0.0,
      backgroundColor: Colors.black,

      // shape: BeveledRectangleBorder(
      //   borderRadius: BorderRadius.circular(30.0),
      // ), //10楔形，30菱形
    );

    //漂浮动作按钮
    final Widget _floatingActionButtonExtened = FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text('哈哈'),
      elevation: 0.0,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, //floatbutton的位置
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 80.0,
          // child: BottomNavigationBarDemo(),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key, this.title = '', required this.page})
      : super(key: key);

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
