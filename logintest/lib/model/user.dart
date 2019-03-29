import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../page/home.dart';

class UserModel with ChangeNotifier {
  User _info;
  User get info => _info;

  var test = {
    "id": "1",
    "phone": "17858952904",
    "name": "hfy",
    "password": "123"
  };

  void login(String name, String password) async{
    if(test['name'] == name && test['password'] == password){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', json.encode({
        "user":{
          'name': name,
          'password':password
        }
      }));
      print('成功');
      // BuildContext context;
      // Navigator.push(
      //   context,
      //   new MaterialPageRoute(builder: (context) => new HomePage()),
      // );
      // Navigator.pushReplacement(BuildContext context, MaterialPageRoute(builder: (context) => HomePage()),);
    } else {
      print('失败');
      // BuildContext context;
      // showDialog<Null>(
      //   context: context,
      //   builder: (BuildContext context){
      //     return new SimpleDialog(
      //       title: new Text('失败'),
      //     );
      //   }
      // );
   }
  }

  void logout() async {
    _info = null;
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("user");
    await prefs.remove("token");
  }
}

class User {  
  User({this.token, this.id, this.phone, this.name, this.password});
  final String id, phone, name, password, token;
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'],
      id: json['user']['id'],
      phone: json['user']['phone'],
      name: json['user']['name'],
      password: json['user']['password'],
    );
  }
}