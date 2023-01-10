import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_nation_of_delivery/pages/MyPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserCreatePage extends StatelessWidget {
  const UserCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController =
        TextEditingController(text: 'test@gmail.com'); //입력되는 값을 제어
    TextEditingController _passwordController =
        TextEditingController(text: '123456');
    TextEditingController _nameController =
        TextEditingController(text: 'leedo');

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

    Widget regBtn() {
      // Firebase 사용자 인증, 사용자 등록
      createUser() {
        FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        FirebaseFirestore.instance.collection('users').add({
          'email': _emailController.text,
          'name': _nameController.text,
        });
      }

      checkExistUser() async {
        bool exist = false;
        await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: _emailController.text)
            .get()
            .then((QuerySnapshot querySnapshot) =>
                querySnapshot.docs.forEach((doc) {
                  exist = true;
                  print('exist');
                }));

        if (exist) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: SizedBox(
                  height: 50,
                  child: Center(
                      child: Text(
                    'exist',
                    style: TextStyle(fontSize: 40),
                  ))),
              backgroundColor: Colors.deepOrange,
            ),
          );
        } else {
          createUser();
        }
      }

      return TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.all(0))),
          onPressed: () {
            checkExistUser();
          },
          child: Container(
            width: double.infinity,
            height: 70,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.cyan.shade600),
            child: Center(
                child: Text(
              '회원가입',
              style: TextStyle(fontSize: 30, color: Colors.white),
            )),
          ));
    }

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
                              inputBox("이름", _nameController),
                              inputBox("아이디 또는 이메일", _emailController),
                              inputBox("비밀번호", _passwordController),
                              regBtn(),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            );
          }
          print(FirebaseAuth.instance.currentUser!);
          Navigator.pop(context);
          return new MyPage();
        });
  }
}

// class UserCreatePage extends StatefulWidget {
//   const UserCreatePage({super.key});

//   @override
//   State<UserCreatePage> createState() => _UserCreatePageState();
// }

// class _UserCreatePageState extends State<UserCreatePage> {
//   // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController =
//       TextEditingController(text: 'test@gmail.com'); //입력되는 값을 제어
//   final TextEditingController _passwordController =
//       TextEditingController(text: '123456');
//   TextEditingController _nameController = TextEditingController(text: 'leedo');

//   Widget inputBox(String title, TextEditingController con) {
//     return Column(
//       children: [
//         TextFormField(
//           controller: con,
//           decoration: InputDecoration(
//               hintText: '${title}',
//               hintStyle: TextStyle(color: Colors.grey.shade300),
//               enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey.shade300))),
//           style: TextStyle(fontSize: 24),
//           obscureText: (title == '비밀번호'),
//         ),
//         SizedBox(
//           height: 50,
//         )
//       ],
//     );
//   }

//   Widget iconLoginBtn(String text, Icon icon, functions) {
//     return TextButton(
//       onPressed: functions,
//       child: Container(
//           padding: EdgeInsets.all(10),
//           margin: EdgeInsets.only(bottom: 10),
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey.shade300),
//               borderRadius: BorderRadius.circular(5)),
//           width: double.infinity,
//           child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             icon,
//             Text(
//               ' $text',
//               style: TextStyle(color: Colors.black, fontSize: 20),
//             )
//           ])),
//     );
//   }

//   Widget regBtn() {
//     // Firebase 사용자 인증, 사용자 등록
//     createUser() {
//       FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );
//       FirebaseFirestore.instance.collection('users').add({
//         'email': _emailController.text,
//         'name': _nameController.text,
//       });
//     }

//     checkExistUser() async {
//       bool exist = false;
//       await FirebaseFirestore.instance
//           .collection('users')
//           .where('email', isEqualTo: _emailController.text)
//           .get()
//           .then((QuerySnapshot querySnapshot) =>
//               querySnapshot.docs.forEach((doc) {
//                 exist = true;
//                 print('exist');
//               }));

//       if (exist) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('exist'),
//             backgroundColor: Colors.deepOrange,
//           ),
//         );
//       } else {
//         createUser();
//       }
//     }

//     return TextButton(
//         style:
//             ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(0))),
//         onPressed: () {
//           checkExistUser();
//         },
//         child: Container(
//           width: double.infinity,
//           height: 70,
//           decoration: ShapeDecoration(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5)),
//               color: Colors.cyan.shade600),
//           child: Center(
//               child: Text(
//             '회원가입',
//             style: TextStyle(fontSize: 30, color: Colors.white),
//           )),
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Scaffold(
//               body: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                       padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
//                       alignment: Alignment(-1.0, 0.0),
//                       child: IconButton(
//                         icon: Icon(Icons.close),
//                         onPressed: () => {Navigator.pop(context)},
//                       )),
//                   Container(
//                       height: MediaQuery.of(context).size.height * 0.9,
//                       padding: EdgeInsets.all(40),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             children: [
//                               inputBox("이름", _nameController),
//                               inputBox("아이디 또는 이메일", _emailController),
//                               inputBox("비밀번호", _passwordController),
//                               regBtn(),
//                             ],
//                           ),
//                         ],
//                       )),
//                 ],
//               ),
//             );
//           }
//           print(FirebaseAuth.instance.currentUser!);
//           Navigator.pop(context);
//           return new MyPage();
//         });
//   }
// }

// void test() {
//   print('test');
// }
