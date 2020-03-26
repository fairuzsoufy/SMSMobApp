import 'package:flutter/material.dart';

class TakeAttendance extends StatefulWidget
{
  @override
  _TakeAttendanceState createState() => new _TakeAttendanceState();

}
class _TakeAttendanceState extends State<TakeAttendance>
{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('TakeAttendance'),
      ),
    );
  }
}