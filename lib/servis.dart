import 'package:flutter/material.dart';

class servicios_james extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Países',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(title: Text('Países')),
            body: new ListView(children: [
              _buildItem('Electrisista'),
              _buildItem('Gasfitero'),
              _buildItem('Soldador'),
              _buildItem('Mecanico'),
              _buildItem('Carpintero'),
              _buildItem('Vidreria'),
              _buildItem('Fontaner'),
              _buildItem('Delivery'),
              _buildItem('Contador'),
              _buildItem('Abogado'),
              _buildItem('Odontologia'),
              _buildItem('Fisioterapeuta'),
              _buildItem('Enfermeria'),
              _buildItem('Veterinario'),
              _buildItem('Barman'),
              _buildItem('Animador'),
              _buildItem('Dj'),
              _buildItem('Pediatra'),
              _buildItem('Asesoramiento profesional'),
              _buildItem('Jardinero'),
              _buildItem('Cheff'),
              _buildItem('Barbershop'),
              _buildItem('Cantante'),
              _buildItem('Fotografo'),
              _buildItem('Pintor '),
            ])));
  }
}

Widget _buildItem(String textTitle) {
  return new ListTile(
    title: Text(textTitle),
    // leading: Icon(Icons.face),
    onTap: () {
      print(textTitle);
    },
  );
}
