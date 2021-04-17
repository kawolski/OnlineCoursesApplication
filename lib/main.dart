import 'package:emt/models/user.dart';
import 'package:emt/screens/wrapper.dart';
import 'package:emt/service/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.redAccent,
          buttonColor: Colors.red[50],
          primaryColorDark: Colors.black54,
          primaryColorLight: Colors.red[50],
          primaryColor: Colors.red,
          secondaryHeaderColor: Colors.amberAccent
        ),
        home: Wrapper(),
      ),
    );
  }
}

