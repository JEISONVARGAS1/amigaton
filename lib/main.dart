import 'package:amigaton/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDB5wvF_fR9Pdp0qeUtopBVB5XVBlOmyVo",
        authDomain: "amigaton-f4e24.firebaseapp.com",
        projectId: "amigaton-f4e24",
        storageBucket: "amigaton-f4e24.appspot.com",
        messagingSenderId: "252401299548",
        appId: "1:252401299548:web:123896fe5454fc2c127699",
        measurementId: "G-YE385DLTZG"),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
