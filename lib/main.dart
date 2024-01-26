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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: appname,
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: LoginScreen(),
    );
  }
}
