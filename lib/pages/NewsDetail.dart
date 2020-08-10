import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class NewsDetail extends StatefulWidget{
   final  arguments;
   NewsDetail({@required this.arguments,Key key}):super(key:key);

   _NewsState createState()=>_NewsState();
}

class _NewsState extends State<NewsDetail>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.arguments["url"]);
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
            body: WebView(
                 initialUrl: widget.arguments["url"],

            ),
    );
  }

}