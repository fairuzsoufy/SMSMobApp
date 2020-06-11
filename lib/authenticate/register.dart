
import 'package:SMS/authenticate/sign_in.dart';
import 'package:SMS/services/auth.dart';
import 'package:SMS/shared/constants.dart';
import 'package:SMS/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email ='';
  String password='';
  String fname = '';
  String mname;
  String lname;
  String type;
  String faculty;
  String studentId;
  String error = '';
  bool loading = false;
  //String selectedUser;
  String hintText = 'Password';
  
  bool _isHidden = true;

  void toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Container(
        //color: Colors.black,
        padding: EdgeInsets.all(40.0),
        alignment: Alignment.center, //centers the children
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
              SizedBox(height: 20.0,),

              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'First Name'),
                validator: (val) => val.isEmpty ? 'Enter first name' : null,
                onChanged: (val)
                {
                  setState(() => fname=val);

                },

                
              ),

              
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Middle Name'),
                validator: (val) => val.isEmpty ? 'Enter middle name' : null,
                onChanged: (val)
                {
                  setState(() => mname=val);
                },
              ),

              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Last Name'),
                validator: (val) => val.isEmpty ? 'Enter last name' : null,
                onChanged: (val)
                {
                  setState(() => lname=val);
                },
              ),

              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Student ID'),
                validator: (val) => val.isEmpty ? 'Enter Student ID' : null,
                onChanged: (val)
                {
                  setState(() => studentId=val);
                },
              ),

              DropdownButton<String>(
                hint: new Text("Select a user"),
                value: type,
                onChanged: (String newValue) 
                {
                  setState(() {
                  type = newValue;
                  //error = selectedUser;
                  });
                },
                items: [
                  DropdownMenuItem(value: '1', child: Text('Delegate or Student')),
                  DropdownMenuItem(value: '2', child: Text('Member')),
                ],
           
              ),

              DropdownButton<String>(
                hint: new Text("Select faculty"),
                value: faculty,
                onChanged: (String newValue) 
                {
                  setState(() {
                  faculty = newValue;
                  //error = selectedUser;
                  });
                },
                items: [
                  DropdownMenuItem(value: 'Alsun', child: Text('Alsun')),
                  DropdownMenuItem(value: 'Architecture', child: Text('Architecture')),
                  DropdownMenuItem(value: 'Business', child: Text('Business')),
                  DropdownMenuItem(value: 'Computer Sience', child: Text('Computer Science')),
                  DropdownMenuItem(value: 'Dental Medicine', child: Text('Dental Medicine')),
                  DropdownMenuItem(value: 'Electronics', child: Text('Electronics')),
                  DropdownMenuItem(value: 'Mass Communication', child: Text('Mass Communication')),
                  DropdownMenuItem(value: 'Pharmacy', child: Text('Pharmacy')),
                  
                ],
           
              ),

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
                decoration: textInputDecoration.copyWith(hintText: hintText,
                
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
              RaisedButton(
                color: Colors.pink[400],
                child: Text('Register', style: TextStyle(color: Colors.white)),
                onPressed: () async{
                  if(_formKey.currentState.validate())
                  {
                    setState(() => loading = true);
                    
                    dynamic result = await _auth.registerWithEmailAndPassword(email.trim(), password.trim(), fname, mname, lname, type, faculty, studentId);
                    if (result == null)
                    {
                      setState(() {
                        error = 'yoru dont have an acc';
                        loading = false;
                      });
                     
                    }
                    else
                    {
                      
                      Navigator.of(context).pop();
                      
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) => new SignIn()));
                              
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
      ),
    );
  }
}