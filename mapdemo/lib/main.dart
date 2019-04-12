import 'package:flutter/material.dart';
import './map.dart';
import 'package:flutter_amap/flutter_amap.dart';

void main(){
  FlutterAmap.setApiKey("0787b16ca4fd97815b1d354571e9f9c1");
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Map(),
      )
    );
  }
}
