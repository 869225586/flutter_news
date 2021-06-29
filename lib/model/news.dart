import 'dart:convert';
class News{

  final String title;
  final String mtime;
  final String digest;
  final String imgsrc;
  final String url;

  News(this.title, this.mtime, this.digest, this.imgsrc, this.url);//构造函数

  News.fromJson(Map<String,dynamic> json):
      title=json['title'],
      mtime=json['mtime'],
      digest=json['digest'],
      imgsrc=json['imgsrc'],
      url=json['url'];
// json 解析 取值

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
  final List<News> list;

  Parent(this.city, this.list);
  factory Parent.fromJson(Map<String,dynamic> json){

      List<dynamic> list=json['list']; //map 取值 拿到json 字符串 转化为list 集合
      //调用list.map 遍历集合 。然后调用 News.fromJson  取值构造出News 。 再通过toList 变成集合 返回
      List<News> newList=list.map((value)=>News.fromJson(value)).toList();
       return Parent(json['title'],newList);
  }
}

