import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double rating;// 当前的评分
  final double maxRating;// 最高评分
  final Widget unselectedImage;// 未选中的图片
  final Widget selectedImage;// 选中的图片
  final int count;// 显示个数
  final double size;// 大小
  final Color unselctedColor;// 默认icon时候，未选中图标颜色
  final Color selectedColor;// 默认icon时候，选中图标颜色

  StarRating({
    @required this.rating,
    this.maxRating = 10,
    Widget unselectedImage,
    Widget selectedImage,
    this.count = 5,
    this.size = 30,
    this.unselctedColor = Colors.grey,
    this.selectedColor = Colors.amber,
}): unselectedImage = unselectedImage ?? Icon(Icons.star,size: size,color: unselctedColor,),
    selectedImage = selectedImage ?? Icon(Icons.star,size: size,color: selectedColor,);



  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        getUnselctedStar(),
        getSelectedStar(),
      ],
    );
  }

  //获取未选中的Star
  Widget getUnselctedStar(){
    return Row(
      mainAxisSize: MainAxisSize.min,//居中显示
      children: List.generate(widget.count, (int index){
        return widget.unselectedImage;
      }),
    );
  }

  //获取选中的Star
  Widget getSelectedStar(){
    //1、计算完整的star
    double oneValue = widget.maxRating / widget.count;//计算每一个的值
    int entireCount = (widget.rating/oneValue).floor();//向下转型得到数量


    //2、剩余的一个star显示的比例
    double leftValue = (widget.rating - entireCount * oneValue); //剩下的值
    double ratioLeft = leftValue / oneValue ; //计算占比

    return Row(
      mainAxisSize: MainAxisSize.min,//居中显示
      children: List.generate(entireCount+1, (int index) {
        if(index<entireCount) return widget.selectedImage;
        return ClipRect(
            clipper: MyRectClipper(width: widget.size * ratioLeft),
            child: widget.selectedImage,
        );
      }),
    );
  }
}

//封装剪切
class MyRectClipper extends CustomClipper<Rect>{
  double width;

  MyRectClipper({this.width});
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }
  @override
  bool shouldReclip(MyRectClipper oldClipper) {
    return width !=oldClipper.width;//如果不等于就每次进行剪切，如果相等的话不需要进行剪切
  }
}
