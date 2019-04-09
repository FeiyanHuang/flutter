import 'package:flutter/material.dart';
import './photo.dart';

class firstStep extends StatelessWidget{
  TextEditingController username = new TextEditingController();
  TextEditingController idcard = new TextEditingController();

  firstStep({Key key, this.change}): super(key: key);

  Function change;

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                    Container(
                      width: 100.0,
                      child: Text(
                        "姓名",
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1, 
                      child:TextField(
                        controller: username,
                        decoration: InputDecoration.collapsed(
                          hintText:  '请输入姓名',
                        ),
                      )
                    )
                  ],
                ),
                Divider(),
                Row(children: <Widget>[
                    Container(
                      width: 100.0,
                      child: Text(
                        "身份证号",
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1, 
                      child:TextField(
                        controller: idcard,
                        decoration: InputDecoration.collapsed(
                          hintText:  '请输入姓名',
                        ),
                      )
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:  MainAxisAlignment.start,
              children: <Widget>[
                 Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '照片上传',
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    PhotoBox(content: '身份证正面'),
                    PhotoBox(content: '身份证反面'),
                    PhotoBox(content: '驾驶证'),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10.0),),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(child:
                  RaisedButton(
                    onPressed: (){
                      var val = {
                        'username': username.text,
                        'idcard': idcard.text,
                      };
                      change(val);
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: Text(  
                        "下一步", 
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                          )
                      ),
                    ),
                    color: Color.fromRGBO(79, 123, 254,1),
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}