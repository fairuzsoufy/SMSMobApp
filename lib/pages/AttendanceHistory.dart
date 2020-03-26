import 'package:flutter/material.dart';

class AttendanceHistory extends StatefulWidget
{
  @override
  _TakeAttendanceHistoryState createState() => new _TakeAttendanceHistoryState();

}
class _TakeAttendanceHistoryState extends State<AttendanceHistory>
{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ATTTT history'),
      ),
    );
  }
}