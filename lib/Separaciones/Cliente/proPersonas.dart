import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workbot_servicios/victor_perfil.dart';
import 'package:workbot_servicios/vistaTrabajador.dart';
import 'package:workbot_servicios/servis.dart';
import 'package:workbot_servicios/targetadePresntaColab.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Prueba());
}

class Prueba extends StatefulWidget {
  @override
  State<Prueba> createState() => _MyAppState();
}

class _MyAppState extends State<Prueba> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase',
      home: AddData(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AddData extends StatelessWidget {
  String finales = '';
  String accionDeUsuario = 'cheff';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('colaboradores')
            .where("jobs", isEqualTo: "$accionDeUsuario")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                print("si entro pipi");
              }
              ;

              return Container(
                  width: 50,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    shape: BoxShape.rectangle,
                  ),
                  
                  child: Padding(

                    padding: EdgeInsetsDirectional.fromSTEB(2, 12, 2, 2),

                    child: Card(
                      
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color.fromARGB(255, 136, 138, 138),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => target_james(),
                        ),
                      );
                    },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.05, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(22),
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
                                  EdgeInsetsDirectional.fromSTEB(22, 4, 4, 4),
                              child: Text(
                                '$finales',
                                style: TextStyle(color: Colors.black),
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
    );
  }
}
