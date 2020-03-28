
import 'package:SMS/pages/Dashboard.dart';
import 'package:SMS/services/sign_in.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //return either dashboard or auth
    return Dashboard();

    //ana lesa shaghala fel auth fa elmadroud ye return SignIn();
  }
}