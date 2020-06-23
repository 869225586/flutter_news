import 'dart:convert';
class News{

  final String title;
  final String mtime;
  final String digest;
  final String imgsrc;
  final String url;

  News(this.title, this.mtime, this.digest, this.imgsrc, this.url);

  News.fromJson(Map<String,dynamic> json):
      title=json['title'],
      mtime=json['mtime'],
      digest=json['digest'],
      imgsrc=json['imgsrc'],
      url=json['url'];
  List<News> newList;
  Map<String,dynamic> map;
  List<News> from(List<dynamic> jsonList ){
    jsonList.forEach((map){
       newList.add(News.fromJson(map));

    });
    return newList;
  }

}

class Parent{
  final String city;
  final List<dynamic> list;

  Parent(this.city, this.list);
  Parent.fromJson(Map<String,dynamic> json):
        city=json['city'],
        list=json['list'];

}