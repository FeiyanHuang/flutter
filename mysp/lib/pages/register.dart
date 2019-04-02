import 'package:flutter/material.dart';
import '../components/rstep.dart';

class RegisterPage extends StatefulWidget{
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with SingleTickerProviderStateMixin{
  TabController rcontroller;
  @override
  void initState() {
    super.initState();
    rcontroller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    rcontroller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new RaisedButton(
              child: new Text('back'),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            // new IconButton(
            //   icon: new Icon(Icons.arrow_back),
            //   onPressed: (){
            //     Navigator.of(context).pop();
            //   },
            // ),
            // new BackButton(),
            new Align(
              alignment: Alignment.center,
              child: new Text(
                '身份认证',
                style: new TextStyle(
                  color: Colors.black
                ),
              )
            )
          ],
        ),
        bottom: new TabBar(
          controller: rcontroller,
          labelColor: Colors.black,
          indicator: new ShapeDecoration(
            color: Colors.red,
            shape: new Border.all(
              color: Colors.redAccent, 
              width: 0.5,
              style: BorderStyle.solid,
            )
          ),
          tabs: <Widget>[
            new Tab(
              text: '1',
            ),
            new Tab(
              text: '2',
            ),
            new Tab(
              text: '3',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: rcontroller,
        children: <Widget>[
          RegisterComponent(), //new Text('1'),
          new Text('2'),
          new Text('3'),
        ],
      ),
    );
  }
}