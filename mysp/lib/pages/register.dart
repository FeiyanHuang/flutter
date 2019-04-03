import 'package:flutter/material.dart';
import '../components/rstep.dart';

class RegisterPage extends StatefulWidget{
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with SingleTickerProviderStateMixin{
  TabController rcontroller;
  int step = 1;
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
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(top: 10.0),
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        step = 1;
                      });
                    },
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: step == 1 ? Color.fromRGBO(79, 123, 254,1):Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        // boxShadow: [BoxShadow(blurRadius: 2.0, offset: Offset(0, 2), color: Color.fromRGBO(51, 146, 253, 0.3))],
                      ),
                      child: Center(
                        child: new Text(
                          '1',
                          style: new TextStyle(
                            color: Colors.white
                          ),
                        ),
                      )
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        step = 2;
                      });
                    },
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: step == 2 ? Color.fromRGBO(79, 123, 254,1):Colors.grey,
                        // color: Color.fromRGBO(79, 123, 254,1),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        // boxShadow: [BoxShadow(blurRadius: 2.0, offset: Offset(0, 2), color: Color.fromRGBO(51, 146, 253, 0.3))],
                      ),
                      child: Center(
                        child: new Text(
                          '2',
                          style: new TextStyle(
                            color: Colors.white
                          ),
                        ),
                      )
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        step = 3;
                      });
                    },
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: step == 3 ? Color.fromRGBO(79, 123, 254,1):Colors.grey,
                        // color: Color.fromRGBO(79, 123, 254,1),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        // boxShadow: [BoxShadow(blurRadius: 2.0, offset: Offset(0, 2), color: Color.fromRGBO(51, 146, 253, 0.3))],
                      ),
                      child: Center(
                        child: new Text(
                          '3',
                          style: new TextStyle(
                            color: Colors.white
                          ),
                        ),
                      )
                    ),
                  ),
                ],
              )
            ),
            Container(
              child: RegisterComponent(step: step),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(child:
                    step == 3 ? new Text('') : new RaisedButton(
                      onPressed: (){
                        setState(() {
                          if(step<3){
                            step++;
                          } else {
                            step = 1;
                          }
                        });
                      },
                      child: new Padding(padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                      child: new Text(  
                          "下一步", 
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                            )
                        ),
                      ),
                      color: Color.fromRGBO(79, 123, 254,1),
                      // borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // body: TabBarView(
      //   controller: rcontroller,
      //   children: <Widget>[
      //     RegisterComponent(), //new Text('1'),
      //     new Text('2'),
      //     new Text('3'),
      //   ],
      // ),
    );
  }
}