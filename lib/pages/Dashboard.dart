
import 'package:SMS/models/user.dart';
import 'package:SMS/pages/AddDelegates.dart';
import 'package:SMS/pages/AddEvent.dart';
import 'package:SMS/pages/Announcments.dart';
import 'package:SMS/pages/AttendanceHistory.dart';
import 'package:SMS/pages/Calendar.dart';
import 'package:SMS/pages/Events.dart';
import 'package:SMS/pages/Settings.dart';
import 'package:SMS/pages/takeAttendance.dart';
import 'package:SMS/services/auth.dart';
import 'package:SMS/wrapper.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
  
class _DashboardState extends State<Dashboard>{
  final AuthService _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(title: Text('home')),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
             SizedBox(height: 50.0,),
             StreamBuilder(
               stream: User().getUserFname(),
               builder: (context,snapshot)
               {
                 if(!snapshot.hasData)
                 {return Text('Loading');}
                 return Column(
                   children: <Widget>[
                     new ListTile(
                      title: new Text(snapshot.data.documents[0]['fname']),
                      leading: new IconButton(
                        icon: Icon(Icons.person), onPressed: () {  },
                      ),
                      ),
                   ],
                 );
               },
             ),
             //Text(),
              new ListTile(
              title: new Text('fizo'),
              leading: new IconButton(
                icon: Icon(Icons.person), onPressed: () {  },
              ),
              ),
              Divider(color: Colors.grey, height: 30.0,),
              //UsersList(),
            new ListTile(
              title: new Text("Take Attendance"), 
              leading: Icon(Icons.mode_edit),
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
              leading: Icon(Icons.playlist_add_check),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => AttendanceHistory(),
                ),);
              },

            ),
            new ListTile(
              title: new Text("Add Event"), 
              leading: Icon(Icons.add_a_photo),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => AddEvent(),
                ),);
              },
              
            ),
            new ListTile(
              title: new Text("Events"), 
              leading: Icon(Icons.calendar_today),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Events(),
                ),);
              },

            ),
            new ListTile(
              title: new Text("Calendar"), 
              leading: Icon(Icons.calendar_view_day),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Calendar(),
                ),);
              },
            
              
            ),
            new ListTile(
              title: new Text("Add Delegates"), 
              leading: Icon(Icons.add),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => AddDelegates(),
                ),);
              },

            ),
            new ListTile(
              title: new Text("Announcments"), 
              leading: Icon(Icons.notifications),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Announcments(),
                ),);
              },
            ),
            new ListTile(
              title: new Text("Settings"), 
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Settings(),
                ),);
              },
            ),
            new ListTile(
              title: new Text("Sign Out"), 
              leading: new IconButton(
                icon: Icon(Icons.settings),
                onPressed: ()async {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => Wrapper()));
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

