import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:kpop_youtube/screens/home_screen.dart';
import 'package:kpop_youtube/utils/ApiKey.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    FirebaseAdMob.instance.initialize(appId: ApiKey.appId);

    return MaterialApp(
      title: 'KPOPTUBE',
      theme: ThemeData(

        primarySwatch: Colors.red,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen()
    );
  }
}
