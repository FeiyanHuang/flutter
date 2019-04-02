import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListPage extends StatefulWidget{
  @override
  _ListPageState createState() => new _ListPageState();
}

class _ListPageState extends State<ListPage> with SingleTickerProviderStateMixin{
  TabController controllerTop;
  final List<Tab> myTabs = <Tab>[
    new Tab(text: '待装车'),
    new Tab(text: '运输中'),
    new Tab(text: '已完成'),
    //Tab(text: '全部'),
  ];

  @override
  void initState() {
    super.initState();
    controllerTop = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    // controllerTop.dispose();
    super.dispose();
  }

  void show(){
    showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new SimpleDialog(
          contentPadding: EdgeInsets.only(top:16.0),
          // title: new Text('联系业务员'),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Center(
                  child: new Text('联系业务员'),
                ),
                new Padding(
                  padding: EdgeInsets.all(6.0),
                ),
                new Center(
                  child: new Text('188-2677-2562'),
                )
              ],
            ),
            new Padding(
              padding: EdgeInsets.all(6.0),
            ),
            new Divider(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new FlatButton (
                  child: new Text('取消'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                new Container(
                  height: 40.0,
                  width: 1.0,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                new FlatButton (
                  child: new Text('立刻呼叫'),
                  onPressed: () {
                    launch("tel://17858952904");
                  },
                ),
              ],
            )
          ],
        );
      },
    ).then((val) {
        print(val);
    });
  } 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Container(
          color: Colors.white,
          child: new Center(
            child: new Text(
              '浙B-YJ262',
              style: new TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              )
            ),
          ),
        ),
        bottom: new TabBar(
          controller: controllerTop,
          tabs: myTabs,
          labelColor: Colors.grey,
          indicatorColor: Colors.grey,
          isScrollable: true,
        )
      ),
      body: new TabBarView(
        controller: controllerTop,
        children: myTabs.map((Tab tab){
          // return new Text(tab.text);
          return  new ListView(
              children: <Widget>[
                // new Text('a'),
                new Container(
                  // color: Colors.white,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    boxShadow: [BoxShadow(blurRadius: 2.0, offset: Offset(0, 2), color: Color.fromRGBO(51, 146, 253, 0.3))],
                  ),
                  child: Column(
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text('器械， 1.5吨，40方'),
                          new Text('未接受')
                        ],
                      ),
                      new Divider(),
                      new Column(
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Text('浙江省杭州市余杭区'),
                              new IconButton(
                                icon: Icon(Icons.phone),
                                onPressed: () {
                                  show();
                                },
                              )
                              // new Icon(Icons.phone)
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new Text('浙江省嘉兴市嘉义区')
                            ],
                          )
                        ],
                      ),
                      new Divider(),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text('起运时间 2018-11-01'),
                          new RaisedButton(
                            onPressed: (){
                              print('aa');
                            },
                            child: Text("确认接受"),
                            color: Color.fromRGBO(79, 123, 254,1),
                            textColor: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
        }).toList(),
      )
    );
  }
}