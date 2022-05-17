import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dady/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

String userid = "";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyKidsLocation());
}
class MyKidsLocation extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: login(),
    );
  }
}
