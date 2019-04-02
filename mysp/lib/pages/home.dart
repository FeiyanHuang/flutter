import 'package:flutter/material.dart';
import './my.dart';
import './list.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          ListPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          controller: controller,
          // indicatorColor: Color.fromRGBO(79, 123, 254,1),
          labelColor: Color.fromRGBO(79, 123, 254,1),
          tabs: <Tab>[
            new Tab(
              text: "订单",
              icon: new Icon(Icons.list),
            ),
            new Tab(
              text: "我的",
              icon: new Icon(Icons.supervisor_account),
            ),
          ],
        ),
      ),
    );
  }
}