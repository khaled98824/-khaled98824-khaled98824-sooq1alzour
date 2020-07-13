import 'package:flutter/material.dart';

class Homes extends StatefulWidget {
  static const String id = "Homes";

  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homes'),
      ),
    );
  }
}
