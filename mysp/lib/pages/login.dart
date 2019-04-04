import 'package:flutter/material.dart';
import '../model/user.dart';
import 'package:provide/provide.dart';
import './home.dart';
import '../components/code.dart';
import '../components/pwd.dart';
import './register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _pwd = true;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  void pwdSubmit(phone, password) {
    getUserByPwd(phone, password).then((User user){
      Provide.value<UserModel>(context).login(user);
      Future.delayed(const Duration(microseconds: 500), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),);
      });
    }).catchError((e){
      scaffoldKey.currentState.showSnackBar(SnackBar(backgroundColor: Colors.deepOrange, content: Text('登录失败')));
    });
  }

  void codeSubmit(name, pwd) {
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
        margin: EdgeInsets.only(top: 60, left: 30, right: 30),
        // padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,//开头对齐
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'MeYoung',
            ),
            Container(
              margin: EdgeInsets.only(top: 90, bottom: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(102, 102, 102,1),
                    width: 1.0,
                  ),
                )
              ),
              child: Row(
                textBaseline: TextBaseline.ideographic,
                children: <Widget>[
                  // 密码登入
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _pwd = true;
                        print(_pwd);
                      }); 
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20.0),
                      height: 34.0,
                      decoration: _pwd ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color.fromRGBO(79, 123, 254,1),
                            width: 1.0,
                          ),
                        )
                      ): null,
                      child: Text(
                        '密码登录',
                        style: TextStyle(
                          color: !_pwd ? Colors.grey : Color.fromRGBO(79, 123, 254,1),
                          fontSize: 16.0
                        ),
                      ),
                    )
                  ),
                  // 验证码登陆
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _pwd = false;
                        print(_pwd);
                      }); 
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20.0),
                      height: 34.0,
                      decoration:!_pwd ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color.fromRGBO(79, 123, 254,1),
                            width: 1.0,
                          ),
                        )
                      ) : null,
                      child: Text(
                        '验证码登录',
                        style: TextStyle(
                          color: _pwd ? Colors.grey : Color.fromRGBO(79, 123, 254,1),
                          fontSize: 16.0
                        ),
                      ),
                    )
                  ),
                ],
              ),
            ),
            _pwd ? PwdComponents(
              pwdSubmit: this.pwdSubmit,
            ): CodeComponents(
              codeSubmit: this.codeSubmit,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,//开头对齐
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                    child: Text(
                    '注册司机',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(79, 123, 254,1),
                    )
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()),);
                  },
                )
              ],
            ),
          ],
        ),
      ),
      )
    );
  }
}
