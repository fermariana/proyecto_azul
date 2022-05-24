import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba/src/pages/tabs_page.dart';
import 'package:prueba/config/page_conf.dart';
import 'package:prueba/login/home.dart';
import 'package:prueba/login/login_page.dart';
import 'package:prueba/login/registro_page.dart';
import 'package:prueba/splas_screen.dart';
import 'package:prueba/untils/mycolors.dart';
import 'package:prueba/Cuestionario.dart';
import 'package:prueba/Hobbies.dart';
import 'package:provider/provider.dart';
import 'package:prueba/chatbot.dart';

void main() async {
  //TODOS LOS COMENTARIOS SIRVEN
  WidgetsFlutterBinding.ensureInitialized();

  try {
    Firebase.initializeApp().then((value) {
      runApp(MyApp());
    });
  } catch (e) {
    print("object" + e.runtimeType.toString());
  }
}

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  /* Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'tabs',
      debugShowCheckedModeBanner: false,
      routes: {
        'tabs': (BuildContext context) => TabsPage(),
      },
    );
  }*/
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Page configuracion',
      initialRoute: 'Splash',
      routes: {
        'Splash': (BuildContext context) => SplashScreen(),
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegistroPage(),
        'hobbies': (BuildContext context) => Hobbies(),
        'menu': (BuildContext context) => TabsPage(),
        'diario': (BuildContext context) => HomePage(),
        'cuestionario': (BuildContext context) => Cuestionario(),
        'chat': (BuildContext context) => DeimosDialogflowApp()
      },
      theme:
          ThemeData(primaryColor: MyColors.primaryColor, fontFamily: 'Roboto'),
    );
  }
}
