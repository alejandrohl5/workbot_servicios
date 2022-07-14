import 'dart:core';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workbot_servicios/servis.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //se asegura que todas las dependencias de fluter esten inicilaizadas antes de comenzar
  Firebase.initializeApp().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //MyAppState createState() => _MyAppState();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulario',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.cyan)),
      home: const FormularioDeTrabajo(title: ''),
    );
  }
}

class FormularioDeTrabajo extends StatefulWidget {
  const FormularioDeTrabajo({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<FormularioDeTrabajo> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FormularioDeTrabajo> {
  String nombre = '',
      dni = '',
      direccion = '',
      edad = '',
      email = '',
      ocupacion = '',
      telefono = '',
      whatsasap = '';

  getnombre(name) {
    nombre = name;
  }

  getdni(id) {
    dni = id;
  }

  getdireccion(adress) {
    direccion = adress;
  }

  getemail(emailE) {
    email = emailE;
  }

  getedad(age) {
    edad = age;
  }

  getocupacion(occupation) {
    ocupacion = occupation;
  }

  gettelefono(telephone) {
    telefono = telephone;
  }

  getwhatsasap(whatsAsap) {
    whatsasap = whatsAsap;
  }

  createData() {
    print('la data fue creada');
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("posiblestraba").doc(dni);

    documentReference
        .set(
          {
            "nombre": nombre,
            "dni": dni,
            "direccion": direccion,
            "edad": edad,
            'email': email,
            'ocupacion': ocupacion,
            'telefono': telefono,
            'whatsasap': whatsasap
          },
          SetOptions(merge: true),
        )
        .catchError((error) => print("falla al fusionar los datos:$error"))
        .whenComplete(() {
          print("usuario $nombre creado con exito");
        });
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: ((context) => servicios_james())),
        );
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("¡Felicitaciones!"),
      content: Text(
          "Su solicitud se envio correctamente. Nos comunicaremos con usted a la brevedad posible"),
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

  alertCamposVacios(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("¡Upss!"),
      content: Text(
          "Su solicitud no se envio. Verifique que los campos esten llenos correctamente"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, //responsivee
            crossAxisAlignment: CrossAxisAlignment.center, //responsibe
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 201, 212, 216),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: ListView(
                        padding: EdgeInsets.all(24.0),
                        scrollDirection: Axis.vertical,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Nombres Y Apellidos",
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0),
                                  ),
                                ),
                                onChanged: (String name) {
                                  getnombre(name);
                                },
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Dni",
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0),
                                  ),
                                ),
                                onChanged: (String id) {
                                  getdni(id);
                                },
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Dirección",
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0),
                                  ),
                                ),
                                onChanged: (String adress) {
                                  getdireccion(adress);
                                },
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Edad",
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0),
                                  ),
                                ),
                                onChanged: (String age) {
                                  getedad(age);
                                },
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Email",
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0),
                                  ),
                                ),
                                onChanged: (String emailE) {
                                  getemail(emailE);
                                },
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Ocupación',
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0),
                                      )),
                                  onChanged: (String occupation) {
                                    getocupacion(occupation);
                                  }),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Telefono',
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0),
                                      )),
                                  onChanged: (String telephone) {
                                    gettelefono(telephone);
                                  }),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'WhatsApp',
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0),
                                      )),
                                  onChanged: (String whatsAsap) {
                                    getwhatsasap(whatsAsap);
                                  }),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                        child: ElevatedButton(
                                      onPressed: () {
                                        if (nombre == '' ||
                                            dni == '' ||
                                            direccion == '' ||
                                            email == '' ||
                                            ocupacion == '' ||
                                            telefono == '' || whatsasap == '') {
                                          alertCamposVacios(context);
                                        }
                                        createData();
                                        showAlertDialog(context);
                                      },
                                      child: const Text('Registrarse'),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.green,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          textStyle: const TextStyle(
                                              color: Colors.white)),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
