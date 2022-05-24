import 'package:flutter/material.dart';

class ConfControler {
  String name = 'Vianey Garcia Espinoza';
  String email = 'vg054080@gmail.com';
  String password = 'Ray91194';
  String date = '16/06/2000';
  String imagen =
      'https://vignette.wikia.nocookie.net/bokunoheroacademia/images/8/81/Deku_headshot.png/revision/latest?cb=20180728023050';

  BuildContext? context;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController naciController = TextEditingController();
  TextEditingController pppController = TextEditingController();

  Future? init(BuildContext context) {
    nameController.text = name;
    emailController.text = email;
    passwordController.text = password;
    naciController.text = date;
    this.context = context;
  }

  String getImagen() {
    return imagen;
  }

  void nameEditing() {
    name = nameController.text.trim();
  }

  void emailEditing() {
    email = emailController.text.trim();
  }

  void passwordEditing() {
    password = passwordController.text.trim();
  }

  void dateEditing() {
    date = naciController.text.trim();
  }

  String getName() {
    return name;
  }
}
