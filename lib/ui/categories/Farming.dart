import 'package:flutter/material.dart';

class Farming1 extends StatefulWidget {
  static const String id = "Farming1";

  @override
  _Farming1State createState() => _Farming1State();
}

class _Farming1State extends State<Farming1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farming'),
      ),
    );
  }
}
