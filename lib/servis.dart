import 'package:flutter/material.dart';
import 'rosario_formulario.dart';

void main() => runApp(new servicios_james());

class servicios_james extends StatefulWidget {
  @override
  State<servicios_james> createState() => _servicios_jamesState();
}

Widget barradebusqueda(String title, Function startSearchFunction) {
  return AppBar(
    title: Text(title),
    actions: <Widget>[
      IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            startSearchFunction();
          }),
    ],
  );
}

class _servicios_jamesState extends State<servicios_james> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Países',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Servicios'),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      //startSearchFunction();
                    }),
              ],
            ),
            body: ListView(children: [
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
  return ListTile(
    title: Text(textTitle),
    // leading: Icon(Icons.face),
    onTap: () {
      print(textTitle);
    },
  );
}
