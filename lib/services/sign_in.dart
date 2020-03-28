import 'package:SMS/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sign in'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text('Sign In') ,
          onPressed: () async{
            dynamic result = await _auth.signInAnon();
            if ( result == null )
            {
              print ('error siging in');
            }
            else{
              print('signed in');
            }
            print(result);
          }
          ),
      
    ),
    );
  }
}