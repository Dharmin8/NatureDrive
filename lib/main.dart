
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nature_drive/app_home.dart';
import 'package:nature_drive/authentication.dart';
import 'package:nature_drive/mapview.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      debugPrint(e.toString());
      setState(() {
        _initialized = false;
      });
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
      getHome(),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget getHome(){
    if(!_initialized){
      return Dialog(
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new CircularProgressIndicator(),
            new Text("Loading"),
          ],
        ),
      );
    }
    else{
      return AppHome(auth: Auth(), onSignedOut: (){});
    }
  }
}
