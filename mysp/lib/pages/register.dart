import 'package:flutter/material.dart';
import '../components/step1.dart';
import '../components/step2.dart';
import '../components/step3.dart';

class RegisterPage extends StatefulWidget{
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with SingleTickerProviderStateMixin{
  int step = 1;
  String userName;
  String idCard;
  int carLength;
  int carWeight;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void first(val) {
    setState(() {
      userName = val['username'];
      idCard = val['idcard'];
      step = 2;
    });
  }

  void second(val) {
    setState(() {
      carLength = val['carLength'];
      carWeight = val['carWeight'];
      step = 3;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(51, 51, 51, 1),  
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          step == 1 ? '身份认证': (step == 2 ? '车辆认证' : '审核'),
          style: TextStyle(
            color: Color.fromRGBO(51, 51, 51, 1),
            fontSize: 18.0
          ),
        ),
        elevation: 1.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10.0),
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  stepBox(1, '身份认证'),
                  Expanded(child: Divider(color: Color.fromRGBO(79, 123, 254,1),),),
                  stepBox(2, '车辆认证'),
                  Expanded(child: Divider(color: Color.fromRGBO(79, 123, 254,1),),),
                  stepBox(3, ' 审核 '),
                ],
              )
            ),
            Container(
              child: step == 1 ? 
                FirstStep(change: (val) => first(val)) : 
                (step == 2 ? 
                  SecondStep(change: (val) => second(val)) : 
                  ThridStep()
                ),
            ),
          ],
        ),
      ),
    );
  }

  Widget stepBox(int id, String text) {
    return GestureDetector(
      onTap: (){
        setState(() {
          step = id;
        });
      },
      child: Column(
       children: <Widget>[
         Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            color: step == id ? Color.fromRGBO(79, 123, 254,1):Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Center(
            child: Text(
              '$id',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          )
        ),
       Center(
         child: Padding(
           padding: EdgeInsets.only(top: 10.0),
           child: Text(
              '$text',
              style: TextStyle(
                fontSize: 14.0,
                color: step == id ? Colors.black : Colors.grey,
                fontFamily: 'PingFang SC'
              ),
            ),
           )
         )
       ], 
      )
    );
  }
}