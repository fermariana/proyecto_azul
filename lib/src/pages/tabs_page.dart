//import 'dart:html';
//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:prueba/main.dart';
import 'package:prueba/src/pages/agregar_page.dart';
import 'package:prueba/src/pages/profile_page.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'package:prueba/src/widgets/user.dart';
import '../../login/contacto.dart';
import 'data.dart';
import 'package:prueba/src/pages/tabs_page.dart';
import 'package:prueba/config/page_conf.dart';
import 'package:prueba/login/home.dart';
import 'package:prueba/login/login_page.dart';
import 'package:prueba/login/registro_page.dart';
import 'package:prueba/splas_screen.dart';
import 'package:prueba/untils/mycolors.dart';
import 'package:prueba/Cuestionario.dart';
import 'package:prueba/Hobbies.dart';
import 'package:prueba/login/home.dart';
import 'package:prueba/chatbot.dart';
import 'package:prueba/config/page_conf.dart';

//import 'package:http/http.dart' as http;

class TabsPage extends StatefulWidget {
  TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPage();
}

class _TabsPage extends State<TabsPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    TabsPage(),
    PageConfig(),
  ];
  List<Data> dataList = [];

  get index => null;
  @override
  void initState() {
    super.initState();
    getUsers();

    _controller = PageController();
  }

  final tabs = [Center(child: TabsPage()), Center(child: ProfilePage())];
  late PageController _controller;

  void getUsers() async {
    FirebaseFirestore.instance
        .collection('hobbies')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        //print(doc["titulo"]);
        String a = doc["titulo"];
        print(a);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
  }

  get child => null;
  // PageController _controller;

  Container MyArticle(String imageVal) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DeimosAppHome()),
          );
        },
        child: Container(
          width: 170,
          child: Card(
            child: Wrap(
              children: <Widget>[
                Image.asset(imageVal),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container MyArticle1(String imageVal) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Container(
          width: 170,
          child: Card(
            child: Wrap(
              children: <Widget>[
                Image.asset(imageVal),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container MyArticle2(String imageVal) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Contactos()),
          );
        },
        child: Container(
          width: 170,
          child: Card(
            child: Wrap(
              children: <Widget>[
                Image.asset(imageVal),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container MyArticle3(String imageVal) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cuestionario()),
          );
        },
        child: Container(
          width: 170,
          child: Card(
            child: Wrap(
              children: <Widget>[
                Image.asset(imageVal),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container MyArticle4(String imageVal) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
          Color.fromARGB(255, 137, 150, 245),
        )),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TabsPage()),
          );
        },
        child: Container(
          width: 165,
          child: Card(
            child: Wrap(
              children: <Widget>[
                Image.asset(imageVal),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container MyArticle5(String imageVal) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
          Color.fromARGB(255, 137, 150, 245),
        )),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageConfig()),
          );
        },
        child: Container(
          width: 165,
          child: Card(
            child: Wrap(
              children: <Widget>[
                Image.asset(imageVal),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 137, 150, 245),
        //----------------Texto de Bienvenidos-------------------------
        title: const Text(
          "   Bienvenidos",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,

            //fontWeight: FontWeight.bold,
            fontFamily: "estilo",
          ),
        ),

        //---------------CircleAvatar foto de usuario-----------------
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/fernanda.jpg"),
              radius: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                MyArticle("assets/images/btn1.PNG"),
                MyArticle1("assets/images/btn2.PNG"),
                MyArticle2("assets/images/btn3.PNG"),
                MyArticle3("assets/images/btn4.PNG"),

                // tabs[_currentIndex]
              ],
            ),
          ),
          Container(
            height: 500,
            color: Colors.white,
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("hobbies").snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                //tenemos data
                List<DocumentSnapshot> docs = snapshot.data.docs;
                return Container(
                  child: ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (_, i) {
                        Object? data = docs[i].data();
                        print("___________");
                        print(data);
                        return User(
                            title: (data as dynamic)["titulo"],
                            description: (data as dynamic)["descripcion"],
                            foto: (data as dynamic)["imagen"],
                            direccion: (data as dynamic)["direccion"]);
                        /*ListTile(
                          title: Text((data as dynamic)["titulo"]),
                        );*/
                      }),
                );
              },
            ),
          )
        ],
      )),

      // _children[_currentIndex],

      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        height: 55,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            MyArticle4("assets/images/casaconf.PNG"),
            MyArticle5("assets/images/usuarioconf.PNG"),

            // tabs[_currentIndex]
          ],
        ),
      ),

      /* BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 137, 150, 245),
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
            backgroundColor: Color.fromARGB(255, 137, 150, 245),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Usuario',
            backgroundColor: Color.fromARGB(255, 137, 150, 245),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),*/
    );
  }
}

Widget CardUI(String imgURL, String a, String descripcion, String nombre) {
  return Card(
    margin: EdgeInsets.all(15),
    color: Color.fromARGB(255, 39, 38, 38),
    child: Container(
      color:
          Color.fromARGB(255, 39, 38, 38), //Color.fromARGB(255, 247, 234, 234),
      margin: EdgeInsets.all(1.5),
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            a,
            style: const TextStyle(
                color: Color.fromARGB(255, 117, 115, 109),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 1,
          ),
          Image.network(imgURL, fit: BoxFit.cover, width: 700),
          const SizedBox(
            height: 1,
          ),
          Text(
            a,
            style: const TextStyle(
                color: Color.fromARGB(255, 218, 209, 209),
                fontSize: 15,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 1,
          ),
        ],
      ),
    ),
  );
}
