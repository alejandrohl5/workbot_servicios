// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, prefer_is_empty, prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workbot_servicios/victor_perfil.dart';
import 'package:workbot_servicios/vistaTrabajador.dart';
import 'package:workbot_servicios/servis.dart';
import 'package:workbot_servicios/targetadePresntaColab.dart';

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
    getUservidreria();
    getUserfontaner();
    getUserdeliveri();
    getUsercontador();
    getUserabogado();
    getUserodontologia();
    getUserfisioterapia();
    getUserenfermeria();
    getUserveterinario();
    getUserbartman();
    getUseranimador();
    getUserdj();
    getUserpediatra();
    getUserasesores();
    getUserjardineros();
    getUsercheff();
    getUserbarbershop();
    getUsercantante();
    getUserfotografo();
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
        print('data de pintores :..........$userinit');
      }
    }
    Pintor.add(userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data nombres de pintores :.......$Pintor');
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
        print('data de electrisistas  :..........$userinit');
      }
    }
    Electrisista.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data nombres electrisitas :.......$Electrisista');
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
        print('data de gasfiteros :..........$userinit');
      }
    }
    Gasfitero.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data nombres de gasfiteros :.......$Gasfitero');
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
        print('data de soldadores :..........$userinit');
      }
    }
    Soldador.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data nombres de soldadores :.......$Soldador');
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
        print('data mecanicos:..........$userinit');
      }
    }
    Mecanico.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data de nombres mecanicos :.......$Mecanico');
  }

  //.....................................
  void getUsercarpintero() async {
    //funcion que trae los datos filtrados usuarios carpinteros
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users = await coleccionDataFirebase
        .where("jobs", isEqualTo: 'carpintero')
        .get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de carpinteros :..........$userinit');
      }
    }
    Carpintero.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data nombres carpinteros :.......$Carpintero');
  }

  //..............................................
  void getUservidreria() async {
    //funcion que trae los datos filtrados usuarios vidreros
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'vidreria').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de  vidreros:..........$userinit');
      }
    }
    Vidreria.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data nombres de vidreros :.......$Vidreria');
  }

  //.........................................
  void getUserfontaner() async {
    //funcion que trae los datos filtrados usuarios fontaner
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'fontaner').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data fontaners :..........$userinit');
      }
    }
    Fontaner.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data nombres de fontaners:.......$Fontaner');
  }

  //....................................
  void getUserdeliveri() async {
    //funcion que trae los datos filtrados usuarios deliveri
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'deliveri').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data deliveris :..........$userinit');
      }
    }
    Delivery.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data nombres de deliveris :.......$Delivery');
  }

  //......................
  void getUsercontador() async {
    //funcion que trae los datos filtrados usuarios contadores
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'contador').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data contadores :..........$userinit');
      }
    }
    Contador.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data nombres de contadores:.......$Contador');
  }

  //...............................
  void getUserabogado() async {
    //funcion que trae los datos filtrados usuarios abogados
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'abogado').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de abogados :..........$userinit');
      }
    }
    Abogado.add(userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data de nombres de abogados :.......$Abogado');
  }

  //..................
  void getUserodontologia() async {
    //funcion que trae los datos filtrados usuarios adontologos
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users = await coleccionDataFirebase
        .where("jobs", isEqualTo: 'odontologo')
        .get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de odontologos :..........$userinit');
      }
    }
    Odontologia.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data de nombres de abogados :.......$Odontologia');
  }

  //...............................
  void getUserfisioterapia() async {
    //funcion que trae los datos filtrados usuarios fisioterapeutas
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users = await coleccionDataFirebase
        .where("jobs", isEqualTo: 'fisioterapia')
        .get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de fisioterapeutas :..........$userinit');
      }
    }
    Fisioterapeuta.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data de nombres de fisioterapeutas :.......$Fisioterapeuta');
  }

  //.................................
  void getUserenfermeria() async {
    //funcion que trae los datos filtrados usuarios enfermeria
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users = await coleccionDataFirebase
        .where("jobs", isEqualTo: 'enfermeria')
        .get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de enfermeria :..........$userinit');
      }
    }
    Enfermeria.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data de nombres de enfermeros :.......$Enfermeria');
  }

  //........................
  void getUserveterinario() async {
    //funcion que trae los datos filtrados usuarios veterinario
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users = await coleccionDataFirebase
        .where("jobs", isEqualTo: 'veterinario')
        .get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de veterinarioas:..........$userinit');
      }
    }
    Veterinario.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data de nombres de veterinarios :.......$Veterinario');
  }

  //.......................................
  void getUserbartman() async {
    //funcion que trae los datos filtrados usuarios bartman
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'bartman').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de bartmas :..........$userinit');
      }
    }
    Barman.add(userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data de nombres de bartmas :.......$Barman');
  }

  void getUseranimador() async {
    //funcion que trae los datos filtrados usuarios animador
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'animador').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de animadores :..........$userinit');
      }
    }
    Animador.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data nombres de Animadoores :.......$Animador');
  }

  void getUserdj() async {
    //funcion que trae los datos filtrados usuarios dj
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'dj').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de djs :..........$userinit');
      }
    }
    Dj.add(userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data n0mbres de djs :.......$Dj');
  }

  void getUserpediatra() async {
    //funcion que trae los datos filtrados usuarios pediatras
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'pediatras').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de pediatras :..........$userinit');
      }
    }
    Pediatra.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data de nombres de pediatras:.......$Pediatra');
  }

  //................................
  void getUserasesores() async {
    //funcion que trae los datos filtrados usuarios asesoeres
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'asesor').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de asesores :..........$userinit');
      }
    }
    Asesoramiento.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data de nombres de asesores :.......$Asesoramiento');
  }

  //............................
  void getUserjardineros() async {
    //funcion que trae los datos filtrados usuarios jardineros
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'jardinero').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de jardineros :..........$userinit');
      }
    }
    Jardinero.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data de nombrres de jardineros:.......$Jardinero');
  }

  //.....................
  void getUsercheff() async {
    //funcion que trae los datos filtrados usuarios cheff
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'cheff').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de cheff :..........$userinit');
      }
    }
    Cheff.add(userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data de nombres de cheff :.......$Cheff');
  }

  //....................................
  void getUserbarbershop() async {
    //funcion que trae los datos filtrados usuarios barberos
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'barbero').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de basrberos :..........$userinit');
      }
    }
    Barbershop.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data de nombres de barberos :.......$Barbershop');
  }

  //.......................
  void getUsercantante() async {
    //funcion que trae los datos filtrados usuarios cantante
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'cantante').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de cantantes:..........$userinit');
      }
    }
    Cantante.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data nonbres de cantantes :.......$Cantante');
  }

  //......................................
  void getUserfotografo() async {
    //funcion que trae los datos filtrados usuarios fotografo
    List userinit = [];

    CollectionReference coleccionDataFirebase =
        FirebaseFirestore.instance.collection("colaboradores");
    QuerySnapshot users =
        await coleccionDataFirebase.where("jobs", isEqualTo: 'fotografo').get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        userinit.add(doc.data());
        print('data de fotografos :..........$userinit');
      }
    }
    Fotografo.add(
        userinit.map((user) => user['names'] + ' ' + user['surnames']));
    print('data de nombres de fotografos :.......$Fotografo');
  }
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
              "James levi  " "\n" "Ramirez Roman",
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
            builder: ((context) => target_james()),
          ));
        });
  });
}
