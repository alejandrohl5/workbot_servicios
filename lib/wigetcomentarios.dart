import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:workbot_servicios/src/bloc/auth_cubit.dart';

class comentarios_james extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Servicios',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String comentarioDado = "", comentaristaCorreo = "", comentadoCorreo = "";
  getcomentarioDado(comentario) {
    comentarioDado = comentario;
  }

  getcomentadoCorreo(cdCorreo) {
    comentadoCorreo = cdCorreo;
  }

  get enviarDato {
    print("enviar");

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("comentarios").doc();

    documentReference.set(
      {
        "comentarioDado": comentarioDado,
        "comentadoCorreo": comentadoCorreo,
        "comentaristaCorreo": FirebaseAuth.instance.currentUser!.email
      },
      SetOptions(merge: true),
    ).catchError((error) => print("Fallo al enviar el dato: $error"));
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Text(
          'Wortkbot',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color.fromARGB(255, 242, 243, 245),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Zona de comentarios"),
            Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFF5F5F5),
                  child: Container(
                    width: 400,
                    height: 190,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: TextFormField(
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: "Para: ",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                            onChanged: (String cdCorreo) {
                              getcomentadoCorreo(cdCorreo);
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: TextFormField(
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: "Deje su comentario: ",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                            onChanged: (String comentario) {
                              getcomentarioDado(comentario);
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        ElevatedButton(
                          onPressed: () {
                            print('Button pressed ...');
                            enviarDato;
                          },
                          child: const Text('Enviar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFF5F5F5),
                  child: Container(
                    width: 390,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
