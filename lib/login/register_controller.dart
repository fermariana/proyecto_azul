import 'package:flutter/material.dart';

class RegisterController {
  BuildContext? context;
  final fromKey = GlobalKey<FormState>();

  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController generoControler = TextEditingController();
  TextEditingController fechaControler = TextEditingController();
  TextEditingController nameControler = TextEditingController();

  Future? init(BuildContext context) {
    this.context = context;
  }

  void goToNewAccont() {
    Navigator.pushNamed(context!, 'login');
  }
}
