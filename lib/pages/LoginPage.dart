import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_nation_of_delivery/pages/MyPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController(text: 'test@gmail.com'); //입력되는 값을 제어
  final TextEditingController _passwordController =
      TextEditingController(text: '123456');

  Widget inputBox(String title, TextEditingController con) {
    return Column(
      children: [
        TextFormField(
          controller: con,
          decoration: InputDecoration(
              hintText: '${title}',
              hintStyle: TextStyle(color: Colors.grey.shade300),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300))),
          style: TextStyle(fontSize: 24),
          obscureText: (title == '비밀번호'),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }

  Widget iconLoginBtn(String text, Icon icon, functions) {
    // if (s == null) {
    //   print('s');
    // }
    return TextButton(
      onPressed: functions,
      child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(5)),
          width: double.infinity,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            icon,
            Text(
              ' $text',
              style: TextStyle(color: Colors.black, fontSize: 20),
            )
          ])),
    );
  }

  void checkLogin() {
    print(FirebaseAuth.instance.currentUser);
  }

  Widget selfLoginBtn() {
    _login() async {
      //키보드 숨기기
      // if (_formKey.currentState!.validate()) {
      //   FocusScope.of(context).requestFocus(FocusNode());
      try {
        var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
        await FirebaseAuth.instance.setPersistence(Persistence.NONE);
        checkLogin();
      } on FirebaseAuthException catch (e) {
        print(e);
        print(e.code);
        String message = e.code;

        if (e.code == 'user-not-found') {
          message = '사용자가 존재하지 않습니다.';
        } else if (e.code == 'wrong-password') {
          message = '비밀번호를 확인하세요';
        } else if (e.code == 'invalid-email') {
          message = '이메일을 확인하세요.';
        }

        /*final snackBar = SnackBar(
          content: Text(message),
          backgroundColor: Colors.deepOrange,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      */

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
            ),
            backgroundColor: Colors.deepOrange,
          ),
        );
      }
      // Firebase 사용자 인증, 사용자 등록
    }

    return TextButton(
        style:
            ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(0))),
        onPressed: () => _login(),
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Colors.cyan.shade600),
          child: Center(
              child: Text(
            '로그인',
            style: TextStyle(fontSize: 30, color: Colors.white),
          )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      alignment: Alignment(-1.0, 0.0),
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => {Navigator.pop(context)},
                      )),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      padding: EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              inputBox("아이디 또는 이메일", _emailController),
                              inputBox("비밀번호", _passwordController),
                              selfLoginBtn(),
                              Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(20),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () => checkLogin(),
                                          child: Text(
                                            '아이디 찾기',
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.grey.shade600),
                                          ),
                                        ),
                                        Text('  |  ',
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.grey.shade600)),
                                        TextButton(
                                          onPressed: () => {},
                                          child: Text('비밀번호 찾기',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.grey.shade600)),
                                        )
                                      ]))
                            ],
                          ),
                          Column(
                            children: [
                              // TextButton(onPressed: () => {}, child: Container()),
                              iconLoginBtn(
                                  '페이스북으로 로그인', Icon(Icons.facebook), test),
                              // iconLoginBtn(
                              //     '송하로 로그인',
                              //     Icon(
                              //       Icons.settings,
                              //       color: Colors.blueGrey,
                              //     ),
                              //     {checkLogin()}),
                              // iconLoginBtn(
                              //     'apple로 로그인',
                              //     Icon(
                              //       Icons.apple,
                              //       color: Colors.black,
                              //     ),
                              //     {}),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            );
          }
          print(FirebaseAuth.instance.currentUser);
          Navigator.pop(context);
          return new MyPage();
        });
  }
}

void test() {
  print('test');
}
