import 'package:firebase_auth/firebase_auth.dart';

class Login {
  var name;
  var passwordController;
  var emailController;

  Login({this.name, this.emailController, this.passwordController}) {}

  Future<bool> toLogin() async {
    try {
      // 파이어베이스 유저 이름 변경

      // UserCredential result = await FirebaseAuth.instance
      //     .signInWithEmailAndPassword(
      //         email: emailController, password: passwordController);
      // User? user = result.user;
      // user?.updateDisplayName(name);

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController, password: passwordController);
      return true;
    } on FacebookAuthCredential catch (e) {
      print(e);
      return false;
    }
  }
}
