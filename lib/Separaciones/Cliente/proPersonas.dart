// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workbot_servicios/victor_perfil.dart';
import 'package:workbot_servicios/vistaTrabajador.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //se asegura que todas las dependencias de fluter esten inicilaizadas antes de comenzar
  Firebase.initializeApp().then((value) {
    runApp(Prueba());
  });
}

class Prueba extends StatelessWidget {
  const Prueba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profecion "X"',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Cuerpo(),
    );
  }
}

class Cuerpo extends StatefulWidget {
  const Cuerpo({Key? key}) : super(key: key);

  @override
  State<Cuerpo> createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {
//varibles q contienen los datos filtrados

  List Electrisista = [];
  List Gasfitero = [];
  List Soldador = [];
  List Mecanico = [];
  List Carpintero = [];
  List Vidreria = [];
  List Fontaner = [];
  List Delivery = [];
  List Contador = [];
  List Abogado = [];
  List Odontologia = [];
  List Fisioterapeuta = [];
  List Enfermeria = [];
  List Veterinario = [];
  List Barman = [];
  List Animador = [];
  List Dj = [];
  List Pediatra = [];
  List Asesoramiento = [];
  List Jardinero = [];
  List Cheff = [];
  List Barbershop = [];
  List Cantante = [];
  List Fotografo = [];
  List Pintor = [];

//..........................................
  //funciones para traer las data desde firestore
  @override
  void initState() {
    getUserspintor();
    getUserselectrisista();
    getUsersgasfitero();
    getUsersoldador();
    getUsermecanico();
    getUsercarpintero();
    super.initState();
  }

  void getUserspintor() async {
    //funcion que trae los datos filtrados usuarios pintores
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'pintor').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('antes de :..........$userinit');
      }
    }
    Pintor.add(userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('El despued es :.......$Pintor');
  }

//..........................................................
  void getUserselectrisista() async {
    //funcion que trae los datos filtrados usuarios electrisistas
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users = await coleccionDataFirebase
        .where("jobs", isEqualTo: 'electrisista')
        .get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('antes de :..........$userinit');
      }
    }
    Electrisista.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('El despued es :.......$Electrisista');
  }

  //..............................................
  void getUsersgasfitero() async {
    //funcion que trae los datos filtrados usuarios gasfitero
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'gasfitero').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('antes de :..........$userinit');
      }
    }
    Gasfitero.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('El despued es :.......$Gasfitero');
  }

  //.........................................
  void getUsersoldador() async {
    //funcion que trae los datos filtrados usuarios soldador
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'soldador').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('antes de :..........$userinit');
      }
    }
    Soldador.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('El despued es :.......$Soldador');
  }

  //.......................................
  void getUsermecanico() async {
    //funcion que trae los datos filtrados usuarios mecanico
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'mecanico').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('antes de :..........$userinit');
      }
    }
    Mecanico.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('El despued es :.......$Mecanico');
  }

  //.....................................
  void getUsercarpintero() async {
    //funcion que trae los datos filtrados usuarios mecanico
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users = await coleccionDataFirebase
        .where("jobs", isEqualTo: 'carpintero')
        .get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('antes de :..........$userinit');
      }
    }
    Carpintero.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('El despued es :.......$Carpintero');
  }
  //
  //------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mecanico"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [personas(), personas()],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [personas(), personas()],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [personas(), personas()],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [personas(), personas()],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [personas(), personas()],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [personas(), personas()],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

Widget personas() {
  return StreamBuilder<Object>(builder: (context, snapshot) {
    // ignore: deprecated_member_use
    return RaisedButton(
        color: Colors.blueAccent,
        child: Row(
          children: const [
            Padding(padding: EdgeInsets.symmetric(vertical: 45)),
            Text(
              "jose Caceres " "\n" "Chipana Domingez",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.people, size: 30),
          ],
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => perfil()),
          ));
        });
  });
}
