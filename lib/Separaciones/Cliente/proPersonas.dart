import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workbot_servicios/formuPosibleTraba.dart';
import 'package:workbot_servicios/targetadePresntaColab.dart';

class App extends StatelessWidget {
  String finales = '';
  String EmaiDePersona = '';
  String accion = '';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(App(''));
  }

  App(
    this.accionDeUsuario,
  );
  final String accionDeUsuario;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Inicializar FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('No se logrogo conectar');
        }

        // Una vez completado, se muestra la aplicación
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                appBar: AppBar(
                  backgroundColor: Color.fromARGB(255, 64, 186, 235),
                  title: Text(
                      "${accionDeUsuario[0].toUpperCase()}${accionDeUsuario.substring(1)}"),
                  actions: [
                    ElevatedButton(
                      child: Text(
                        'Trabaja con nosotros',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 157, 212, 186),
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        side: BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        print('Pressed');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => FormularioDeTrabajo(
                                  title: 'Registrate ¡Gratis!',
                                ))));
                      },
                    ),
                  ],
                ),
                body: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('colaboradores')
                      .where("jobs", isEqualTo: "$accionDeUsuario")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ListView(
                      children: snapshot.data!.docs.map((document) {
                        if (document['jobs'].toString() == "$accionDeUsuario") {
                          finales = document['names'].toString() +
                              ' ' +
                              document['surnames'].toString();
                          EmaiDePersona = document['email'];
                          print("entro de servis dart");
                        }
                        ;

                        var accion = EmaiDePersona;
                        return Container(
                            width: 50,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 12, 2, 2),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color.fromARGB(255, 136, 138, 138),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                target(accion.toString()))));
                                    //print("el email selecionado es $finales");

                                    print(
                                        'su email del selecionado es: $accion');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.05, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          child: Image.network(
                                            'https://firebasestorage.googleapis.com/v0/b/pruefirebase-67702.appspot.com/o/colaboradores%2Fdescarga.jpg?alt=media&token=7369fe31-6b98-44dc-ba67-7c157e38d903',
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  22, 4, 4, 4),
                                          child: Text(
                                            '$finales',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      }).toList(),
                    );
                  },
                ),
              ));
        }

        // De lo contrario, mostrar algo mientras espera que se complete la inicialización
        return Container(child: CircularProgressIndicator());
      },
    );
  }
}
