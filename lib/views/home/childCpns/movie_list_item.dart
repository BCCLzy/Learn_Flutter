import 'package:flutter/material.dart';
import 'package:learnflutter_git/components/dashed_line.dart';
import 'package:learnflutter_git/components/star_rating.dart';
import 'package:learnflutter_git/models/home_model.dart';

class MovieListItem extends StatelessWidget {

  final MovieItem item; //StatelessWidget必须用final

  MovieListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),//内边距
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 10,color: Color(0xffe2e2e2))//16进制 底部粗线框
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,//水平方向靠左显示
        children: [
          getRankWidget(),//获取排名
          SizedBox(height: 12,),//行内元素间距
          getMovieContent(),//获取中间内容
          SizedBox(height: 12,),
          getQuoteWidget(),//获取描述
        ],
      ),
    );
  }

  //封装方法
  //1、获取排名显示的widget
  Widget getRankWidget(){
    return Container(
      //padding: EdgeInsets.fromLTRB(9, 4, 9, 4),//左上右下间距
      padding: EdgeInsets.symmetric(vertical: 4,horizontal: 9),//作用同上
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3),//圆角效果
      ),

      child: Text(
          "No.${item.rank}",
          style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 131, 95, 36)),//字体样式
      ),
    );
  }

  //2、获取中间内容的显示
  Widget getMovieContent(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getMovieImage(),
        getDetailDescWidget(),
        getDashedWidget(),
        getWishWidget(),
      ],
    );
  }

  //2.1、获取显示的图片
  Widget getMovieImage(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),//圆角图片
      child: Image.network(item.imageURL,height: 150,),
    );
  }

  //2.2、获取详情描述的Widget
  Widget getDetailDescWidget(){
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getMovieNameWidget(),
            getRatingWidget(),
            getIntroduceWidget(),
          ],
        ),
      ),
    );
  }
  //2.2.1、 获取电影名称
  Widget getMovieNameWidget(){
    return Container(
      child: Stack(
        children: [
          Icon(
            Icons.play_circle_outline,
            color: Colors.red,
            size: 25,
          ),
          Text.rich(
            //连接Text
            TextSpan(children: [
                TextSpan(text:"      "+item.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                TextSpan(text: '(1994)',style: TextStyle(fontSize: 18,color: Colors.black54)),
              ]
            ),
          ),
        ],
      ),
    );
  }
  //2.2.2、获取电影评分的Widget
  Widget getRatingWidget(){
    return Row(
      children: [
        StarRating(rating: double.parse(item.star),size: 20,),
        Text(item.star),
      ],
    );
  }
  //2.2.3、获取电影的简介
  Widget getIntroduceWidget(){
    return Text(
      item.director,
      maxLines: 2,//最多显示2行
      overflow: TextOverflow.ellipsis,//超出以...显示
      style: TextStyle(fontSize: 16),//字体大小
    );
  }
  //2.3、获取分割线的Widget
  Widget getDashedWidget(){
    return Container(
      height: 100,
      width: 1,
      child: DashedLine(
        axis: Axis.vertical,
        dashedHeight: 5,
        count: 12,
        color: Color(0xffaaaaaa),
      ),
    );
  }
  //2.4、获取想看的widget
  Widget getWishWidget(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25,horizontal: 10),//内边距
      child: Column(
        children: [
          Image.asset('assets/images/home/wish.png',width: 30,),
          SizedBox(height: 5,),//间隔高度
          Text(
              '想看',
              style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 235, 170, 60)),//字体颜色
          ),
        ],
      ),
    );
  }

  //3、获取电影描述
  Widget getQuoteWidget(){
    return Container(
      width: double.infinity,//自适应宽度
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),//边框颜色
        borderRadius: BorderRadius.circular(5),//圆角边框
      ),
      child: Text(
          item.quote, //文本来源
          style: TextStyle(fontSize: 18,color: Colors.black54),//文本样式
      ),
    );
  }
}
