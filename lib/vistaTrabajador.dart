import 'package:flutter/material.dart';
import 'package:workbot_servicios/victor_perfil.dart';

class vistaTrabajadores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workbot',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Workbot'),
        ),
        body: ListView(
          children: [fotoDatos()],
        ),
      ),
    );
  }
}

class fotoDatos extends StatelessWidget {
  const fotoDatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [cuadro()],
    );
  }
}

Widget cuadro() {
  return Column(
    children: [
      _perfilUsuario(),
      _edad(),
      _telefono(),
      _email(),
      _distrito(),
      _experiencia()
    ],
  );
}

Container _perfilUsuario() {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10)),
    child: TextFormField(
      style: const TextStyle(fontSize: 15),
      decoration: const InputDecoration(
          border: InputBorder.none, hintText: 'Victor Alejandro'),
    ),
  );
}

Container _edad() {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10)),
    child: TextFormField(
      style: const TextStyle(fontSize: 15),
      decoration:
          const InputDecoration(border: InputBorder.none, hintText: '25'),
    ),
  );
}

Container _telefono() {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10)),
    child: TextFormField(
      style: const TextStyle(fontSize: 15),
      decoration: const InputDecoration(
          border: InputBorder.none, hintText: '959150750'),
    ),
  );
}

Container _email() {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10)),
    child: TextFormField(
      style: const TextStyle(fontSize: 15),
      decoration: const InputDecoration(
          border: InputBorder.none, hintText: '76087583@certus.edu.pe'),
    ),
  );
}

Container _distrito() {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10)),
    child: TextFormField(
      style: const TextStyle(fontSize: 15),
      decoration: const InputDecoration(
          border: InputBorder.none, hintText: 'San de Lurigancho'),
    ),
  );
}

Container _experiencia() {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10)),
    child: TextFormField(
      style: const TextStyle(fontSize: 16),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'construcción civil,mecánico, delivery',
      ),
    ),
  );
}
