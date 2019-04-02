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
  // TextEditingController _userphone = new TextEditingController();
  // TextEditingController _password = new TextEditingController();
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
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,//开头对齐
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'MeYoung',
            ),
            Text(
              '欢迎登录米多多',
              style: new TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              child: Row(
                children: <Widget>[
                  InkWell(
                    child: new Container(
                      margin: EdgeInsets.only(right: 20.0),
                      decoration: new BoxDecoration(
                        border: new Border(
                          bottom: BorderSide(
                            color: !(_pwd??false) ? Colors.grey : Color.fromRGBO(79, 123, 254,1),
                            width: 3.0,
                          ),
                        )
                      ),
                      child: new Padding(
                        padding: new EdgeInsets.all(8.0),                        
                        child: Text(
                          '密码登录',
                          style: new TextStyle(
                            color: !(_pwd??false) ? Colors.grey : Color.fromRGBO(79, 123, 254,1),
                          ),
                        ),
                      ),
                    ),  
                    onTap: () {   
                      setState(() {
                        _pwd = true;
                      });                       
                      // print("pwd");
                    },
                  ),
                  InkWell(
                    child: new Container(
                      margin: EdgeInsets.only(right: 20.0),
                      decoration: new BoxDecoration(
                        border: new Border(
                          bottom: BorderSide(
                            color: _pwd??false ? Colors.grey : Color.fromRGBO(79, 123, 254,1),
                            width: 3.0,
                          ),
                        )
                      ),
                      child: new Padding(
                        padding: new EdgeInsets.all(8.0),                        
                        child: Text(
                          '验证码登录',
                          style: new TextStyle(
                            color: _pwd??false ? Colors.grey : Color.fromRGBO(79, 123, 254,1),
                          ),
                        ),
                      ),
                    ),  
                    onTap: () {                          
                      setState(() {
                        _pwd = false;
                      });  
                    },
                  ),

                ],
              ),
            ),
            
            // _pwd ? pwd(): code(),
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
                    // print('注册');
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterPage()),);
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
