import 'package:SMS/services/auth.dart';
import 'package:SMS/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:SMS/shared/constants.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email ='';
  String password='';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Container(
        color: Colors.brown,
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val)
                {
                  setState(() => email=val);

                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6 ? 'Minimum charchters are 6' : null,
                obscureText: true,
                onChanged: (val){
                  setState(() => password=val);

                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.pink[400],
                child: Text('Sign In', style: TextStyle(color: Colors.white)),
                onPressed: () async{
                  if(_formKey.currentState.validate())
                  {
                    setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null)
                    {
                      setState(() 
                      {
                        error = 'Credentials are wrong.';
                        loading=false;
                      }
                      , );
                    }
                  }
                  
                }
              ),
              SizedBox(height: 20.0,),
              Text(
                error, 
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],

          ),
          ),
      
    ),
    );
  }
}