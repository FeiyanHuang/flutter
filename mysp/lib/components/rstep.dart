import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../components/step1.dart';

class RegisterComponent extends StatefulWidget{
  RegisterComponent({Key key, this.step}):super(key: key);
  int step;
  @override
  _RegisterComponentState createState() => new _RegisterComponentState();
}

class _RegisterComponentState extends State<RegisterComponent> with SingleTickerProviderStateMixin{
  TextEditingController _username = new TextEditingController();
  TextEditingController _idcard = new TextEditingController();
  
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
  
  void onDataChange(val) {
    setState(() {
      _username = val;
      print(_username);
    });
  }

  @override
  Widget build(BuildContext context){
    switch(widget.step){
      case 1:
        // return firstStep(callback: (val) => onDataChange(val));
        return firstStep(step: _username, change: (val) => onDataChange(val));
        break;
      case 2:
        return secondStep();
        break;
      case 3:
        return thridStep();
        break;
    }
  }

  Widget secondStep(){
    return new SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text('车辆类型'),
                    new Text('>')
                  ],
                ),
                Divider(),
                new Row(
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      child: Text(
                        "长度",
                        style: new TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1, 
                      child:TextField(
                        controller: _username,
                        decoration: new InputDecoration.collapsed(
                          hintText:  '请输入车辆长度',
                        ),
                      )
                    )
                  ],
                ),
                Divider(),
                new Row(
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      child: Text(
                        "承重",
                        style: new TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1, 
                      child:TextField(
                        controller: _username,
                        decoration: new InputDecoration.collapsed(
                          hintText:  '请输入承重量',
                        ),
                      )
                    )
                  ],
                ),
                Divider(),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text('车辆号'),
                    new Text('>')
                  ],
                ),
                Divider(),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text('车辆类型'),
                    new Text('>')
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:  MainAxisAlignment.start,
              children: <Widget>[
                new Align(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    '照片上传',
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0),),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _image == null ?  imageBtn():Image.file(_image),
                    new GestureDetector(
                      child: new Container(
                        width: 80.0,
                        height: 80.0,
                        // margin: EdgeInsets.only(right: 20.0),
                        decoration: BoxDecoration(
                          // color: Color.fromRGBO(79, 123, 254,1),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          border: Border.all(color: Colors.grey)
                          // boxShadow: [BoxShadow(blurRadius: 2.0, offset: Offset(0, 2), color: Color.fromRGBO(51, 146, 253, 0.3))],
                        ),
                        child: new Text('身份证反面'),
                      ),
                    ),
                    new GestureDetector(
                      child: new Container(
                        width: 80.0,
                        height: 80.0,
                        // margin: EdgeInsets.only(right: 20.0),
                        decoration: BoxDecoration(
                          // color: Color.fromRGBO(79, 123, 254,1),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          border: Border.all(color: Colors.grey)
                          // boxShadow: [BoxShadow(blurRadius: 2.0, offset: Offset(0, 2), color: Color.fromRGBO(51, 146, 253, 0.3))],
                        ),
                        child: new Text('驾驶证'),
                      ),
                    ),
                  ],
                ),
                new Padding(padding: EdgeInsets.all(10.0),),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _image == null ?  imageBtn():Image.file(_image),
                    new GestureDetector(
                      child: new Container(
                        width: 80.0,
                        height: 80.0,
                        // margin: EdgeInsets.only(right: 20.0),
                        decoration: BoxDecoration(
                          // color: Color.fromRGBO(79, 123, 254,1),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          border: Border.all(color: Colors.grey)
                          // boxShadow: [BoxShadow(blurRadius: 2.0, offset: Offset(0, 2), color: Color.fromRGBO(51, 146, 253, 0.3))],
                        ),
                        child: new Text('身份证反面'),
                      ),
                    ),
                    new GestureDetector(
                      child: new Container(
                        width: 80.0,
                        height: 80.0,
                        // margin: EdgeInsets.only(right: 20.0),
                        decoration: BoxDecoration(
                          // color: Color.fromRGBO(79, 123, 254,1),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          border: Border.all(color: Colors.grey)
                          // boxShadow: [BoxShadow(blurRadius: 2.0, offset: Offset(0, 2), color: Color.fromRGBO(51, 146, 253, 0.3))],
                        ),
                        child: new Text('驾驶证'),
                      ),
                    ),
                  ],
                ),
                new Padding(padding: EdgeInsets.all(10.0),),
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget thridStep(){
    return SingleChildScrollView(
      child: new Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.all(20.0),
        color: Colors.white,
        child: new Text('感谢您提交认证，我们将在1～3个工作日内审核完毕，请耐心等待。。。'),
      ),
    );
  }
  
  Widget imageBtn(){
    return new GestureDetector(
      onTap: (){
        getImage();
      },
      child: new Container(
        width: 80.0,
        height: 80.0,
        // margin: EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          // color: Color.fromRGBO(79, 123, 254,1),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(color: Colors.grey)
          // boxShadow: [BoxShadow(blurRadius: 2.0, offset: Offset(0, 2), color: Color.fromRGBO(51, 146, 253, 0.3))],
        ),
        child: new Text('身份证正面'),
      ),
    );
  }
}