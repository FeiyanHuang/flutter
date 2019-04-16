import 'package:flutter/material.dart';
import './login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './home.dart';

class WelcomePage extends StatefulWidget{
  @override
  _WelcomePageState createState() => _WelcomePageState();
} 

class _WelcomePageState extends State<WelcomePage>{
  bool localUser;

  @override
  void initState() {
    super.initState();
    user();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void user() async {
    await getLocalUser();
  }

  Future<bool> getLocalUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = prefs.getString("user");
    if(user != null){
      setState(() {
        localUser = true;  
      });
      return true;
    }else{
      setState(() {
        localUser = false;  
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return localUser??false ? HomePage():LoginPage();
  }
}

