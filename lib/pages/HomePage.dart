import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/pages/DrawPage.dart';
import 'package:flutternews/pages/NewsPage.dart';
import 'package:flutternews/pages/PersonPage.dart';

class HomePage extends StatefulWidget{
   _HomeState createState()=>_HomeState();

}

class _HomeState extends State<HomePage>{

  var _currentIndex=0;
  var widgetList;
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    widgetList=[new NewsPage(),new PersonPage()];
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: (Text("新闻客户端")),
      ),
      body:_getCurrentBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:Icon(Icons.book),title:Text("新闻")),
          BottomNavigationBarItem(icon:Icon(Icons.person),title:Text("个人中心")),
        ],
        onTap: (index){
          //onTap 底部导航的点击事件回调
           setState(() {
             _currentIndex=index;
           });
        },
        currentIndex: _currentIndex, //当前选中的索引
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
      drawer: new Drawer(
        child: DrawPage.getDraw(),
      ),
    );
  }

  Widget  _getCurrentBody() {
    return  widgetList[_currentIndex]; //获取当前索引对应的page
  }

}
