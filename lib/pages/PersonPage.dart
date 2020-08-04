import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget{
  @override
  _PersonState createState()=>_PersonState();

}

class _PersonState<PersonPage> extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        children: <Widget>[
          Center(

            child: Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 64.0,
              height: 64.0),
          ),

          Flexible(
              child:ListView.builder(
             itemCount: 3,
             itemExtent: 50,//强制条目高度
            itemBuilder:(BuildContext context, int index) {
               switch(index){
                 case 0:
                   return Text("姓名：茨木童子",style:TextStyle(color:Colors.orange),
                   textAlign: TextAlign.left,);
                   break;
                 case 1:
                   return Text("技能：一拳超人 地狱右手",style:TextStyle(color:Colors.orange),
                     textAlign: TextAlign.left,);
                   break;
                 case 2:
                   return Text("好基友：鬼吞童子",style:TextStyle(color:Colors.orange),
                     textAlign: TextAlign.left,);;
                   break;
               }

              }
          ))
        ],
    );
  }

}