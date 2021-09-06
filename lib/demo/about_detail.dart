import 'package:flutter/material.dart';

class AboutDetail extends StatelessWidget {
  final String title;
  const AboutDetail({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              // AspectRatio作用于父控件，根据aspectRatio计算父控件的宽或者高，AspectRatio的子控件将填充满父控件，子控件的宽高无效
              aspectRatio: 16 / 9,
              child: Image.network(
                'https://img1.baidu.com/it/u=2233362797,2905857249&fm=26&fmt=auto&gp=0.jpg',
                fit: BoxFit.cover, //填充
              ),
            ),
            Container(
              padding: EdgeInsets.all(32.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    '小林家的龙女仆',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    '龙形态能飞、能喷火会使用魔法，但是平时可以变成外貌大约二十岁的女孩子形态。为了报答其救命恩人小林而自愿来做女仆，并且非常喜欢小林，她几乎没有人类的常识，总是让小林吃她的尾巴，性格开朗活泼，虽然有时候会陷入抑郁但也会用微笑来掩盖；也有一点痴女属性，爱着小林的一切，与小林感情极深，且她们已经无法忍受没有对方的生活，人形态依然可以使用龙的技能，曾言“因为是Dragon，所以胸围是D杯”。看起来一个整天都很开心愉快的龙娘，其实内心十分细腻，偶尔也会小小的忧郁，但见到小林之后就会恢复开朗。',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
