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
          ),
          //로그인 되면 이미지와 이름으로 바껴야함
          TextButton(
              onPressed: () => {Navigator.pushNamed(context, '/login')},
              child: Container(
                padding: EdgeInsets.all(24),
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 50,
                            color: Colors.grey.shade700,
                          ),
                          SizedBox(width: 20),
                          Text(
                            '로그인해주세요',
                            style: TextStyle(
                                fontSize: 24, color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: Colors.grey.shade700,
                      ),
                    ]),
              ))
        ]),
      ),
    );
  }
}
