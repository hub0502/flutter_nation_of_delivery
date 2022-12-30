import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Widget statefulButton(String routeName, text) {
    return TextButton(
        onPressed: () => {Navigator.pushNamed(context, routeName)},
        child: Container(
          padding: EdgeInsets.all(24),
          width: double.infinity,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 50,
                  color: Colors.grey.shade700,
                ),
                SizedBox(width: 20),
                Text(
                  text,
                  style: TextStyle(fontSize: 24, color: Colors.grey.shade700),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              size: 24,
              color: Colors.grey.shade700,
            ),
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'My배민',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home_filled),
            onPressed: () => {Navigator.pop(context)},
          )
        ],
        backgroundColor: Colors.black.withOpacity(0),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            '/images/mypage.png',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          //로그인 되면 이미지와 이름으로 바껴야함

          StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return statefulButton('/login', '로그인해주세요');
                }
                return statefulButton('/mypage/modify', '반갑습니다');
              })
        ]),
      ),
    );
  }
}
