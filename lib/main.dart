import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar_seller/const/const.dart';

import 'views/auth_screen/login_screen.dart';
import 'views/home_screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDhv5E9Go1ZlCiRziPfb73wWUnsScKjTZI",
      appId: "1:114827691684:android:df2f8af97a13a11b878831",
      messagingSenderId: "114827691684",
      projectId: "online-bazar-b5ca8",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  var isLoggedin = false;
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  checkUser() async {
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        isLoggedin = false;
      } else {
        isLoggedin = true;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appname,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent, elevation: 0)),
      home: isLoggedin ? const HomeScreen() : const LoginScreen(),
    );
  }
}
