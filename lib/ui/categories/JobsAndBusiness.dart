import 'package:flutter/material.dart';

class JobsAndBusiness extends StatefulWidget {
  static const String id = "JobsAndBusiness";

  @override
  _JobsAndBusinessState createState() => _JobsAndBusinessState();
}

class _JobsAndBusinessState extends State<JobsAndBusiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('JobsAndBusiness'),
      ) ,

    );
  }
}
