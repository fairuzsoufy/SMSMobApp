import 'package:SMS/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create Firebase user object
  User _userFromFirebaseUser(FirebaseUser user)
  {
    return user != null ? User(uid:user.uid) : null;
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

}