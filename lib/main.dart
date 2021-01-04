/*
 * @Descripttion: 
 * @version: 
 * @Author: ZiYue.Liu
 * @Date: 2020-12-31 10:42:25
 * @LastEditors: ZiYue.Liu
 * @LastEditTime: 2020-12-31 10:52:49
 */
import 'package:flutter/material.dart';
import 'package:learnflutter_git/components/tabbar_item.dart';
import 'package:learnflutter_git/views/group/group.dart';
import 'package:learnflutter_git/views/home/home.dart';
import 'package:learnflutter_git/views/mall/mall.dart';
import 'package:learnflutter_git/views/profile/profile.dart';
import 'package:learnflutter_git/views/subject/subject.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

    Map<String,String> items ={
     "icon":"home","title":"首页",
      "icon":"home","title":"首页",
      "icon":"group","title":"小组",
      "icon":"mall","title":"市集",
      "icon":"profile","title":"我的",
    };


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //selectedItemColor: Colors.green,//选中的颜色
        currentIndex: _currentIndex,//点击选中的导航bar
        // selectedFontSize: 12,//选中的字体颜色
        unselectedFontSize: 14,//为选中的字体颜色
        type: BottomNavigationBarType.fixed,//固定底部导航栏，否则超过四个不显示文字
        items:[

          TabBarItem('home', '首页'),
          TabBarItem('subject', '书影集'),
          TabBarItem('group', '小组'),
          TabBarItem('mall', '市集'),
          TabBarItem('profile', '我的'),
        ],
        onTap: (int index){
          setState(() {//渲染
            _currentIndex=index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Home(),
          Subject(),
          Group(),
          Mall(),
          Profile(),
        ],
      ),
    );
  }
}



