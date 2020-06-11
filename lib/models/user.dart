import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User{

  final String uid;
  final String fname;
  final String mname;
  final String lname;
  final String type;
  
  User({this.uid, this.fname, this.mname, this.lname, this.type});

  getHamada()
  {
    return('kkekeke');
  }

  getUserFname(uid)
  {
    String fname;
    String x;
    Firestore.instance.collection("users").getDocuments().then((querySnapshot) 
    {
      querySnapshot.documents.forEach((result) 
      
      {
        if(result.documentID==uid)
        {
          fname= result.data['fname'].toString();
          //print('ham');
        }
      });
      
      print(fname);
      
      
    });
    //print('hamo '+x);
    fname='alo';
    return(fname);

   
}


  Future getHamo() 
  {
    Firestore.instance
        .collection('users')
        .document('8sp4gqGpvXN9fUHL36xqpt6vsjt2')
        .get()
        .then((DocumentSnapshot ds) {
         // print(ds.data['fname']);
          return ds.data;
      // use ds as a snapshot
    });
  }

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