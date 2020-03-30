import 'package:SMS/services/auth.dart';
import 'package:SMS/shared/constants.dart';
import 'package:SMS/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email ='';
  String password='';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text('sign in'),
      ),
      body: Container(
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
                obscureText: true, // covers the password
                onChanged: (val){
                  setState(() => password=val);

                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.pink[400],
                child: Text('Register', style: TextStyle(color: Colors.white)),
                onPressed: () async{
                  if(_formKey.currentState.validate())
                  {
                    setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(email.trim(), password.trim());
                    if (result == null)
                    {
                      setState(() {
                        error = 'you dont have an acc';
                        loading = false;
                      });
                     
                    }
                  }
                  
                },
              ),
              SizedBox(height: 20.02,),
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