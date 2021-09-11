import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  const FormDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Theme(
      //   data: ThemeData(primaryColor: Colors.black),
      //   child: ThemeDemo(),
      // ),
      // copyWith保留Theme设置的主题其他样式
      body: Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.green),
        child: ThemeDemo(),
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  const ThemeDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //Theme.of(context) 找最近的主题  外部包含了Theme 就会去找最近设置的颜色
      color: Theme.of(context).primaryColor,
    );
  }
}
