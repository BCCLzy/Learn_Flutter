import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learnflutter_git/models/home_model.dart';
import 'package:learnflutter_git/network/http_request.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  List<MovieItem> movieItems =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    HttpRequest.request('http://39.105.38.10:8081/top250').then((res){
      final subjects =json.decode(res.data);//json转map

      final subject = subjects['data']['subject'];
      // print(subject);
      // print(subject.runtimeType);//List<dynamic>

      List<MovieItem> movies = [];
      for(var sub in subject){
        movies.add(MovieItem.fromMap(sub));
      }
      //print(movies);
      setState(() {
        this.movieItems=movies;
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: movieItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.network(movieItems[index].imageURL),
              title: Text(movieItems[index].title),
            );
          }),
    );
  }
}
