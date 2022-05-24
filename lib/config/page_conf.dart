import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:prueba/config/conf_controler.dart';
import 'package:prueba/simpleDialog/error_dialog.dart';
import 'package:prueba/untils/mycolors.dart';
import 'package:prueba/untils/wid_diseno.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PageConfig extends StatefulWidget {
  const PageConfig({Key? key}) : super(key: key);

  @override
  State<PageConfig> createState() => _PageConfigState();
}

class _PageConfigState extends State<PageConfig> {
  ConfControler conf = new ConfControler();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      conf.init(context);
    });
  }

  String userImageUri = '';
  File? imagen;
  final picker = ImagePicker();
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        WidDiseno(),
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 100.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                _image(),
                const SizedBox(
                  width: 20,
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
                                                  color:
                                                      MyColors.primaryColor))),
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
                  child: const Text('Cambiar foto de perfil',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ]),
              const SizedBox(
                height: 20.0,
              ),
              _textName(),
              const SizedBox(
                height: 20.0,
              ),
              _textEmail(),
              const SizedBox(
                height: 20.0,
              ),
              _textEdad(),
              const SizedBox(
                height: 20.0,
              ),
              _cambiarPassword(),
              const SizedBox(
                height: 100.0,
              ),
              _guardarCambios(),
              const SizedBox(
                height: 20.0,
              ),
              _closeSesion()
            ],
          ),
        )
      ],
    ));
  }

  Widget _image() {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;
    return CircleAvatar(
      radius: _screenWidth * 0.10,
      backgroundColor: Colors.white12,
      backgroundImage: imagen == null ? null : FileImage(imagen!),
      child: imagen == null
          ? CircleAvatar(
              backgroundImage: NetworkImage(conf.getImagen()),
              radius: 50,
              backgroundColor: Colors.grey[200],
            )
          : CircleAvatar(
              backgroundImage: FileImage(imagen!),
              radius: 50,
              backgroundColor: Colors.grey[200],
            ),
    );
  }

  /*Abrir galeria local y seleccionar imagen de usuario*/
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

  Widget _closeSesion() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.login_outlined,
              color: Color.fromARGB(255, 137, 166, 245),
              size: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              //onTap: (),
              child: const Text('Cerrar sesión',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ));
  }

  Widget _guardarCambios() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Color.fromARGB(255, 137, 166, 245),
              size: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              //onTap: (),
              child: const Text('Guardar Cambios',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ));
  }

  Widget _textName() {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: InkWell(
          child: TextField(
            style: TextStyle(color: Colors.white),
            controller: conf.nameController,
            decoration: InputDecoration(
              enabled: false,
              hintText: 'Nombre',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              prefixIcon: Icon(
                Icons.person,
                color: MyColors.primaryColor,
              ),
            ),
          ),
          onTap: () {
            _dialognName();
          },
        ));
  }

  void _dialogEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Ingrese nuevo email'),
            content: TextField(
              controller: conf.emailController,
              decoration: const InputDecoration(
                  hintText: 'Correo Electronico',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blueGrey,
                  )),
              keyboardType: TextInputType.emailAddress,
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Cerrar')),
              TextButton(
                onPressed: () {
                  conf.emailEditing;
                  _dismissDialog();
                },
                child: Text('Hecho'),
              )
            ],
          );
        });
  }

  void _dialognName() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Ingrese Nombre'),
            content: TextField(
              controller: conf.nameController,
              decoration: const InputDecoration(
                  hintText: 'Correo Electronico',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                  )),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Cerrar')),
              TextButton(
                onPressed: () {
                  conf.nameEditing;
                  _dismissDialog();
                },
                child: Text('Hecho'),
              )
            ],
          );
        });
  }

  void _dialognPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Ingrese Nueva contraseña'),
            content: TextField(
              controller: conf.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blueGrey,
                  )),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Cerrar')),
              TextButton(
                onPressed: () {
                  conf.passwordEditing;
                  _dismissDialog();
                },
                child: Text('Hecho'),
              )
            ],
          );
        });
  }

  void _dialognDate() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Ingrese Fecha de Nacimiento'),
            content: TextField(
              controller: conf.naciController,
              decoration: const InputDecoration(
                  hintText: 'Fecha',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blueGrey,
                  )),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Cerrar')),
              TextButton(
                onPressed: () {
                  conf.dateEditing;
                  _dismissDialog();
                },
                child: Text('Hecho'),
              )
            ],
          );
        });
  }

  _dismissDialog() {
    Navigator.pop(context);
  }

  Widget _textEdad() {
    return Container(
        height: 40,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: GestureDetector(
          child: TextField(
            style: TextStyle(color: Colors.white),
            controller: conf.naciController,
            decoration: InputDecoration(
              enabled: false,
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              prefixIcon: Icon(
                Icons.person,
                color: MyColors.primaryColor,
              ),
            ),
          ),
          onTap: () {
            _dialognDate();
          },
        ));
  }

  Widget _textEmail() {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: GestureDetector(
          child: TextField(
            style: TextStyle(color: Colors.white),
            controller: conf.emailController,
            decoration: InputDecoration(
              enabled: false,
              hintText: 'Correo electronico',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              prefixIcon: Icon(
                Icons.email,
                color: MyColors.primaryColor,
              ),
            ),
          ),
          onTap: () {
            _dialogEmail();
          },
        ));
  }

  Widget _cambiarPassword() {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: GestureDetector(
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            controller: conf.passwordController,
            decoration: InputDecoration(
              enabled: false,
              hintText: 'Contraseña',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              prefixIcon: Icon(
                Icons.lock,
                color: MyColors.primaryColor,
              ),
            ),
          ),
          onTap: () {
            _dialognPassword();
          },
        ));
  }
}
