import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoBox extends StatefulWidget{
  PhotoBox({Key key, this.content}): super(key: key);
  final String content;
  @override
  _PhotoBoxState createState() => new _PhotoBoxState();
}

class _PhotoBoxState extends State<PhotoBox> with SingleTickerProviderStateMixin{  
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return _image == null ? GestureDetector(
      onTap: (){
        getImage();
      },
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(color: Colors.grey)
        ),
        child: Text(widget.content),
      ),
    ) : Image.file(_image);
  }
}