import 'package:flutter/material.dart';

class RegisterComponent extends StatefulWidget{
  @override
  _RegisterComponentState createState() => new _RegisterComponentState();
}

class _RegisterComponentState extends State<RegisterComponent> with SingleTickerProviderStateMixin{
  TextEditingController _username = new TextEditingController();
  TextEditingController _idcard = new TextEditingController();
  // TabController controller;
  // @override
  // void initState() {
  //   controller = new TabController(vsync: this, length: 3);
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context){
    return new SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                    Container(
                      width: 100.0,
                      child: Text(
                        "姓名",
                        style: new TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1, 
                      child:TextField(
                        controller: _username,
                        decoration: new InputDecoration.collapsed(
                          hintText:  '请输入姓名',
                        ),
                      )
                    )
                  ],
                ),
                Divider(),
                Row(children: <Widget>[
                    Container(
                      width: 100.0,
                      child: Text(
                        "身份证号",
                        style: new TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1, 
                      child:TextField(
                        controller: _idcard,
                        decoration: new InputDecoration.collapsed(
                          hintText:  '请输入姓名',
                        ),
                      )
                    )
                  ],
                )
              ],
            ),
          )
          
        ],
      ),
    );
  }
}