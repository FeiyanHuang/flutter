import 'package:flutter/material.dart';

class CodeComponents extends StatefulWidget{
  CodeComponents({Key key, this.codeSubmit}):super(key: key);
  final Function codeSubmit;

  @override
  _CodeComponentsState createState() => new _CodeComponentsState();
}

class _CodeComponentsState extends State<CodeComponents> with SingleTickerProviderStateMixin{
  TextEditingController _userphone = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  void _codeSubmit(){
    if (widget.codeSubmit != null) widget.codeSubmit(_userphone.text, _password.text);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1, 
                child:TextField(
                  controller: _userphone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: '请输入手机号',
                  ),
                )
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1, 
                child:TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: '请输入验证码',
                  ),
                )
              ),
              Column(
                children: <Widget>[
                  Text('获取验证码'),
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              new Expanded(
                child: 
                  Padding(padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),)
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,//开头对齐
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '忘记密码？',
              ),
            ],
          ),
          Row(
            children: <Widget>[
              new Expanded(
                child: 
                  Padding(padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),)
              ),
            ],
          ),
          Row(
            children: <Widget>[
              new Expanded(child:
                new RaisedButton(
                  onPressed: (){
                    _codeSubmit();
                  },
                  child: new Padding(padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                  child: new Text(  
                      "登录", 
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
          Row(
            children: <Widget>[
              new Expanded(
                child: 
                  Padding(padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),)
              ),
            ],
          ),
        ],
      ),
    );
  }
}