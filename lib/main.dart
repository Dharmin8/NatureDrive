import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nature_drive/mapping.dart';
import 'package:nature_drive/view_home.dart';
import 'authentication.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
    } catch(e) {
      debugPrint(e.toString());
    }
  }
  @override
  void initState(){
    initializeFlutterFire();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Nature Drive",
      theme: new ThemeData(

        fontFamily: 'Raleway',
        primaryColor: Colors.green,
        accentColor: new Color(0xffffffff),
      ),
      home:
      Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
