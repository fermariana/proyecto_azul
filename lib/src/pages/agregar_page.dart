import 'package:flutter/material.dart';
import 'package:prueba/src/pages/profile_page.dart';

class AgregarPage extends StatefulWidget {
  const AgregarPage({Key? key}) : super(key: key);

  @override
  State<AgregarPage> createState() => _AgregarPage();
}

class _AgregarPage extends State<AgregarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [ProfilePage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Usuario',
          ),
        ],
      ),
    );
  }
}
