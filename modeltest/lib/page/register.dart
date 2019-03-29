import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _age = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  bool sex, _hobby1=false, _hobby2=false;
  List _hobbies = new List();

  void _checkboxChanged(String value) {
    setState(() {
      _hobbies.indexOf(value) == -1 ? _hobbies.add(value) : _hobbies.remove(value);
    });
    print(_hobbies);
  }

    // 增加一个元素到列表末尾
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: <Widget>[
              Text("姓名"),
              Expanded(flex: 1, child:TextField(controller: _name,))
            ],),
            Row(children: <Widget>[
              Text("年龄"),
              Expanded(flex: 1, child:TextField(controller: _age,))
            ],),
            Row(children: <Widget>[
              Text("联系方式"),
              Expanded(flex: 1, child:TextField(controller: _phone,))
            ],),
            new RadioListTile(
              value: true,
              title: new Text('男'),
              groupValue: sex,//当value和groupValue一致的时候则选中
              activeColor: Colors.red,
              onChanged: (T){
                updateGroupValue(T);
              }
          ),
          new RadioListTile(
              value: false,
              title: new Text('女'),
              groupValue: sex,//当value和groupValue一致的时候则选中
              activeColor: Colors.red,
              onChanged: (T){
                updateGroupValue(T);
              }
          ),
          new CheckboxListTile(
            value: _hobbies.indexOf("音乐") != -1,
            onChanged: (text)=> _checkboxChanged("音乐"),
            title: new Text('音乐'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.red,
          ),
          new CheckboxListTile(
            value: _hobbies.indexOf("运动") != -1,
            onChanged: (text)=> _checkboxChanged("运动"),
            title: new Text('运动'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.red,
          ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    ));
  }

  void updateGroupValue(T){
    setState(() {
      sex = T;
    });
  }
  // void _value2Changed(bool value) => setState(() => _value2 = value);
  void _hobby1Changed(bool value){
    return setState(
      (){
        if(value){
          _hobbies.add("音乐");
          print(_hobbies);

          // hobbies.add('音乐');
        } else {
          _hobbies.remove("音乐");
          print(_hobbies);
        }
        return _hobby1 = value;
      }
    );
  } 
  void _hobby2Changed(bool value){
    return setState(
      (){
        if(value){
          _hobbies.add("运动");
          print(_hobbies);

          // hobbies.add('音乐');
        } else {
          _hobbies.remove("运动");
          print(_hobbies);
        }
        return _hobby2 = value;
      }
    );
  } 
}