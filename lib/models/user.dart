import 'package:cloud_firestore/cloud_firestore.dart';

class User{

  final String uid;
  final String lname;
  final String fname;
  final String type;
  
  User({this.uid, this.fname, this.lname, this.type});


  getUserFname()
  {
    return Firestore.instance.collection('users').snapshots();
  }


  
}