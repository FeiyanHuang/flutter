import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
// import '../page/home.dart';

var test = {
    "id": "1",
    "phone": "17858952904",
    "name": "hfy",
    "password": "123"
  };

class UserModel with ChangeNotifier {
  User _info;
  User get info => _info;

  
  void login(User user) async{
    print('here login');
    _info = user;

    SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', json.encode({
        "user":{
          'name': user.name,
          'password':user.password
        }
      }));

      if (user.token != null) await prefs.setString('token', user.token);

      notifyListeners();
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
      id: json['id'],
      phone: json['phone'],
      name: json['name'],
      password: json['password'],
    );
  }
}

Future<User> getUserByPwd(String phone, String password) async {
  if(test['phone'] == phone && test['password'] == password){
    print(test);
    print(User.fromJson(test));
    return User.fromJson(test);

    // return test;
  } else {
      print('失败');
      throw Exception('登入失败');
   }
}