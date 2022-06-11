// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class registro1 extends StatelessWidget {
  const registro1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workbot'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearInput1(),
            const SizedBox(
              height: 20,
            ),
            _crearInput2(),
            const SizedBox(
              height: 20,
            ),
            _crearInput3(),
            const SizedBox(
              height: 20,
            ),
            _crearInput4(),
            const SizedBox(
              height: 20,
            ),
            _crearInput5(),
            const SizedBox(
              height: 10,
            ),
            _crearInput6(),

            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {},
              color: Colors.blue,
              child: const Text(
                'acepto',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _crearInput1() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        decoration: const InputDecoration(
            labelText: 'ingrese su nombre', hintText: 'Nombre'),
      ),
    );
  }

  Widget _crearInput2() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        decoration: const InputDecoration(
            labelText: 'ingrese su apellido', hintText: 'Apellido'),
      ),
    );
  }

  Widget _crearInput3() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        decoration: const InputDecoration(
            labelText: 'ingrese su edad', hintText: 'edad'),
      ),
    );
  }

  Widget _crearInput4() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        decoration: const InputDecoration(
            labelText: 'ingrese su telefono', hintText: 'telefono'),
      ),
    );
  }

  Widget _crearInput5() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        decoration: const InputDecoration(
            labelText: 'ingrese su dirección', hintText: 'Dirección'),
      ),
    );
  }

  Widget _crearInput6() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        decoration: const InputDecoration(
            labelText: 'experiencia laboral', hintText: 'Experiencia'),
      ),
    );
  }
}
