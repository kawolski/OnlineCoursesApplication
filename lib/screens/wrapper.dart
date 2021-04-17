import 'package:emt/models/user.dart';
import 'package:emt/screens/loggedOut/courseScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    if(user == null){
      return CourseScreen();
    }
    else{
      return Container(color: Colors.greenAccent,);
    }
  }
}

