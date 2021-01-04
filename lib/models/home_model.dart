// class Person {
//   String name;
//   String avatarURL;
//
//   Person.fromMap(Map<String, dynamic> json) {
//     this.name = json["name"];
//     this.avatarURL = json["avatars"]["medium"];
//   }
// }
//
// class Actor extends Person {
//   Actor.fromMap(Map<String, dynamic> json): super.fromMap(json);
// }
//
// class Director extends Person {
//   Director.fromMap(Map<String, dynamic> json): super.fromMap(json);
// }

int counter = 1;//初始排名
class MovieItem {
  int rank;
  String imageURL;
  String title;
  String director;
  String quote;
  String star;

  //封装成模型
  MovieItem.fromMap(Map<String, dynamic> json) {
    this.rank = counter++;//每次电影数量增加一次就增加一次
    this.imageURL = json["img"];
    this.title = json["name"];
    this.director = json["director"];
    this.quote=json['quote'];
    this.star=json['star'];
  }
}
