import 'package:cloud_firestore/cloud_firestore.dart';

class Event{

  String name,id;
  int delegates;
  Event({this.name ,  this.delegates,this.id});
  
  Event.fromMap(Map<String,dynamic> data, String id):
      name=data['name'],
      delegates = data['delegates'],
      id = id;

  Map<String, dynamic> toMap()
  {
    return{
      "name": name,
      "delegates": 0,
    };
  }
}