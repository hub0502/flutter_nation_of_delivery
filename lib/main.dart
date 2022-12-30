import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nation_of_delivery/pages/HomePage.dart';
import 'package:flutter_nation_of_delivery/pages/LoginPage.dart';
import 'package:flutter_nation_of_delivery/pages/MyPage.dart';
import 'package:flutter_nation_of_delivery/pages/ShopsPage.dart';
import 'package:flutter_nation_of_delivery/pages/UserCreatePage.dart';
import 'package:flutter_nation_of_delivery/pages/UserInfoModifyPage.dart';
import 'package:flutter_nation_of_delivery/pages/WidgetPage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//...

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => Home(),
      '/widgets': (context) => Widgets(),
      '/shops': (context) => ShopsPage(),
      '/mypage': (context) => MyPage(),
      '/login': (context) => LoginPage(),
      '/mypage/modify': (context) => UserInfoModifyPage(),
      '/createUser': (context) => UserCreatePage()
    }, initialRoute: '/');
  }
}
