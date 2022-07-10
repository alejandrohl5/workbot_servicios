import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workbot_servicios/login_page.dart';
import 'package:workbot_servicios/rosario_formulario.dart';
import 'package:workbot_servicios/src/app.dart';
import 'package:workbot_servicios/src/bloc/auth_cubit.dart';
import 'package:workbot_servicios/src/repository/implementacion/auth_repository.dart';
import 'package:workbot_servicios/victor_perfil.dart';
import 'victor_registro.dart';
import 'login_page.dart';
import 'rosario_formulario.dart';
import 'introducccion.dart';
import 'inicio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authCubit = AuthCubit(AuthRepository());
  runApp(
    BlocProvider(
      create: (_) => authCubit..init(),
      child: inicio.create(),
    ),
  );
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