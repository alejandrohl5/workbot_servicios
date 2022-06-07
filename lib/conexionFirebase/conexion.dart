import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void conexion() {
  WidgetsFlutterBinding
      .ensureInitialized(); //se asegura que todas las dependencias de fluter esten inicilaizadas antes de comenzar
  Firebase.initializeApp().then((value) {
    //runApp(MyApp());
  });
}
