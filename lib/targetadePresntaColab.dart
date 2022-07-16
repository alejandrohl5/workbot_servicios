import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:workbot_servicios/wigetcomentarios.dart';

class target extends StatelessWidget {
  String nombre = '';
  String numero = '99732085';
  String correo = '';
  String direccion = '';
  String especialidad = '';
  String calificacion = '';

  // String accionDeUsuario = '';
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(target(''));
  }

  target(
    this.emailClickeado,
  );
  final String emailClickeado;

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
                  title: Text("$emailClickeado"),
                ),
                body: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('colaboradores')
                      .where('email', isEqualTo: "$emailClickeado".toString())
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
                        if (document['email'].toString() ==
                            "$emailClickeado".toString()) {
                          nombre = document['names'].toString() +
                              ' ' +
                              document['surnames'].toString();

                          correo = document['email'];

                          direccion = document['direccion'];
                          especialidad = document['jobs'];
                          calificacion = document['calificacion'];
                          print(
                              'el email  trajo es: $emailClickeado pelotudooooooooooooooooooooooooooooooooooooooooo');

                          print(
                              "si entro mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
                          print(nombre);
                          print(correo);
                          print(direccion);
                          print(especialidad);
                        }

                        ;
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0.1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  9, 9, 9, 9),
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -0.05, 0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(45),
                                                child: Image.network(
                                                  'https://picsum.photos/seed/973/600',
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  9, 9, 9, 9),
                                          child: Container(
                                            width: 190,
                                            height: 140,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                            ),
                                            child: ListView(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              children: [
                                                Text('$nombre',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                Text('$numero',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                Text('$direccion',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                Text('$correo',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                Text('$especialidad',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text('Calificación',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    RatingBar.builder(
                                      initialRating:
                                          double.parse('$calificacion'),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 340,
                                height: 41,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                comentarios_james())));
                                  },
                                  child: const Text('Ver comentarios'),
                                ),
                              ),
                            ],
                          ),
                        );
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
