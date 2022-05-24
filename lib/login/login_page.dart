import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:prueba/config/page_conf.dart';
import 'package:prueba/login/azul.dart';
import 'package:prueba/login/login_controller.dart';
import 'package:prueba/login/registro_page.dart';
import 'package:prueba/src/pages/tabs_page.dart';

import '../simpleDialog/error_dialog.dart';
import '../simpleDialog/loadingDialog.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController con = new LoginController();
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  @override
  void initState() {
    con.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset("assets/images/usuario1.png", height: 200.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              _userTextField(),
              SizedBox(
                height: 15.0,
              ),
              _contrasenaTextField(),
              SizedBox(
                height: 20.0,
              ),
              _buttonLogin(),
              SizedBox(
                height: 30.0,
              ),
              __textHaveAccount(),
              SizedBox(
                height: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: emailControler,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electronico',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _contrasenaTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: passwordControler,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Contraseña',
            labelText: 'Contraseña',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _buttonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Iniciar Sesión',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10.0,
          color: Color.fromARGB(255, 137, 166, 245),
          onPressed: verificarDatos);
    });
  }

  Future<void> verificarDatos() async {
    emailControler.text.isNotEmpty && passwordControler.text.isNotEmpty
        ? loginUser()
        : showDialog(
            context: context,
            builder: (c) {
              return ErrorAlertDialog(
                message: "Debes llenar todos los campos!",
              );
            });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  void loginUser() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingAlertDialog(
            message: "Verificando tu cuenta...",
          );
        });
    User? firebaseUser;
    await _auth
        .signInWithEmailAndPassword(
      email: emailControler.text.trim(),
      password: passwordControler.text.trim(),
    )
        .then((authUser) {
      firebaseUser = authUser.user;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: error.message.toString(),
            );
          });
    });
    if (firebaseUser != null) {
      readData(firebaseUser!).then((s) {
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (c) => TabsPage());
        Navigator.pushReplacement(context, route);
      });
    }
  }

  Future readData(User firebaseUser) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .get()
        .then((dataSnapshot) async {
      await Azul.sharedPreferences!
          .setString("uid", dataSnapshot.data()![Azul.userUID]);
      await Azul.sharedPreferences!
          .setString(Azul.userEmail, dataSnapshot.data()![Azul.userEmail]);
      await Azul.sharedPreferences!
          .setString(Azul.userName, dataSnapshot.data()![Azul.userName]);
      await Azul.sharedPreferences!.setString(
          Azul.userAvatarUrl, dataSnapshot.data()![Azul.userAvatarUrl]);
    });
  }

  Widget __textHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No tienes una cuenta', style: TextStyle(color: Colors.black)),
        const SizedBox(
          width: 25,
        ),
        GestureDetector(
          onTap: con.goToNewAccont,
          child: Text('Registrate', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
