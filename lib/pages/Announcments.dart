import 'package:flutter/material.dart';

class Announcments extends StatefulWidget {
  @override
  _AnnouncmentsState createState() => _AnnouncmentsState();
}

class _AnnouncmentsState extends State<Announcments> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Announcments'),
      ),
    );
  }
}