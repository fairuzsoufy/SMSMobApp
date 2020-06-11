//import 'dart:js';

import 'package:SMS/authenticate/forget_password.dart';
import 'package:SMS/authenticate/register.dart';
import 'package:SMS/pages/Dashboard.dart';
import 'package:SMS/services/auth.dart';
import 'package:SMS/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:SMS/shared/constants.dart';

class SignIn extends StatefulWidget {
  
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  //final DatabaseService dbRef = FirebaseDatabase.instance.reference().child("Users");
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  

  String email ='';
  String password='';
  String error = '';
  bool loading = false;
  bool _isHidden = true;

  void toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  String hintText = 'Password';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(40.0),
        alignment: Alignment.center, //centers the children
        child: SingleChildScrollView( //allows scrolling
          child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email',
                prefixIcon: Icon(Icons.email) ,),
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
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: hintText,
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(icon: Icon(Icons.visibility_off), onPressed: (){
                  toggleVisibility();
                  
                },
                
                )
                ),
                
                validator: (val) => val.length < 6 ? 'Minimum charchters are 6' : null,
                obscureText: hintText == 'Password' ? _isHidden : false,
                onChanged: (val){
                  setState(() => password=val);
                },
              ),
              SizedBox(height: 20.0,),
              
              ButtonTheme(
                minWidth: 325.0,
                height: 50.0,
                child: RaisedButton(
                color: Colors.red[400],
                child: Text('Sign In', style: TextStyle(color: Colors.white)),
                onPressed: () async{
                  if(_formKey.currentState.validate())
                  {
                    setState(() => loading = true);
                     //String currentuser = FirebaseAuth.getInstance().getUid();
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    print(result);
                    print('hamo');
                    //print(result);
                    if (result == null)
                    {
                      setState(() 
                      {
                        error = 'Credentials are wrong.';
                        loading=false;
                      }
                      , );
                    }
                    else
                    {
                      //Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) => new Dashboard(value: 'aloo')));
                    }
                  }
                  
                }
              ),
              ),
              SizedBox(height: 15.0,),
              Text(
                error, 
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              SizedBox(height: 15.0,),
              
              new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ForgetPassword(),
                ),);
              },
                child: Container(
                  child: Text('Forget Password?', style: TextStyle(color: Colors.white)),
                  
                ),
              ),
                InkWell(
                onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Register(),
                ),);
              },
                child: Container(
                  child: Text('New User?', style: TextStyle(color: Colors.white)),
                  
                  
                ),
                
              ),
              ]
            )
            ],

          ),
          ),
          
      
    ),
      
    ),);
  }

}


