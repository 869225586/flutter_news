/**
 * 命名路由方式 统一管理页面
 * //可以在onGenerateRoute 方法做跳转钱的 逻辑判断处理等
 * //也可以封装几个通用 widght 比如网络 请求 出错等  供外部统一使用
 * **/

import 'package:flutter/material.dart';
import '../pages/HomePage.dart';
import '../pages/NewsPage.dart';
import '../pages/NewsDetail.dart';
import '../pages/splash.dart';
final homePath="/homePage";
final newDetailPath="/newDetail";
final newPath="/newHome";
/** 创建一个路由集合  arguments 千万不能写错否则会报错 **/
final Map<String,Function> routes={
'/':(content,{arguments})=>SplashPage(),
  newPath:(content,{arguments})=>NewsPage(),
  newDetailPath:(content,{arguments})=>NewsDetail(url:arguments),
  homePath:(content,{arguments})=>HomePage()
};

var onGenerateRoute = (RouteSettings settings) { // 统一处理构建 一个 pageroute
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  print("加载route page");
  if (pageContentBuilder != null) {
    return  MaterialPageRoute(
        builder: (context) => pageContentBuilder(context,
            arguments: settings.arguments));
  }
};



