/*
 * @Descripttion: 
 * @version: 
 * @Author: ZiYue.Liu
 * @Date: 2020-12-31 10:42:25
 * @LastEditors: ZiYue.Liu
 * @LastEditTime: 2020-12-31 10:52:49
 */
import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('HelloWorld'),
        ),
        body: ContentWidget(),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: LoginWidget(),
    );
  }
}


class LoginWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginWigetState();
  }
}
//child：单个  childen: 多个
class LoginWigetState extends State<LoginWidget>{
  String username;
  String password;
  GlobalKey<FormState> formGlobalKey = GlobalKey();
    @override
  Widget build(BuildContext context) {
    return Form(
      key: formGlobalKey,
      child: Column(
        children: [
          TextFormField(
            autovalidate: true,//自动检测是否符合
            decoration: InputDecoration(
              icon: Icon(Icons.people),
              labelText: '用户名',
            ),
            onSaved: (value){
              print('执行了username的onSaved');
              this.username=value;
            },
            validator: (value){
              if(value == null || value.length==0){
                return '用户名不能为空';
              }
              return null;
            },
          ),
          TextFormField(
            autovalidate: true,//自动检测是否符合
            obscureText: true,//暗文显示
            decoration: InputDecoration(
              icon:Icon(Icons.lock),
              labelText: '密码',
            ),
            onSaved: (value){
              print('执行了password的onSaved');
              this.password=value;
            },
            validator: (value){
              if(value == null || value.length==0){
                return '密码不能为空';
              }
              return null;
            },
          ),
          SizedBox(height: 12,),//间距
          Container(
            width: double.infinity,//自适应
            height: 44,
            child: RaisedButton(
              child: Text('登录',style: TextStyle(fontSize: 20,color:Colors.white)),//文本
              color: Colors.blue,
              onPressed: (){
                print('登录按钮被点击');
                formGlobalKey.currentState.save();//调用保存
                formGlobalKey.currentState.validate();//调用验证器
                print('username:$username password:$password');
              },
            ),
          ),
        ],
      ),
    );
  }
}



class RegisterWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RegisterWigetState();
  }
}

class RegisterWigetState extends State<RegisterWidget>{
  final textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.text='我是默认值';//TextField默认内容
    textEditingController.addListener(() {
        print('监听到值的改变:${textEditingController.text}');//获取焦点即开始打印
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.people),
              labelText: 'username', //label
              hintText: '请输入用户名', //默认文本输入后就会消失
              border: OutlineInputBorder(
                  //外部边框
                  borderSide: BorderSide(width: 3) //边框宽度
                  ),
              // filled: true,//开启背景颜色
              // fillColor: Colors.red,//背景颜色
            ),
            onChanged: (value) {
              //内容改变回调函数
              print('当前的值:$value');
            },
            onSubmitted: (value) {
              //提交回调函数
              print('当前提交的值：$value');
            },
            controller: textEditingController, //总监听函数
          )
        ],
      ),
    );
  }
}
