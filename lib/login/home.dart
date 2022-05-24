import 'dart:io';
import 'package:prueba/models/nota.dart';
import 'package:prueba/values/tema.dart';
import 'package:flutter/material.dart';
import 'package:prueba/login/userservices.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/fondo4.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 137, 150, 245),
          title: const Text(
            'Mi Diario <3',
            style: TextStyle(fontFamily: 'spicypumpkin'),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ModalNota();
                });
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder(
          future: UserServices().getNotas(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            List misnotas = snapshot.data ?? [];
            return ListView(
              children: [
                for (Nota nota in misnotas)
                  ListTile(
                    title: Text(nota.titulo.toString()),
                    subtitle: Text(nota.contenido.toString()),
                    /* trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.blue),
                      onPressed: (){
                        estado!.deleteNota(nota.key);
                      },
                      ),*/
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ModalNota extends StatefulWidget {
  @override
  State<ModalNota> createState() => _ModalNotaState();
}

class _ModalNotaState extends State<ModalNota> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();
  final GlobalKey<FormState> _formularioKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //height: 300,
          color: french,
          child: Form(
            key: _formularioKey,
            child: SingleChildScrollView(
                child: Column(
              children: [
                TextFormField(
                    controller: _tituloController,
                    decoration:
                        const InputDecoration(labelText: 'Titulo de la nota'),
                    validator: (String? dato) {
                      if (dato!.isEmpty) {
                        return 'Este campo es requerido';
                      }
                    }),
                TextFormField(
                    controller: _contenidoController,
                    decoration: const InputDecoration(labelText: 'Contenido'),
                    maxLines: 10,
                    validator: (String? dato) {
                      if (dato!.isEmpty) {
                        return 'Este campo es requerido';
                      }
                    }),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formularioKey.currentState!.validate()) {
                          bool respuesta = await UserServices().saveNotas(
                            _tituloController.text,
                            _contenidoController.text,
                          );

                          if (respuesta) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Nota agregada correctamente'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('algo salio mal'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                        // Navigator.pop(context);
                        //agrega
                      },
                      child: const Text('Aceptar'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancelar'),
                    ),
                  ],
                )
              ],
            )),
          )),
    );
    @override
    void dispose() {
      _contenidoController.dispose();
      _tituloController.dispose();
      super.dispose();
    }
  }
}
