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
        body: Text('HelloWorld'),
      ),
    );
  }
}
