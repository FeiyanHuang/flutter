import 'package:flutter/material.dart';

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
    controllerTop = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    // controllerTop.dispose();
    super.dispose();
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
                  color: Colors.white,
                  margin: EdgeInsets.all(10.0),
                  // decoration: BoxDecoration(
                  //   color: Colors.red,
                  // ),
                  child: Column(
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,//两端对齐
                        children: <Widget>[
                          new Text('器械， 1.5吨，40方'),
                          new Text('未接受')
                        ],
                      ),
                      new Divider(),
                      new Column(
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,//两端对齐
                            children: <Widget>[
                              new Text('浙江省杭州市余杭区'),
                              new Icon(Icons.phone)
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,//两端对齐
                        children: <Widget>[
                          new Text('起运时间 2018-11-01'),
                          new RaisedButton(
                            onPressed: (){
                              print('aa');
                            },
                            child: Text("确认接受"),
                            color: Color.fromRGBO(79, 123, 254,1),
                            textColor: Colors.white,
                            // splashColor: Colors.black,
                            // highlightColor: Colors.green,
                            // elevation: 30,
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