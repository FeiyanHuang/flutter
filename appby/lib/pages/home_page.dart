import 'package:flutter/material.dart';
import '../components/drawer.dart';
import '../pages/other_page.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController controller;
  TabController controllerTop;

  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'Tab1'),
    new Tab(text: 'Tab2'),
    new Tab(text: 'Tab3'),
    new Tab(text: 'Tab4'),
    new Tab(text: 'Tab5'),
    new Tab(text: 'Tab6'),
    new Tab(text: 'Tab7'),
    new Tab(text: 'Tab8'),
    new Tab(text: 'Tab9'),
    new Tab(text: 'Tab10'),
    new Tab(text: 'Tab11'),
  ];

  @override
  void initState(){
    super.initState();
    // controller = new TabController(
    //   vsync: this,
    //   length: 3
    // );
    controllerTop = new TabController(
      vsync: this,
      length: myTabs.length
    );
  }

  @override
  void dispose(){
    // controller.dispose();
    controllerTop.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        title: new TabBar(
          controller: controllerTop,
          tabs: myTabs,
          indicatorColor: Colors.white,
          isScrollable: true,
        )
      ),
      drawer: new Drawer2(),
      body: new TabBarView(
        controller: controllerTop,
        children: myTabs.map((Tab tab){
          return new OtherPage(tab.text);
          // return new Center(child: new Text(tab.text));
        }).toList(),
        // children: <Widget>[
        //   new OtherPage('First Page'),
        //   new OtherPage('second Page'),
        //   new OtherPage('third Page')
        // ],
      ),
      // bottomNavigationBar: new Material(
      //   color: Colors.deepOrange,
      //   child: new TabBar(
      //     controller: controller,
      //     tabs: <Widget>[
      //       new Tab(icon: new Icon(Icons.directions_car)),
      //       new Tab(icon: new Icon(Icons.directions_transit)),
      //       new Tab(icon: new Icon(Icons.directions_bike)),
      //     ],
      //     indicatorColor: Colors.white
      //   ),
      // ),
    );
  }
}