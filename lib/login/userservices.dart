import 'package:prueba/models/nota.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices {
  Future<List<Nota>> getNotas() async {
    List<Nota> misNotas = [];

    try {
      DataSnapshot snap =
          await FirebaseDatabase.instance.reference().child('notas').once();
      if (snap.exists) {
        snap.value.forEach((key, value) {
          Map mapa = {'key': key, ...value};
          Nota nuevaNota = Nota(
            contenido: mapa['body'],
            key: mapa['key'],
            titulo: mapa['title'],
          );
          misNotas.add(nuevaNota);
        });
      }
      return misNotas;
    } catch (e) {
      return misNotas;
    }
  }

  Future<bool> saveNotas(String titulo, String contenido) async {
    try {
      await FirebaseDatabase.instance
          .reference()
          .child('notas')
          .push()
          .set({'title': titulo, 'body': contenido});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> eliminarNota(String key) async {
    try {
      await FirebaseDatabase.instance
          .reference()
          .child('notas')
          .child(key)
          .remove();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
