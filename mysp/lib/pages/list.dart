import 'package:flutter/material.dart';
import '../components/item.dart';

class ListPage extends StatefulWidget{
  @override
  _ListPageState createState() => new _ListPageState();
}

class _ListPageState extends State<ListPage> with SingleTickerProviderStateMixin{
  TabController controllerTop;
  final List<Tab> myTabs = <Tab>[
    new Tab(text: '进行中'),
    new Tab(text: '已完成'),
    new Tab(text: '已作废'),
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
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // automaticallyImplyLeading: false,
        title:Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              '浙B-YJ262',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              )
            ),
          ),
        ),
        flexibleSpace: Container(
          height: 80.0,
          decoration: BoxDecoration(
            // color: Colors.red,
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(151, 151, 151,1),
                width: 1.0,
              ),
            )
          ),
        ),
        bottom: TabBar(
          controller: controllerTop,
          tabs: myTabs,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(
            color: Color.fromRGBO(51, 51, 51, 1)
          ),
          indicatorColor: Color.fromRGBO(79, 123, 254, 100),
          indicatorWeight: 4.0,
          isScrollable: true,
        )
      ),
      body: TabBarView(
        controller: controllerTop,
        children: myTabs.map((Tab tab){
          return OrderItem(title: tab.text);
        }).toList(),
      )
    );
  }
}