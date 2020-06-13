
import 'package:SMS/models/user.dart';
import 'package:SMS/pages/AddDelegates.dart';
import 'package:SMS/pages/AddEvent.dart';
import 'package:SMS/pages/Announcments.dart';
import 'package:SMS/pages/AttendanceHistory.dart';
import 'package:SMS/pages/Calendar.dart';
import 'package:SMS/pages/Events.dart';
import 'package:SMS/pages/Profile.dart';
import 'package:SMS/pages/Settings.dart';
import 'package:SMS/pages/takeAttendance.dart';
import 'package:SMS/services/auth.dart';
import 'package:SMS/shared/loading.dart';
import 'package:SMS/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget 
{
    @override
  _DashboardState createState() => _DashboardState();
}
  
class _DashboardState extends State<Dashboard>{
  // FirebaseUser user;
  
  
  // Future <void> getUserData() async
  // {
  //   FirebaseUser userData = await FirebaseAuth.instance.currentUser();
  //   print(userData);
  //   setState(()
  //   {
  //     user=userData;
  //   });
  // }

  // @override
  // void initState(){
  //   super.initState();
  //   getUserData();
  // }

  final AuthService _auth = AuthService();
 


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<User>(
      stream: User().userdataaa(user.uid),
      builder: (context, snapshot)
      {
        if(snapshot.hasData)
        {
          User userData = snapshot.data;
          if(userData.type.toString()=='1')
          {
            return Scaffold(
            appBar: new AppBar(title: Text('home')),
            drawer: new Drawer(
              child: ListView(
                children: <Widget>[

                  new ListTile(
                    title: new Text(userData.fname), 
                    leading: Icon(Icons.person),
                    onTap: () 
                    {
                      Navigator.of(context).pop();
                      Navigator.push(context, new MaterialPageRoute( builder: (BuildContext context) => new Profile()));
                    },
                  ),

                  
                  new Text('uid: ${user.uid}'),
                  new Text('type:' + userData.type),
            
        
                  Divider(color: Colors.grey, height: 30.0,),
              
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
              leading: Icon(Icons.exit_to_app),
              onTap: () async {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Wrapper()));
                await _auth.signOut();
              },
            ),
                 
          ],
        ),
      ),
      
    );
          }
          else if(userData.type.toString()=='2')
          {
            return Scaffold(
            appBar: new AppBar(title: Text('home')),
            drawer: new Drawer(
              child: ListView(
                children: <Widget>[

                  

                  new ListTile(
                    title: new Text(userData.fname), 
                    leading: Icon(Icons.person),
                    onTap: () 
                    {
                      Navigator.of(context).pop();
                      Navigator.push(context, new MaterialPageRoute( builder: (BuildContext context) => new Profile()));
                    },
                  ),

                  
                  new Text('uid: ${user.uid}'),
                  new Text('type:' + userData.type),
            
        
                  Divider(color: Colors.grey, height: 30.0,),
              
               

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
              leading: Icon(Icons.exit_to_app),
              onTap: () async {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Wrapper()));
                await _auth.signOut();
              },
            ),
                 
          ],
        ),
      ),
      
    );
          }
          else
          {

          
          
          }
        }
        else
        {
          return Loading();
        }
      },
    );       
  }
}

