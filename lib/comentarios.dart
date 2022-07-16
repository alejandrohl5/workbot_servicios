import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:workbot_servicios/servis.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //se asegura que todas las dependencias de fluter esten inicilaizadas antes de comenzar
  Firebase.initializeApp().then((value) {
    runApp(comentarios(''));
  });
}

class comentarios extends StatelessWidget {
  const comentarios(String correo, {Key? key}) : super(key: key);

  //comentariosState createState() => _comentariosState();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fluter demo',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.cyan)),
      home: const MyHomePage(title: 'Comentarios'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String comentarios = '',
      correoCpomenytarista = '',
      correocomentado = 'yooooooo';

  getcomentarios(name) {
    comentarios = name;
  }

  getcorreoCpomenytarista(id) {
    correoCpomenytarista = id;
  }

  getStudentGPA(gpa) {
    correocomentado = gpa;
  }

  alertenvioconExito(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: ((context) => servicios_james())),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Exito"),
      content: Text(
          "Su comentario se ha enviado con exito. Para evitar lenguaje inapropiado, lo revisaremos antes de ser publicado"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  createData() {
    print('la data fue creada');
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("comentarios")
        .doc(correocomentado);

    documentReference
        .set(
          {
            "comentarios": comentarios,
            "correoCpomenytarista": FirebaseAuth.instance.currentUser!.email,
            "correocomentado": correocomentado
          },
          SetOptions(merge: true),
        )
        .catchError((error) => print("falla al fusionar los datos:$error"))
        .whenComplete(() {
          print("$comentarios created");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Ingrese su comentario",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  onChanged: (String name) {
                    getcomentarios(name);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      createData();

                      alertenvioconExito(context);
                    },
                    child: const Text('Crear Comentario'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        textStyle: const TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  textDirection: TextDirection.ltr,
                  children: const [
                    Expanded(
                        child: Text('Comentariosomentario',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('comentarios')
                    .where('correocomentado', isEqualTo: "yooooooo".toString())
                    .snapshots(),
                builder: (BuildContext Context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];

                          return Container(
                              width: 350,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                              child: Text(
                                documentSnapshot['comentarios'],
                              ));
                        },
                        itemCount: snapshot.data!.docs.length);
                  } else {
                    return const Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
