import 'package:flutter/material.dart';
import '../pages/reset.dart';

class PwdComponents extends StatefulWidget{
  PwdComponents({Key key, this.pwdSubmit}):super(key: key);
  final Function pwdSubmit;

  @override
  _PwdComponentsState createState() => new _PwdComponentsState();
}

class _PwdComponentsState extends State<PwdComponents> with SingleTickerProviderStateMixin{
  TextEditingController _userphone = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  void _pwdSubmit(){
    if (widget.pwdSubmit != null) widget.pwdSubmit(_userphone.text, _password.text);
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
                    hintText: '请输入手机号',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(187, 187, 187, 1),
                      fontSize: 16.0
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(151, 151, 151, 1),
                        width: 1.0
                      )
                    )
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
                    hintText: '请输入密码',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(187, 187, 187, 1),
                      fontSize: 16.0
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(151, 151, 151, 1),
                        width: 1.0
                      )
                    )
                  ),
                )
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new PasswordPage()));
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PasswordPage()),);
                  },
                  child: Text(
                    '忘记密码？',
                    style: TextStyle(
                      color: Color.fromRGBO(102, 102, 102, 1),
                      fontSize: 16.0
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  onPressed: (){
                    _pwdSubmit();
                  },
                  child: Text(  
                    "登录", 
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    )
                  ),
                  color: Color.fromRGBO(79, 123, 254,1),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color.fromRGBO(151, 151, 151, 1),
                      width: 1.0,
                    )
                  ),
                  elevation: 6,
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  // borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}