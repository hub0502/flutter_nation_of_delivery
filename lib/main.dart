import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nation_of_delivery/pages/HomePage.dart';
import 'package:flutter_nation_of_delivery/pages/WidgetPage.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {'/': (context) => Home(), '/widgets': (context) => widgets()},
        initialRoute: '/');
  }
}
