import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

// void main() => runApp(MyApp());
void main() {
  debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Image Test'),
        ),
        body: new Center(
          // child: new Text('hello Word'),
          child: new Image.asset(
            'images/1.png',
            width: 100.0,
            height: 100.0,
            fit:BoxFit.cover,
          ),
        ),
      ),
    );
  }
}