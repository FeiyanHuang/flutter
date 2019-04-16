import 'package:flutter/material.dart';

class OrderAdd extends StatefulWidget{
  @override
  _OrderAddState createState() => new _OrderAddState();
}

class _OrderAddState extends State<OrderAdd>{
  void dd(){
    print('a');
  }
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('发布状态'),
      children: <Widget>[
        FlatButton (
          child: Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Radio(
          value: true,
        )
      ],
    );
  }
}