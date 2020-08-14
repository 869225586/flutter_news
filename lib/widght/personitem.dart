import 'package:flutter/material.dart';

class personitem{

  Widget getPersonItem(String name){
    return Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
         name,
          style: TextStyle(color: Colors.orange),
          textAlign: TextAlign.left,
        ));
  }
}