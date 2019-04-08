import 'package:flutter/material.dart';
import '../pages/reset.dart';

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
            crossAxisAlignment: CrossAxisAlignment.end, //Row中底部对齐
            children: <Widget>[
              Expanded(
                flex: 1, 
                child:TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: '请输入验证码',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(187, 187, 187, 1),
                      fontSize: 16.0
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(151, 151, 151, 1),
                        width: 1.0
                      )
                    ),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        print('验证吗已发送');
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0, top: 6.0),
                        margin: EdgeInsets.only(top: 4.0, bottom: 4.0),
                        child: Text(
                          '获取验证码',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                        decoration:  BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color.fromRGBO(151, 151, 151, 1),
                            ),
                          )
                        ),
                      ),
                    )
                  ),
                )
              ),
              // Container(
              //   padding: EdgeInsets.only(left: 10.0),
              //   margin: EdgeInsets.only(left: 10.0),
              //   child: Text(
              //     '获取验证码',
              //     style: TextStyle(
              //       fontSize: 16.0,
              //       color: Color.fromRGBO(51, 51, 51, 1),
              //     ),
              //   ),
              //   decoration:  BoxDecoration(
              //     border: Border(
              //       left: BorderSide(
              //         color: Color.fromRGBO(151, 151, 151, 1),
              //       ),
              //     )
              //   ),
              // ),
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
                    _codeSubmit();
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