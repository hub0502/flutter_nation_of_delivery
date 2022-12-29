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

  void _clearTextField() {
    // Clear everything in the text field
    _nameCon.clear();
    // Call setState to update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppbarDesign(
          titleCenter: true,
          titleText: '내 정보 수정',
          actionButtons: [
            TextButton(
                onPressed: () => {},
                child: Text(
                  '저장',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.account_circle_outlined),
                      Text('고마운분'),
                      SizedBox(
                        width: 300,
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
                    ],
                  )
                ],
              )),
        ));
  }
}
