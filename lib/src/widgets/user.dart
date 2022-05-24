//import 'dart:ffi';
//import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class User extends StatelessWidget {
  final String title;
  final String description;
  final String foto;
  final String direccion;
  User(
      {Key? key,
      required this.title,
      required this.description,
      required this.foto,
      required this.direccion})
      : super(key: key);

  var linkText = TextStyle(color: Colors.blue);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffe4eeee), //Color(0xffDCDCDC)

          //Color(0xffb6ffff),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: 8,
                right: 10,
                top: 5,
              ),
              height: 30,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "noticia",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 15),
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(foto), fit: BoxFit.cover)),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 5,
              ),
              height: 150,
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "noticia",
                ),
              ),
            ),
            Container(
              height: 30,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: linkText,
                    text: "Click aquí 🤔➜",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        var url = direccion;
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw "Cannot load URL";
                        }
                      })
              ])),
            )
          ],
        ),
      ),
    );
  }
}
