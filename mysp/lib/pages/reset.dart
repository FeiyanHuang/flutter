import 'package:flutter/material.dart';

class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController _phone = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new RaisedButton(
              child: new Text('back'),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            new Align(
              alignment: Alignment.center,
              child: new Text(
                '找回密码',
                style: new TextStyle(
                  color: Colors.black
                ),
              )
            )
          ],
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.only(top: 20.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1, 
                        child:TextField(
                          controller: _phone,
                          decoration: new InputDecoration.collapsed(
                            hintText:  '请输入姓名',
                          ),
                        )
                      )
                    ],
                  ),
                  Divider(),
                  new Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1, 
                        child:TextField(
                          controller: _phone,
                          decoration: new InputDecoration.collapsed(
                            hintText:  '请输入验证码',
                          ),
                        )
                      ),
                      new Container(
                        decoration: BoxDecoration(
                          // borderColor: Colors.red,
                          border: Border(top: BorderSide.none)
                        ),
                        child: new Text('获取验证码'),
                      )
                    ],
                  ),
                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                children: <Widget>[
                  new Expanded(child:
                    new RaisedButton(
                      onPressed: (){
                        print('下一步');
                      },
                      child: new Padding(padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: new Text(  
                          "下一步", 
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                            )
                        ),
                      ),
                      color: Color.fromRGBO(79, 123, 254,1),
                      // borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}