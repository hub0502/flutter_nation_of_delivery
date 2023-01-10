import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/appbarsDesign.dart';

class UserInfoModifyPage extends StatefulWidget {
  const UserInfoModifyPage({super.key});

  @override
  State<UserInfoModifyPage> createState() => _UserInfoModifyPageState();
}

class _UserInfoModifyPageState extends State<UserInfoModifyPage> {
  TextEditingController _nameCon = TextEditingController(text: '이도현');
  TextEditingController _prePassword = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  bool activeChange = false;

  void _clearTextField() {
    // Clear everything in the text field
    _nameCon.clear();
    // Call setState to update the UI
    setState(() {});
  }

  Widget passwordChangeButton() {
    return Container(
      alignment: Alignment(1, 0),
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0))),
              fixedSize: MaterialStateProperty.all(Size(120, 50)),
              backgroundColor: MaterialStateProperty.all(Colors.grey.shade400)),
          onPressed: () {
            activeChange = !activeChange;
            if (!activeChange) {
              _newPassword.clear();
              _prePassword.clear();
            }
            setState(() {});
          },
          child: Text(
            activeChange ? '취소' : '변경',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          )),
    );
  }

  Widget passwordCheck(String text, _controller) {
    return Column(children: [
      Row(
        children: [
          Container(
            width: 150,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ),
          Expanded(
              child: TextField(
            enabled: activeChange,
            maxLength: 20,
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide.none),
              hintText: text == '신규 비밀번호' ? '10-20자 이내' : '',
              filled: true,
              fillColor: Colors.grey.shade300,
            ),
            style: TextStyle(fontSize: 20),
            controller: _controller,
            obscureText: true,
          ))
        ],
      ),
      SizedBox(
        height: 20,
      )
    ]);
  }

  Widget userProfile() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Icon(
        Icons.account_circle_outlined,
        size: 70,
      ),
      Text('고마운분'),
      Container(
        width: 300,
        margin: EdgeInsets.all(20),
        child: TextField(
          cursorColor: Colors.black,
          onChanged: (value) {
            // Call setState to update the UI
            setState(() {});
          },
          controller: _nameCon,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              suffixIcon: _nameCon.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: () => {_clearTextField},
                      icon: Icon(
                        Icons.clear_outlined,
                        color: Colors.grey.shade600,
                      ))),
        ),
      )
    ]);
  }

  Widget modifyInfo() {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    '이메일',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                ),
                Text(
                  '@ ',
                  style: TextStyle(color: Colors.purpleAccent, fontSize: 20),
                ),
                Expanded(
                    child: Text(
                  '${FirebaseAuth.instance.currentUser?.email.toString()}',
                  style: TextStyle(fontSize: 20),
                ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            passwordCheck('현재 비밀번호', _prePassword),
            passwordCheck('신규 비밀번호', _newPassword),
            passwordChangeButton()
          ],
        ));
  }

  Widget containerMargin() {
    return Container(
      height: 20,
      color: Colors.grey.shade200,
    );
  }

  Widget userState() {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Text('로그아웃',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ))),
            Text('  |  ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
            Text('회원탈퇴',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ))
          ],
        ));
  }

  ScaffoldFeatureController errorBar(message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }

  Future<bool> currentPasswordCheck() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: FirebaseAuth.instance.currentUser!.email.toString(),
          password: _prePassword.text);
    } catch (e) {
      print(e);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                appBar: MainAppbarDesign(
                  titleCenter: true,
                  titleText: '내 정보 수정',
                  actionButtons: [
                    TextButton(
                        onPressed: () async {
                          String message = '';
                          if (activeChange) {
                            if (_newPassword.text.length < 10) {
                              errorBar('10자 이상 써주세요');
                            } else if (await currentPasswordCheck()) {
                              errorBar('비밀번호가 올바르지 않습니다.');
                            } else {
                              User? user = FirebaseAuth.instance.currentUser;
                              user?.updatePassword(_newPassword.text);
                            }
                          } else {}
                        },
                        child: Text(
                          '저장',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ))
                  ],
                ),
                body: SingleChildScrollView(
                    child: Container(
                  child: Column(
                    children: [
                      userProfile(),
                      containerMargin(),
                      modifyInfo(),
                      containerMargin(),
                      userState()
                    ],
                  ),
                )));
          }
          return Scaffold(
              appBar: MainAppbarDesign(
                  titleCenter: true,
                  titleText: 'not access',
                  actionButtons: []),
              body: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Column(children: [
                          Text(
                            '로그인 시 이용하실 수 있는 서비스입니다.',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '로그인 후 다시 이용해주세요.',
                            style: TextStyle(fontSize: 20),
                          )
                        ]),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ))

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Padding(
              //       padding: const EdgeInsets.all(30.0),
              //       child: SizedBox(
              //         height: 60,
              //         width: 200,
              //         child: ElevatedButton.icon(
              //           onPressed: () {},
              //           style: ButtonStyle(
              //             backgroundColor:
              //                 MaterialStateProperty.all(Colors.red.shade800),
              //           ),
              //           icon: Icon(Icons.person_add_alt_1_rounded, size: 18),
              //           label: Text("Register Users"),
              //         ),
              //       ),
              //     ),
              //   ],
              // )
              );
        });
  }
}
