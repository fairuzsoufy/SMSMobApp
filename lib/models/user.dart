import 'package:cloud_firestore/cloud_firestore.dart';

class User{

  final String uid;
  final String fname;
  final String mname;
  final String lname;
  final String type;
  
  User({this.uid, this.fname, this.mname, this.lname, this.type});


  Stream<User>  userdataaa (uid)
  {
    return Firestore.instance.collection('users').
    document(uid).snapshots().map(_userDataFromSnapshot);
  }

  User _userDataFromSnapshot(DocumentSnapshot snapshot)
  {
    return User(
      fname: snapshot.data['fname'],
      mname: snapshot.data['mname'],
      lname: snapshot.data['lname'], 
      type: snapshot.data['type'],
      uid: uid,
      //uid: uid,
    );
  }

}