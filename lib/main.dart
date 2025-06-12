import 'package:flutter/material.dart';
import 'package:myapp/notes.dart';
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
    apiKey: "AIzaSyAUeZfZLOjyL5gy0_EciR-84A86TiSreHU", 
    appId: "1:601302489159:android:3a9ef512c9b437af9d7962", 
    messagingSenderId: "601302489159", 
    projectId:"act5productos")
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Note());
  }
}
