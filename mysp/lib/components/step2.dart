import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import './photo.dart';

class secondStep extends StatelessWidget{
  TextEditingController carLength = new TextEditingController();
  TextEditingController carWeight = new TextEditingController();

  secondStep({Key key, this.change}): super(key: key);

  Function change;

  @override
  Widget build(BuildContext context){
    return new SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('车辆类型'),
                    Text('>')
                  ],
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      child: Text(
                        "长度",
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1, 
                      child:TextField(
                        controller: carLength,
                        decoration: InputDecoration.collapsed(
                          hintText:  '请输入车辆长度',
                        ),
                      )
                    )
                  ],
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      child: Text(
                        "承重",
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1, 
                      child:TextField(
                        controller: carWeight,
                        decoration: InputDecoration.collapsed(
                          hintText:  '请输入承重量',
                        ),
                      )
                    )
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('车辆号'),
                    Text('>')
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('车辆类型'),
                    Text('>')
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
                    PhotoBox(content: '行驶证'),
                    PhotoBox(content: '从业资格证'),
                    PhotoBox(content: '车辆运营证'),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10.0),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    PhotoBox(content: '车辆保险证'),
                    PhotoBox(content: '挂车行驶证'),
                    PhotoBox(content: '挂车运营证'),
                  ]
                ),
                Padding(padding: EdgeInsets.all(10.0),),

                Container(
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child:
                        RaisedButton(
                          onPressed: (){
                            var val = {
                              'carLength':  carLength.text != '' ? int.parse(carLength.text) : 0,
                              'carWeight':  carWeight.text != '' ? int.parse(carWeight.text) : 0,
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
          ),
        ],
      )
    );
  }
}
