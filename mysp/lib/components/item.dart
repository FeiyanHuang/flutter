import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderItem extends StatefulWidget{
  OrderItem({Key key, this.title}):super(key:key);
  final String title;

  @override
  _OrderItemState createState() => new _OrderItemState();
}

class _OrderItemState extends State<OrderItem>{
// @override
//   void initState() {
//     super.initState();
//     print(widget.title);
//   }

  void show(){
    showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.only(top:16.0),
          // title: new Text('联系业务员'),
          children: <Widget>[
            Column(
              children: <Widget>[
                Center(
                  child: Text('联系业务员'),
                ),
                Padding(
                  padding: EdgeInsets.all(6.0),
                ),
                Center(
                  child: Text('188-2677-2562'),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(6.0),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton (
                  child: Text('取消'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                  height: 40.0,
                  width: 1.0,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                FlatButton (
                  child: Text('立刻呼叫'),
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
  Widget build(BuildContext context) {
    List<Widget> children = new List<Widget>();
    for(int i=1; i<10; i++){
      children.add(item(context));
    }

    return ListView(
      children: children
    );
  }

  Widget item(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.all(Radius.circular(8.0)),
                // borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),

        boxShadow: [BoxShadow(blurRadius: 2.0, offset: Offset(0, 2), color: Color.fromRGBO(51, 146, 253, 0.3))],
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('器械， 1.5吨，40方'),
              Text('未接受')
            ],
          ),
          Divider(),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('浙江省杭州市余杭区'),
                  IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () {
                      show();
                    },
                  )
                  // new Icon(Icons.phone)
                ],
              ),
              Row(
                children: <Widget>[
                  Text('浙江省嘉兴市嘉义区')
                ],
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('起运时间 2018-11-01'),
              RaisedButton(
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
    );
  }
}