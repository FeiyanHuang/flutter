import 'package:flutter/material.dart';

class ThridStep extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.all(20.0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Image.asset('assets/checkimg.png'),
            Text('感谢您提交认证，我们将在1～3个工作日内审核完毕，请耐心等待。。。'),
          ],
        )
      ),
    );
  }
}