import 'package:prueba/login/home.dart';
import 'package:prueba/values/tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const _HomePage());
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: miTema(context),
      title: 'DIARIO',
      routes: {
        '/': (_) => HomePage(),
      },
      initialRoute: '/',
    );
  }
}
