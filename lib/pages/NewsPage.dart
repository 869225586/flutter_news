
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/model/news.dart';

import 'package:flutternews/pages/NewsDetail.dart';



class NewsPage extends StatefulWidget {
  @override
  _NewsState createState()=>_NewsState();

}

class _NewsState<NewsPage> extends State{

  String uri2="http://c.m.163.com/nc/auto/list/5bmz6aG25bGx/0-20.html" ;
  var newList=new List<News>();
  var _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Column(
      children: <Widget>[
        getTopWidget(),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context,index){
                  return getListItem(index);},
                separatorBuilder: (context, index) => Divider(height: .0),
                itemCount: newList.length)
        )
      ],
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initHttp();
    _setTimer();
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
//     news.list.forEach((map){
//           newList.add(News.fromJson(map));
//     });
    newList=news.list;
    setState(() {

    });
  }
  PageController  _pageController =new PageController();
  Widget getTopWidget(){
    return Container(
      height: 200,
      child: PageView.builder(itemBuilder: ((context,index){
        if(newList.length==0){
          _initHttp();
          return Text("正在加载");
        }
        return  FadeInImage.assetNetwork(placeholder: "assets/timg.jpeg", image:newList[index].imgsrc,
        );}

      ),itemCount: 5,onPageChanged: (page){
        print(page);
        _currentIndex=page;
      },controller: _pageController,),
    );
  }

  _setTimer() {

    Timer.periodic(Duration(seconds: 4), (_) {
      if(newList.length<0){
        //没有数据不进行轮播
        return;
      }
      int index=(_currentIndex+1)%5;
      print("当前计算${index}");
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 400), curve: Curves.easeOut);
    });
  }
}