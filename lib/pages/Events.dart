import 'package:flutter/material.dart';

class Events extends StatefulWidget
{
  @override
  _EventsState createState() => new _EventsState();

}
class _EventsState extends State<Events>
{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Events'),
      ),
    );
  }
}