import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawPage {
  static Widget getDraw() {
    return new ListView(
      children: <Widget>[
        _drawerHeader(),
        new ClipRect(
          child: new ListTile(
            leading: new CircleAvatar(child: new Text("A")),
            title: new Text('Drawer item A'),
            onTap: () => {},
          ),
        ),
        new ClipRect(
          child: new ListTile(
            leading: new CircleAvatar(child: new Text("A")),
            title: new Text('Drawer item A'),
            onTap: () => {},
          ),
        ),
        new AboutListTile(
          icon: new CircleAvatar(child: new Text("Ab")),
          child: new Text("About"),
          applicationName: "News",
          applicationVersion: "1.0",
          applicationIcon: new Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            width: 64.0,
            height: 64.0,
          ),
          applicationLegalese: "good study",
          aboutBoxChildren: <Widget>[new Text("item1"), new Text("item2")],
        ),
      ],
    );
  }

  static Widget _drawerHeader() {
    return new UserAccountsDrawerHeader(
//      margin: EdgeInsets.zero,
      accountName: new Text(
        "SuperSun",
        style: TextStyle(fontSize: 20),
      ),
      accountEmail: new Text(
        "869225586@qq.com",
        style: TextStyle(fontSize: 15),
      ),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: new AssetImage("assets/timg.jpeg"),
      ),
      onDetailsPressed: () {},
      otherAccountsPictures: <Widget>[
        new CircleAvatar(
          backgroundImage: new AssetImage("assets/timg.jpeg"),
        ),
      ],
    );
  }
}
