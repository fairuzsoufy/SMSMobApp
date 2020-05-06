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
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(40.0),
        alignment: Alignment.center, 
        child: SingleChildScrollView( 

        child: Form(
          key: _formKey,
          child: Column(
          children: <Widget>[

            SizedBox(
                width: 250.0,
                height: 250.0,
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 155.0,
                height: 125.0,
                  fit: BoxFit.cover
                ),
              ),
              SizedBox(height: 60.0,),
              Text('Reset Password', style: TextStyle(color: Colors.white, fontSize: 16.0)),

              SizedBox(height: 30.0,),
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
            SizedBox(height: 20.0,),
            Text(
                error, 
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            SizedBox(height: 20.0,),
            ButtonTheme(
                minWidth: 325.0,
                height: 50.0,
                child: RaisedButton(
                color: Colors.red[400],
                child: Text('Send password reset email', style: TextStyle(color: Colors.white)),
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
                }
              ),
              ),
              
          
              
            ],

        ),
        
              
        
      ),
      ),
      
      ),
    );
  }
}