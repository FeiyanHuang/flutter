import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/splash.dart';
import 'package:provide/provide.dart';
import './model/user.dart';


void main() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  
  final providers =Providers()
    ..provide(Provider<UserModel>.value(UserModel()));

  runApp(
    ProviderNode(
      providers: providers,
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      // routes: <String, WidgetBuilder>{
      //   '/welcome': (BuildContext context) => new WelcomePage()
      // },
    );
  }
}

