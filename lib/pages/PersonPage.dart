import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/widght/personitem.dart';
import 'package:flutternews/route/EventBus.dart';
class PersonPage extends StatefulWidget {
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState<PersonPage> extends State {
  var personItem = new personitem();
  var text = "姓名: 茨木童子";
  @override
  void initState() {
    // TODO: implement initState
    bus.on("event", (arg) {
      setState(() {
        text=arg;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Center(
            child: new ClipOval(
                child: Image.network(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                    width: 64.0,
                    height: 64.0))),
        Flexible(
            child: ListView.builder(
                itemCount: 3,
                itemExtent: 50, //强制条目高度
                itemBuilder: (BuildContext context, int index) {
                  switch (index) {
                    case 0:
                      return personItem.getPersonItem(text);
                      break;
                    case 1:
                      return personItem.getPersonItem(
                        "技能：一拳超人 地狱右手",
                      );
                      break;
                    case 2:
                      return personItem.getPersonItem("好基友：鬼吞童子");
                      break;
                  }
                }))
      ],
    );
  }
}
