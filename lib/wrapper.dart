import 'package:SMS/authenticate/sign_in.dart';
import 'package:SMS/models/user.dart';
import 'package:SMS/pages/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    
    final user = Provider.of<User>(context);
    if(user==null)
    {
      return SignIn();
    }
    else
    {
      return Dashboard();
    }

  }
}