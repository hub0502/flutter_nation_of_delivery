import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

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
          )
        ]),
      ),
    );
  }
}
