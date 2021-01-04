import 'package:flutter/material.dart';

class TabBarItem extends BottomNavigationBarItem{
  TabBarItem(String iconName,String title):
      super(
        icon: Image.asset("assets/images/tabbar/$iconName.png",width: 30,),
        activeIcon:  Image.asset('assets/images/tabbar/${iconName}_active.png',width: 30,),
        title: Text(title),
      );
}