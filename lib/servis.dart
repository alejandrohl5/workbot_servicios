import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workbot_servicios/Separaciones/Cliente/proPersonas.dart';
import 'package:workbot_servicios/src/bloc/auth_cubit.dart';
import 'package:workbot_servicios/victor_perfil.dart';
import 'package:workbot_servicios/src/repository/auth_repository.dart';
import 'rosario_formulario.dart';
import 'package:flutter/material.dart';

void main() => runApp(servicios_james());

class servicios_james extends StatelessWidget {
  static Widget create(BuildContext context) => servicios_james();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: ((previous, current) => current is AuthSingedIn),
        builder: (_, state) {
          final authUser = (state as AuthSingedIn).user;
          return MyHomePage(
            title: 'Servicios',
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _searchBoolean = false;
  String clickfin = '';
  List<int> _searchIndexList = [];

  List<String> _list = [
    'Electrisista',
    'Gasfitero',
    'Soldador',
    'Mecanico',
    'Carpintero',
    'Vidreria',
    'Fontaner',
    'Delivery',
    'Contador',
    'Abogado',
    'Odontologia',
    'Fisioterapeuta',
    'Enfermeria',
    'Veterinario',
    'Barman',
    'Animador',
    'Dj',
    'Pediatra',
    'Asesoramiento profesional',
    'Jardinero',
    'Cheff',
    'Barbershop',
    'Cantante',
    'Fotografo',
    'Pintor ',
  ];

  Widget _searchTextField() {
    return TextField(
      onChanged: (String s) {
        setState(() {
          _searchIndexList = [];
          for (int i = 0; i < _list.length; i++) {
            if (_list[i].contains(s)) {
              _searchIndexList.add(i);
            }
          }
        });
      },
      autofocus: true,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.white)),
        hintText: 'Search',
        hintStyle: const TextStyle(
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _searchListView() {
    return ListView.builder(
        itemCount: _searchIndexList.length,
        itemBuilder: (context, index) {
          index = _searchIndexList[index];
          var click = (_list[index].toString());

          return Card(
              child: ListTile(
                  title: Text(_list[index]),
                  onTap: () {
                    print('El usuario hizo click en $click');
                    clickfin = click;
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => Prueba())),
                    );
                    //return new cappturandoclic(clickfin);
                  }));
        });
  }

  Widget _defaultListView() {
    return ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          var click = (_list[index].toString());

          return Card(
              child: ListTile(
            title: Text(_list[index]),
            onTap: () {
              print('El usuario hizo click en $click');
              clickfin = click;
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Prueba())));
            },
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: !_searchBoolean ? Text(widget.title) : _searchTextField(),
            actions: !_searchBoolean
                ? [
                    IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            _searchBoolean = true;
                            _searchIndexList = [];
                          });
                        })
                  ]
                : [
                    IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchBoolean = false;
                          });
                        })
                  ]),
        body: !_searchBoolean ? _defaultListView() : _searchListView());
  }
}
