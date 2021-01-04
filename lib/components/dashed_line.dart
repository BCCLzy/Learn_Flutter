import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  DashedLine({
    this.axis,
    this.dashedWidth = 1,
    this.dashedHeight = 1,
    this.count = 10,
    this.color =const Color(0xff888888),//常量构造函数
});


  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween, //平均分布
      children: List.generate(count, (index) {
        return Container(
          width: dashedWidth,
          height: dashedHeight,
          color: color,
        );
      }),
    );
  }
}
