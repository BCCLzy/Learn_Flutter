import 'package:flutter/material.dart';
import 'package:learnflutter_git/components/dashed_line.dart';

class Subject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('书影集'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: DashedLine(
            axis: Axis.horizontal,
            dashedHeight: 1,
            dashedWidth: 8,
            count: 12,
          ),
        ),
      ),
    );
  }
}