import 'package:SMS/commons/collapsing_navigation_drawer.dart';
import 'package:SMS/pages/AddDelegates.dart';
import 'package:SMS/pages/AddEvent.dart';
import 'package:SMS/pages/Announcments.dart';
import 'package:SMS/pages/AttendanceHistory.dart';
import 'package:SMS/pages/Calendar.dart';
import 'package:SMS/pages/Events.dart';
import 'package:SMS/pages/takeAttendance.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demoe',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Sidemenu')),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
             SizedBox(height: 50.0,),
              new ListTile(
              title: new Text('Fairuz'),
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
              title: new Text("Att. History"), 
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


Widget menu ()
{

}