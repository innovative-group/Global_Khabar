import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';


import 'Screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  void initState(){

    super.initState();
    getLocation();
  }


  bool isturnedon= true;
  void getLocation()async {
    Location asdf = new Location();
    bool ison = await asdf.serviceEnabled();
    if (!ison) { //if defvice is off
      isturnedon = await asdf.requestService();
      if (isturnedon) {
        print("\n\n\n **************>> Location Info <<*************** \n");
        print("------------>> $widget.isturnedon \n\n");
        print("GPS device is turned ON");



        //widget.isturnedon= false;


      } else {
        print("\n\n\n **************>> Location Info <<*************** \n");
        print("------------>> $widget.isturnedon \n\n");
        print("GPS Device is still OFF");

      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home("us", "main"),
    );
  }
}
