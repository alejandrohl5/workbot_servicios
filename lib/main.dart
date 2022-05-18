import 'package:flutter/material.dart';
import 'package:workbot_servicios/login_page.dart';
import 'package:workbot_servicios/rosario_formulario.dart';
import 'package:workbot_servicios/victor_perfil.dart';
import 'victor_registro.dart';
import 'login_page.dart';
import 'rosario_formulario.dart';

void main() {
  runApp(inicio());
}

class inicio extends StatelessWidget {
  const inicio({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}










//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body:Container(
//           child: ejecutor(),      
//         ),
//         ),
//     );
//   }
// }

















// class ejecutor extends StatelessWidget {
//   const ejecutor({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }


