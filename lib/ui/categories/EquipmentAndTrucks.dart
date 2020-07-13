import 'package:flutter/material.dart';

class EquipmentAndTrucks extends StatefulWidget {
  static const String id = "EquipmentAndTrucks";

  @override
  _EquipmentAndTrucksState createState() => _EquipmentAndTrucksState();
}

class _EquipmentAndTrucksState extends State<EquipmentAndTrucks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipment and trucks'),
      ),
    );
  }
}
