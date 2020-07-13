import 'package:flutter/material.dart';

class Games extends StatefulWidget {
  static const String id = "Games";

  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games'),
      ),
    );
  }
}
