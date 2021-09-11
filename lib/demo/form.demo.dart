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
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [TextFieldDemo()],
          ),
        ),
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  TextFieldDemo({Key? key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // textEditingController.text = 'hi';//设置输入框初始值
    textEditingController.addListener(() {
      //监听输入框方法
      print(textEditingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: textEditingController,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            //每次输入触发 相当于input
            onChanged: (value) {
              print(value);
            },
            //点击键盘确认触发，
            onSubmitted: (value) {
              print(value);
            },
            decoration: InputDecoration(
              icon: Icon(Icons.subject), //输入框左侧图标
              labelText: 'Title',
              hintText: 'Enter the title', // 相当于placeholder
              // border: InputBorder.none, // 消除文本框
              border: OutlineInputBorder(), //四周border labelText标题插入在上边框中
              filled: true, //输入框有一个灰色背景
              fillColor: Colors.green, //设置输入框颜色
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RegisterForm(),
        ],
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  late String userName, password;

  String? validateUserName(value) {
    if (value.isEmpty) {
      return 'UserNmae is required';
    } else {
      return null;
    }
  }

  String? validatePassWord(value) {
    if (value.isEmpty) {
      return 'UserNmae is required';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'UserName',
              helperText: '',
            ),
            onSaved: (value) {
              userName = value!;
            },
            validator: validateUserName,
            autovalidateMode:
                // onUserInteraction用户输入以后开始校验
                AutovalidateMode.always, //控制触发时机 是个枚举类 可以点进去看
          ),
          TextFormField(
            obscureText: true, //密码样式的hint
            decoration: InputDecoration(
              labelText: 'PassWord',
              helperText: '2223333', //提示 在输入框的下面
            ),
            onSaved: (value) {
              password = value!;
            },
            validator: validatePassWord,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blue), //设置背景颜色
              ),
              child: Text(
                '登录',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                bool? isSuccess = registerFormKey.currentState?.validate();
                if (isSuccess == null || !isSuccess) {
                  return null;
                }
                //调用key找到form上的currentState的onSaved方法，触发调用
                registerFormKey.currentState?.save();
                //底部弹框
                Scaffold.of(context).showBottomSheet(
                  (context) => BottomSheet(
                    onClosing: () {
                      Navigator.pop(context);
                    },
                    builder: (BuildContext context) {
                      return Container(
                        width: double.infinity,
                        color: Theme.of(context).primaryColor,
                        child: new Text('$userName$password'),
                      );
                    },
                  ),
                );
                print('$userName');
                print('$password');
              },
            ),
          )
        ],
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
