import 'package:SMS/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create Firebase user object
  User _userFromFirebaseUser(FirebaseUser user)
  {
    return user != null ? User(uid:user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }
  //Sign In Ann
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

  //Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      FirebaseUser user = result.user;
      // create a new document for the user with the id
      //await DatabaseService(uid: user.uid).updateUserData('fairi','md','ln');
      return _userFromFirebaseUser(user);
    }
    catch (e){
      print(e.toString());
      return null;
    }
  }

  //Sign In with email and password
  Future signInWithEmailAndPassword(String email, String password) async
  {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch (e){
      print(e.toString());
      return null;
    }
  }



  //Reset Password
  Future sendPasswordResetEmail (String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  
  }

  // Sign Out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }
    catch(e){
      print (e.toString());
      return null;
    }
  }
}

