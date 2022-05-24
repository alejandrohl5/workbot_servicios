import 'package:flutter/material.dart';
import 'servis.dart';

class formularioRosario extends StatelessWidget {
  const formularioRosario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearFormulario1(),
            SizedBox(height: 20,),
            _crearFormulario2(),
            SizedBox(height: 20,),
            _crearFormulario3(),
            SizedBox(height: 20,),
            _crearFormulario4(),
            SizedBox(height: 20,),
            _crearFormulario5(),
          SizedBox(height: 10,),

          FlatButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=> servicios_james(),
              ));
            },
            color: Colors.blue,
            child: Text('Registrarse', style: TextStyle(color: Colors.white),),
          )


          ],
        ),
      ),
    );
  }



Widget _crearFormulario1(){
  return Container(
    padding: EdgeInsets.all(15),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'nombre',
        hintText: 'Escriba su nombre'
      ),
    ),
  );
}


Widget _crearFormulario2(){
  return Container(
    padding: EdgeInsets.all(15),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'ciudad',
        hintText: 'Escriba su ciudad'
      ),
    ),
  );
}



Widget _crearFormulario3(){
  return Container(
    padding: EdgeInsets.all(15),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'E-mail',
        hintText: 'ingrese su correo'
      ),
    ),
  );
}



Widget _crearFormulario4(){
  return Container(
    padding: EdgeInsets.all(15),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'telefono',
        hintText: 'Ingrese su telefono'
      ),
    ),
  );
}




Widget _crearFormulario5(){
  return Container(
    padding: EdgeInsets.all(15),
    child: TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'contraseña',
        hintText: 'Ingrese una contraseña'
      ),
    ),
  );
}
}


