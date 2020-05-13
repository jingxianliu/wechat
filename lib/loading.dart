import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget{
  @override
  _LoadingState createState() => new _LoadingState();
  
}

class _LoadingState extends State<LoadingPage>{
 
  @override
  void initState(){
     super.initState();
     new Future.delayed(Duration(seconds: 3),(){
       print("flutter高仿微信程序启动...");
       Navigator.of(context).pushReplacementNamed("app");
       print("跳转");
     });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child:Image.asset("images/loading.jpeg"),
     //child:new Text("hello flutter1312")
    );
  }

}