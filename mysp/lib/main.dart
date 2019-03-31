import 'package:flutter/material.dart';
import './pages/login.dart';
import 'package:flutter/services.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './model/user.dart';
import './pages/home.dart';

void main() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  bool _localUser = await getLocalUser();
  final providers =Providers()
    ..provide(Provider<UserModel>.value(UserModel()));

  runApp(
    ProviderNode(
      providers: providers,
      child: MyApp(user: _localUser),
    ),
  );
}

Future<bool> getLocalUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString("user");
  if(token != null){
    print('已存在');
    return true;
  }else{
    print('未存在');
    return false;
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key key, this.user}):super(key: key);
  final bool user;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: user ? HomePage():LoginPage(),
    );
  }
}

