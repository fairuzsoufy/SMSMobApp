import 'package:SMS/models/user.dart';
import 'package:SMS/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Profile extends StatefulWidget {
  
  @override
  
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final _formKey = GlobalKey<FormState>();
  
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
            return Scaffold(
            appBar: new AppBar(title: Text('Profile')),
            body: Container(
        //color: Colors.black,
        padding: EdgeInsets.all(40.0),
        alignment: Alignment.center, //centers the children
        child: SingleChildScrollView( //allows scrolling
          child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              QrImage(data: user.uid,size: 200,gapless: false,),
              
              SizedBox(height: 60.0,),
              Text('Full Name: ' + userData.fname + ' ' + userData.mname + ' ' + userData.lname,),
              Text('Student ID: ' + userData.studentId ),
              Text('Faculty: ' + userData.faculty ),
              
              SizedBox(height: 20.0,),
              
              RaisedButton(
                color: Colors.pink[400],
                child: Text('Edit Information', style: TextStyle(color: Colors.white)),
                onPressed: () async{
                  
                },
              ),
              
            ],

          ),
          ),
          
      
    ),
      
    ),
            );
            
        }
      
      }
      ); 
      
  
  }
}