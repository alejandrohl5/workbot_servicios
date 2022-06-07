import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workbot_servicios/login_page.dart';
import 'package:workbot_servicios/rosario_formulario.dart';
import 'package:workbot_servicios/victor_perfil.dart';
import 'victor_registro.dart';
import 'login_page.dart';
import 'rosario_formulario.dart';
import 'inicio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(inicio());
}

class inicio extends StatelessWidget {
  const inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: inicio_sesion(),

      title: 'Worbot',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
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


