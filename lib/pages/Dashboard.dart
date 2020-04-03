import 'package:SMS/pages/AddDelegates.dart';
import 'package:SMS/pages/AddEvent.dart';
import 'package:SMS/pages/Announcments.dart';
import 'package:SMS/pages/AttendanceHistory.dart';
import 'package:SMS/pages/Calendar.dart';
import 'package:SMS/pages/Events.dart';
import 'package:SMS/pages/Settings.dart';
import 'package:SMS/pages/takeAttendance.dart';
import 'package:SMS/services/auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final AuthService _auth = AuthService();
  
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
                icon: Icon(Icons.person), onPressed: () {  },
              ),),
              Divider(color: Colors.grey, height: 30.0,),
            new ListTile(
              title: new Text("Take Attendance"), 
              leading: new IconButton(
                icon: Icon(Icons.mode_edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TakeAttendance()),
                  );
                }
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
                icon: Icon(Icons.playlist_add_check),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AttendanceHistory()),
                  );
                }
              ),
            ),
            new ListTile(
              title: new Text("Add Event"), 
              leading: new IconButton(
                icon: Icon(Icons.add_a_photo),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddEvent()),
                  );
                }
              ),
            ),
            new ListTile(
              title: new Text("Events"), 
              leading: new IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Events()),
                  );
                }
              ),
            ),
            new ListTile(
              title: new Text("Calendar"), 
              leading: new IconButton(
                icon: Icon(Icons.calendar_view_day),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Calendar()),
                  );
                }
              ),
            ),
            new ListTile(
              title: new Text("Add Delegates"), 
              leading: new IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddDelegates()),
                  );
                }
              ),
            ),
            new ListTile(
              title: new Text("Announcments"), 
              leading: new IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Announcments()),
                  );
                }
              ),
            ),
            new ListTile(
              title: new Text("Settings"), 
              leading: new IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                }
              ),
            ),
            new ListTile(
              title: new Text("Sign Out"), 
              leading: new IconButton(
                icon: Icon(Icons.settings),
                onPressed: ()async {
                 
                  await _auth.signOut();

                }
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}