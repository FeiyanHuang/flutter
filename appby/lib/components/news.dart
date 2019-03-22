import 'package:flutter/material.dart';

class NewsTab {
  String text;
  NewsList newsList;
  NewsTab(this.text, this.newsList);
}

class NewsList extends StatefulWidget {
  final String newsType;

  @override
  NewsList({Key key, this.newsType}):super(key:key);

  _NewListState createState() => new _NewListState();
}

class _NewListState extends State<NewsList> {
  final data = [];
  @override
  Widget build(BuildContext context){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: data == null ? 0:data.length,
      itemBuilder: (context, i){
        return _newsRow(data[i]);
      },
    );
  }
}