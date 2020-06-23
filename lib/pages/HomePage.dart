import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/model/news.dart';
import 'package:flutternews/pages/NewsDetail.dart';

class HomePage extends StatefulWidget{
   _HomeState createState()=>_HomeState();

}

class _HomeState extends State<HomePage>{
  String uri="http://c.m.163.com/nc/article/headline/T1348647853363/0-40.html";
  String uri2="http://c.m.163.com/nc/auto/list/5bmz6aG25bGx/0-20.html" ;
  var newList=new List<News>();
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
     _initHttp();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: (Text("新闻客户端")),

      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.separated(
                itemBuilder: (context,index){
                     return getListItem(index);},
                separatorBuilder: (context, index) => Divider(height: .0),
                itemCount: newList.length)
          )
        ],
      ),
    );
  }
  Widget getListItem(int index){
    News news=newList[index];
      return  ConstrainedBox(
         constraints: BoxConstraints(
           maxHeight: 100,
         ),

         child: GestureDetector(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  child:  Image.network(news.imgsrc,width: 50,),
                ),
                Expanded(

                  child:Stack(
                    children: <Widget>[Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          child: Text(news.title),
                          alignment: Alignment.centerLeft,
                        ),
                        Padding(

                            child: Text(news.digest,maxLines: 2,overflow: TextOverflow.ellipsis,),
                            padding: const EdgeInsets.only(top: 8.0)
                        ),

                      ],
                    ),
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(news.mtime),
                        ),
                        alignment: Alignment.bottomRight,
                      )
                    ],
                  ),

                )
              ],
            ),
           onTap: (){
               Navigator.push(context, MaterialPageRoute(builder:(context){
                     return NewsDetail(url: newList[index].url);
               }));
           },
         )
      );
  }
  _initHttp() async{
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.getUrl(
      Uri.parse(uri2)
    );
    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();
    Map map= json.decode(responseBody);
    var news=new Parent.fromJson(map);
     news.list.forEach((map){
           newList.add(News.fromJson(map));
     });
     setState(() {

     });
  }


}
