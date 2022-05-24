import 'package:flutter/material.dart';

class Contactos extends StatefulWidget {
  @override
  State<Contactos> createState() => _ContactosState();
}

class _ContactosState extends State<Contactos> {
  List<Persona> _personas = [
    Persona("Psi.Rocio", "Torre Blanca", "+52 2381239707"),
    Persona("Psi.Alejandro", "Tovar Gonzales", "+52 2381082030"),
    Persona("Psi.Jose Antonio", "Martinez de la Luz", "+52 5578926221"),
    Persona("Carolina", "Sánchez Zacateco", "+52 2381056601"),
    Persona("DIF. Tehuacan", " ", "+52 2383821314"),
    Persona("Hospital de", "la mujer", "+52 2383805000"),
    Persona("Hospital genera", "de Tehuacan", "+52 2383826057"),
    Persona("Cruz roja", "de Tehuacan", "+52 2383820026"),
    Persona(
        "CEDI", "servicios en intervención psicoterapeútica", "+52 2381130707"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Mis contactos'),
            centerTitle: true,
          ),
          body: ListView.builder(
              itemCount: _personas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {
                    this._borrarPersona(context, _personas[index]);
                  },
                  title: Text(
                      _personas[index].name + ' ' + _personas[index].lastname),
                  subtitle: Text(_personas[index].phone),
                  leading: CircleAvatar(
                      child: Text(_personas[index].name.substring(0, 1))),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              })),
    );
  }

  _borrarPersona(context, Persona persona) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar contacto"),
              content: Text("¿Esta seguro de que quiere eliminar a " +
                  persona.name +
                  '?'),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar")),
                FlatButton(
                    onPressed: () {
                      this.setState(() {
                        print(persona.name);
                      });

                      this._personas.remove(persona);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Borrar",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ));
  }
}

class Persona {
  late String name;
  late String lastname;
  late String phone;

  Persona(name, lastname, phone) {
    this.name = name;
    this.lastname = lastname;
    this.phone = phone;
  }
}
