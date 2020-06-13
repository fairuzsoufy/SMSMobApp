import 'package:SMS/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  // collection refrence
  final CollectionReference usersCollection = Firestore.instance.collection('users');
  final CollectionReference eventsCollection = Firestore.instance.collection('events');

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

  Stream<List<Event>> getEvents(){
    return eventsCollection.snapshots().map(
      (snapshot) => snapshot.documents.map(
        (doc) => Event.fromMap(doc.data , doc.documentID),
      ).toList(),
    );
  }
   Future<void> addEvent(Event event){
     return eventsCollection.add(event.toMap());
   }
  Stream<QuerySnapshot> get users
  {
    return usersCollection.snapshots();
  }
  Stream<QuerySnapshot> get events
  {
    return eventsCollection.snapshots();
  }

  
}