import 'package:SMS/pages/AddDelegates.dart';
import 'package:SMS/pages/AddEvent.dart';
import 'package:SMS/pages/Announcments.dart';
import 'package:SMS/pages/AttendanceHistory.dart';
import 'package:SMS/pages/Calendar.dart';
import 'package:SMS/pages/Events.dart';
import 'package:SMS/pages/takeAttendance.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('YARAB TESHTGHALO')),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
             SizedBox(height: 50.0,),
              new ListTile(
              title: new Text('Fairuzz'),
              leading: new IconButton(
                icon: Icon(Icons.person)
              ),),
              Divider(color: Colors.grey, height: 30.0,),
            new ListTile(
              title: new Text("Take Attendance"), 
              leading: new IconButton(
                icon: Icon(Icons.mode_edit)
              ),
              onTap: () 
              {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new TakeAttendance()));
              },
            ),
            new ListTile(
              title: new Text("Attendance History"), 
              leading: new IconButton(
                icon: Icon(Icons.playlist_add_check)
              ),
              onTap: () 
              {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new AttendanceHistory()));
              },
            ),
            new ListTile(
              title: new Text("Add Event"), 
              leading: new IconButton(
                icon: Icon(Icons.add_a_photo)
              ),
              onTap: () 
              {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new AddEvent()));
              },
            ),
            new ListTile(
              title: new Text("Events"), 
              leading: new IconButton(
                icon: Icon(Icons.calendar_today)
              ),
              onTap: () 
              {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new Events()));
              },
            ),
            new ListTile(
              title: new Text("Calendar"), 
              leading: new IconButton(
                icon: Icon(Icons.calendar_view_day)
              ),
              onTap: () 
              {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new Calendar()));
              },
            ),
            new ListTile(
              title: new Text("Add Delegates"), 
              leading: new IconButton(
                icon: Icon(Icons.add)
              ),
              onTap: () 
              {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new AddDelegates()));
              },
            ),
            new ListTile(
              title: new Text("Announcments"), 
              leading: new IconButton(
                icon: Icon(Icons.notifications)
              ),
              onTap: () 
              {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new Announcments()));
              },
            ),
            new ListTile(
              title: new Text("Settings"), 
              leading: new IconButton(
                icon: Icon(Icons.settings)
              ),
              onTap: () 
              {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new Announcments()));
              },
            ),
            
          ],
        ),
      ),
    );
  }
}