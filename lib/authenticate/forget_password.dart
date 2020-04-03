import 'package:SMS/services/auth.dart';
import 'package:SMS/shared/constants.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String email ='';
  
  String error = '';
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Form(
          key: _formKey,
          child: Column(
          children: <Widget>[
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Email'),
              validator: (String value) {
                  if (value.isEmpty) {
                    return 'Email is Required';
                  }

                  if (!RegExp(
                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                      .hasMatch(value)) {
                    return 'Please enter a valid email Address';
                  }

                  return null;
                },
              onChanged: (val)
              {
                setState(() => email=val);
              },
            ),
            RaisedButton(
                color: Colors.pink[400],
                child: Text('Send Reset Email', style: TextStyle(color: Colors.white)),
                onPressed: () async{
                  
                  
                  if(_formKey.currentState.validate())
                  {
                    setState(() {
                    error = email.trim();
                    });
                    //setState(() => loading = true);
                    dynamic result = await _auth.sendPasswordResetEmail(email.trim());
                    
                    if (result == null)
                    {
                      setState(() {
                        error = 'you dont have an acc';
                        //loading = false;
                      });
                     
                    }
                  }
                  
                },
              ),
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