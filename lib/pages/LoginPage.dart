import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      inputBox("아이디 또는 이메일"),
                      inputBox("비밀번호"),
                      TextButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(0))),
                          onPressed: () => {},
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
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            )),
                          )),
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () => {},
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
                      iconLoginBtn('페이스북으로 로그인', Icon(Icons.facebook)),
                      iconLoginBtn(
                          '송하로 로그인',
                          Icon(
                            Icons.settings,
                            color: Colors.blueGrey,
                          )),
                      iconLoginBtn(
                          'apple로 로그인',
                          Icon(
                            Icons.apple,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

Widget inputBox(String title) {
  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
            hintText: '${title}',
            hintStyle: TextStyle(color: Colors.grey.shade300),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300))),
        style: TextStyle(fontSize: 24),
      ),
      SizedBox(
        height: 50,
      )
    ],
  );
}

Widget iconLoginBtn(String text, Icon icon) {
  return TextButton(
    onPressed: () => {},
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
            style: TextStyle(color: Colors.black, fontSize: 14),
          )
        ])),
  );
}
