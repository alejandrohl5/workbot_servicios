// ignore_for_file: camel_case_types, avoid_unnecessary_containers
import 'package:flutter/material.dart';

class perfil extends StatelessWidget {
  const perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workbot'),
      ),
      body: ListView(
        children: [
          buttonsUp(),
          imagenPerfil(),
          perfil1(),
          const botonGuardarCambios(),
        ],
      ),
    );
  }

  Container buttonsUp() {
    return Container(
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 40)),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          buttonLeft(),
          const SizedBox(
            width: 130,
          ),
          buttonright(),
        ],
      ),
    );
  }

  Widget buttonLeft() {
    // ignore: deprecated_member_use
    return RaisedButton(
        child: Container(
          child: const Text(
            "Regresar",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        onPressed: () {});
  }

  Widget buttonright() {
    // ignore: deprecated_member_use
    return RaisedButton(
        child: Container(
          child: const Text(
            "Cambiar imagen",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        onPressed: () {});
  }
}

Widget imagenPerfil() {
  return Center(
      child: ClipRRect(
    borderRadius: BorderRadius.circular(60),
    child: Image.asset(
      'assets/prueba.jpg',
      width: 200,
    ),
  ));
}

Widget perfil1() {
  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(children: <Widget>[
      SizedBox(
        height: 215,
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _crearInput1(),
              const SizedBox(
                height: 5,
              ),
              _crearInput2(),
              const SizedBox(
                height: 5,
              ),
              _crearInput3(),
              const SizedBox(
                height: 5,
              ),
              _crearInput4(),
              const SizedBox(
                height: 5,
              ),
              _crearInput5(),
              const SizedBox(
                height: 5,
              ),
              _crearInput6(),
            ],
          ),
        ),
      )
    ]),
  );
}

/* Container _perfilUsuario() {
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
} */

Widget _crearInput1() {
  return Container(
    padding: const EdgeInsets.all(5),
    child: TextFormField(
      decoration: const InputDecoration(
          labelText: 'ingrese su nombre', hintText: 'Nombre'),
    ),
  );
}

Widget _crearInput2() {
  return Container(
    padding: const EdgeInsets.all(5),
    child: TextFormField(
      decoration: const InputDecoration(
          labelText: 'ingrese su apellido', hintText: 'Apellido'),
    ),
  );
}

Widget _crearInput3() {
  return Container(
    padding: const EdgeInsets.all(5),
    child: TextFormField(
      decoration:
          const InputDecoration(labelText: 'ingrese su edad', hintText: 'edad'),
    ),
  );
}

Widget _crearInput4() {
  return Container(
    padding: const EdgeInsets.all(5),
    child: TextFormField(
      decoration: const InputDecoration(
          labelText: 'ingrese su telefono', hintText: 'telefono'),
    ),
  );
}

Widget _crearInput5() {
  return Container(
    padding: const EdgeInsets.all(5),
    child: TextFormField(
      decoration: const InputDecoration(
          labelText: 'ingrese su dirección', hintText: 'Dirección'),
    ),
  );
}

Widget _crearInput6() {
  return Container(
    padding: const EdgeInsets.all(5),
    child: TextFormField(
      decoration: const InputDecoration(
          labelText: 'experiencia laboral', hintText: 'Experiencia'),
    ),
  );
}

class botonGuardarCambios extends StatelessWidget {
  const botonGuardarCambios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {},
          color: Colors.blue,
          child: const Text(
            'guardar cambios',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
