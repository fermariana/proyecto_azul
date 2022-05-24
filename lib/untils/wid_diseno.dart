import 'package:flutter/material.dart';

import 'mycolors.dart';

class WidDiseno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 137, 166, 245),
          Color.fromARGB(255, 137, 139, 245),
        ], stops: [
          0.2,
          0.5
        ], begin: FractionalOffset.topLeft, end: FractionalOffset.bottomRight)),
      ),
      Positioned(
        child: _circuloD(MyColors.secundaryColor, 200, 100),
        top: -5,
        left: 200,
      ),
      Positioned(
        child: _circuloD(MyColors.primaryColor, 200, 100),
        top: 600,
        left: -5,
      ),
      SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    ]);
  }

  Widget _circuloD(Color co, double nu, double di) {
    return Container(
      width: nu,
      height: nu,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(di), color: co),
    );
  }
}
