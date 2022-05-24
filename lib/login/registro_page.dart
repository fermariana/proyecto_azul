import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:prueba/Hobbies.dart';
import 'package:prueba/config/page_conf.dart';
import 'package:prueba/login/azul.dart';
import 'package:prueba/login/register_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../simpleDialog/error_dialog.dart';
import '../simpleDialog/loadingDialog.dart';
import '../untils/mycolors.dart';

class RegistroPage extends StatefulWidget {
  RegistroPage({Key? key}) : super(key: key);

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController password2Controler = TextEditingController();
  TextEditingController generoControler = TextEditingController();
  TextEditingController fechaControler = TextEditingController();
  TextEditingController nameControler = TextEditingController();
  RegisterController con = new RegisterController();
  final fromKey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String userImageUri = '';
  File? imagen;
  final picker = ImagePicker();

  void initState() {
    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              contentPadding: EdgeInsets.all(0),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _selectImage(1);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 1,
                                                    color: MyColors
                                                        .primaryColor))),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              'Tomar foto',
                                              style: TextStyle(fontSize: 16),
                                            )),
                                            Icon(
                                              Icons.camera_alt,
                                              color: MyColors.azulColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _selectImage(2);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              'Seleccionar foto',
                                              style: TextStyle(fontSize: 16),
                                            )),
                                            Icon(
                                              Icons.photo_album,
                                              color: MyColors.azulColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            color: MyColors.primaryColor),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              'Cancelar',
                                              style: TextStyle(fontSize: 16),
                                              textAlign: TextAlign.center,
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: _image()),
                SizedBox(
                  height: 5.0,
                ),
                _nombreTextField(),
                SizedBox(
                  height: 10,
                ),
                _fechaTextField(),
                SizedBox(
                  height: 15,
                ),
                _generoTextField(),
                SizedBox(
                  height: 20,
                ),
                _correoTextField(),
                SizedBox(
                  height: 25,
                ),
                _contrasenaTextField(),
                SizedBox(
                  height: 30.0,
                ),
                _confcontrasenaTextField(),
                SizedBox(
                  height: 35.0,
                ),
                _buttonRegistrar(),
                SizedBox(
                  height: 45.0,
                ),
                _buttonLogin(),
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _selectImage(op) async {
    var pickedFile;
    if (op == 1) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        showDialog(
            context: context,
            builder: (c) {
              return const ErrorAlertDialog(
                message: "Selecciona una imagen de perfil",
              );
            });
      }
    });
    Navigator.of(context).pop();
  }

  Widget _nombreTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: nameControler,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Jazmin Nicolas',
            labelText: 'Nombre',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _fechaTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: fechaControler,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            icon: Icon(Icons.date_range),
            hintText: '12/12/2022',
            labelText: 'Fecha de nacimiento',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _generoTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: generoControler,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.supervised_user_circle),
            hintText: 'Hombre o Mujer',
            labelText: 'Genero',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _correoTextField() {
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

  Widget _confcontrasenaTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: password2Controler,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Confirmar Contraseña',
            labelText: 'Confirmar Contraseña',
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
          onPressed: con.goToNewAccont);
    });
  }

  Widget _buttonRegistrar() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Registrar',
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
          onPressed: () {
            verificarDatos();
          });
    });
  }

  Future<void> verificarDatos() async {
    if (imagen == null) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: "Selecciona una imagen de perfil",
            );
          });
    } else {
      passwordControler.text == password2Controler.text
          ? emailControler.text.isNotEmpty &&
                  passwordControler.text.isNotEmpty &&
                  password2Controler.text.isNotEmpty &&
                  nameControler.text.isNotEmpty &&
                  fechaControler.text.isNotEmpty
              ? uploadStatusImage()
              : displayDialog("Debes llenar todos los campos!")
          : displayDialog("Las contraseñas deben coincidir!");
    }
  }

  displayDialog(String msg) {
    showDialog(
        context: context,
        builder: (c) {
          return ErrorAlertDialog(
            message: msg,
          );
        });
  }

  late FirebaseFirestore db;

  uploadTo() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingAlertDialog(
            message: "Verificando tu cuenta...",
          );
        });
    User? firebaseUser;
    await _auth
        .createUserWithEmailAndPassword(
      email: emailControler.text.trim(),
      password: passwordControler.text.trim(),
    )
        .then((auth) {
      firebaseUser = auth.user;
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
      saveUserInformation(firebaseUser!).then((value) {
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (c) => Hobbies());
        Navigator.pushReplacement(context, route);
      });
    }
  }

  Widget _image() {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;
    return CircleAvatar(
      radius: _screenWidth * 0.15,
      backgroundColor: Colors.black,
      backgroundImage: imagen == null ? null : FileImage(imagen!),
      child: imagen == null
          ? CircleAvatar(
              backgroundImage:
                  const AssetImage('assets/images/user_profile.png'),
              radius: 60,
            )
          : CircleAvatar(
              backgroundImage: FileImage(imagen!),
              radius: 50,
              backgroundColor: Colors.grey[200],
            ),
    );
  }

  void uploadStatusImage() async {
    String imageFileName = DateTime.now().microsecondsSinceEpoch.toString();

    Reference storageReference =
        FirebaseStorage.instance.ref().child("Usuarios");
    //UploadTask uploadTask = storageReference.child(imageFileName.toString()+".jpg").putFile(imagen!);

    TaskSnapshot taskSnapshot = await storageReference
        .child(imageFileName.toString() + ".jpg")
        .putFile(imagen!);

    var ImageUri = await taskSnapshot.ref.getDownloadURL();
    userImageUri = await ImageUri.toString();
    print("Subir " + userImageUri);
    uploadTo();
  }

  saveUserInformation(User firebaseUser) async {
    FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set({
      'uid': firebaseUser.uid,
      'email': firebaseUser.email,
      'contraseña': passwordControler.text.trim(),
      'name': nameControler.text.trim(),
      'genero': generoControler.text.trim(),
      'fechana': fechaControler.text.trim(),
      "url": userImageUri
    });
    /* await Azul.sharedPreferences!.setString("uid", firebaseUser.uid);
    await Azul.sharedPreferences!
        .setString(Azul.userEmail, emailControler.text);
    await Azul.sharedPreferences!.setString(Azul.userName, nameControler.text);
    await Azul.sharedPreferences!.setString(Azul.userAvatarUrl, userImageUri);
  */
  }
}
