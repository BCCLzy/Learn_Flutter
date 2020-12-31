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
      debugShowCheckedModeBanner: false,//去掉右上角的debug标志
      title: '豆瓣APP',
      theme: ThemeData(
        primaryColor: Colors.green,//主题主要颜色
        highlightColor: Colors.transparent,//点击时候的颜色
        splashColor: Colors.transparent,//水波纹消失
      ),
      home: MyStackPage(),
    );
  }
}

class MyStackPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyStackPageState();
  }
}
class MyStackPageState extends State<MyStackPage>{
  var _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text('豆瓣APP'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //selectedItemColor: Colors.green,//选中的颜色
        currentIndex: _currentIndex,//点击选中的导航bar
        // selectedFontSize: 12,//选中的字体颜色
        // unselectedFontSize: 10,//为选中的字体颜色
        items:[
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.home),
                Positioned(
                  top:0,
                  right: 0,
                  child: Container(
                    color: Colors.red,
                    width: 15,
                    alignment: Alignment(0,0),
                    child: Text('7',style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('分类'),
          ),
        ],
        onTap: (int index){
          setState(() {//渲染
            _currentIndex=index;
          });
        },
      ),
      body: Text('Hello world'),
    );
  }
}
