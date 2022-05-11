import 'package:flutter/material.dart';
import 'package:workbot_servicios/victor_perfil.dart';
import 'victor_registro.dart';

void main() {
  runApp(inicio());
}


class inicio extends StatelessWidget {
  const inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Container(
          child: perfil(),      
        ),
        ),
    );
  }
}





