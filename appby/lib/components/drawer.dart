import 'package:flutter/material.dart';
import '../pages/other_page.dart';

class Drawer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('HFY'),
            accountEmail: new Text('515978951@qq.com'),
            currentAccountPicture: new GestureDetector(
              onTap: () => print('current user'),
              child: new CircleAvatar(
                backgroundImage: new NetworkImage('https://upload.jianshu.io/users/upload_avatars/7700793/dbcf94ba-9e63-4fcf-aa77-361644dd5a87?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
              ),
            ),
            otherAccountsPictures: <Widget>[
              new GestureDetector(
                onTap: () => print('other user'),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage('https://upload.jianshu.io/users/upload_avatars/7700793/dbcf94ba-9e63-4fcf-aa77-361644dd5a87?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
                ),
              ),
              new GestureDetector(
                onTap: () => print('other user'),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage('https://upload.jianshu.io/users/upload_avatars/7700793/dbcf94ba-9e63-4fcf-aa77-361644dd5a87?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
                ),
              ),
            ],
            decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new ExactAssetImage('images/1.png')
              )
            ),
          ),
          new ListTile(
            title: new Text('First Page'),
            trailing: new Icon(Icons.arrow_upward),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage('First Page')));
            },
          ),
          new ListTile(
            title: new Text('Second Page'),
            trailing: new Icon(Icons.arrow_right),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage('Second Page')));
            },
          ),
          new ListTile(
            title: new Text('First Page'),
            trailing: new Icon(Icons.arrow_right),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage('First Page')));
            },
          ),
          new Divider(),
          new ListTile(   //退出按钮
            title: new Text('Close'),
            trailing: new Icon(Icons.cancel),
            onTap: () => Navigator.of(context).pop(),   //点击后收起侧边栏
          ),
        ],
      ),
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(right: 100.0),
    );
  }
}