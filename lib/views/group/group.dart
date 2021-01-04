import 'package:flutter/material.dart';
import 'package:learnflutter_git/components/star_rating.dart';

class Group extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('小组'),
      ),
      body: Center(
        child: StarRating(
          rating: 9,

        ),
      ),
    );
  }
}
