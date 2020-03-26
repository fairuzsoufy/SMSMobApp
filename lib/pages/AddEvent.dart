import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget
{
  @override
  _AddEventState createState() => new _AddEventState();

}
class _AddEventState extends State<AddEvent>
{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add event'),
      ),
    );
  }
}