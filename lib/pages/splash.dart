import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';

import 'HomePage.dart';

class SplashPage extends StatefulWidget{
 
  

  @override
  _SplashState createState() => _SplashState();

}
class _SplashState extends State<SplashPage>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) {
        return  HomePage();
      }), (route) => false);
    });
    
  }
  @override
  Widget build(BuildContext context) {

    return  Column(
      children: <Widget>[
    Expanded(
    child: Container(
        decoration: BoxDecoration(
          color: Colors.black45
        ),
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child:Image.network(
          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
          width: 100.0,
        )
    ),
    )
      ],
    );
  }
  
}