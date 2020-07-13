import 'package:flutter/material.dart';

class Livestock extends StatefulWidget {
  static const String id = "Livestock";

  @override
  _LivestockState createState() => _LivestockState();
}

class _LivestockState extends State<Livestock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livestock'),
      ),
    );
  }
}
