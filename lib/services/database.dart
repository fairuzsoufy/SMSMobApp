import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  // collection refrence
  final CollectionReference usersCollection = Firestore.instance.collection('users');

  Future updateUserData(String fname, String mname, String lname, String type, String faculty, String studentId) async{
    return await usersCollection.document(uid).setData({
      'fname': fname,
      'mname' : mname,
      'lname' : lname,
      'type' : type,
      'faculty' : faculty,
      'studentId' : studentId,
    });
  }

  Stream<QuerySnapshot> get users
  {
    return usersCollection.snapshots();
  }

  
}