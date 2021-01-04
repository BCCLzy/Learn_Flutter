import 'package:flutter/material.dart';

class Subject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('书影集'),
      ),
      body: Center(
        child: Text('书影集',style: TextStyle(fontSize: 50),),
      ),
    );
  }
}