import 'package:flutter/material.dart';

class ShowImage extends StatefulWidget {
  String imageUrl;
  ShowImage({Key key,@required this.imageUrl}):super(key: key);
  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الصورة'),

      ),
      body: Container(
        child: Image.network(widget.imageUrl,fit: BoxFit.fill,height: 600,),
      ),
    );
  }
}
