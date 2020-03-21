import 'package:SMS/theme.dart';
import 'package:flutter/material.dart';

class CollapsingListTitle extends StatefulWidget{
  final String title;
  final IconData icon;

  CollapsingListTitle({@required this.title, @required this.icon});

  @override
  _CollapsingListTitleState createState() => _CollapsingListTitleState();
  
}

class _CollapsingListTitleState extends State<CollapsingListTitle>
{
  @override
  Widget build(BuildContext context) 
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0,vertical:8.0),
      child: Row(children: <Widget>[
        Icon(widget.icon, color: Colors.white30, size: 38.0,),
        SizedBox(width: 10.0),
        Text(widget.title,style: listTitleDefaultTextStyle,)
      
        ],
      ),
    );
  }
}