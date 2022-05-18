import 'package:flutter/material.dart';

class registro1 extends StatelessWidget {
  const registro1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workbot'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearInput1(),
            SizedBox(height: 20,),
            _crearInput2(),
            SizedBox(height: 20,),
            _crearInput3(),
            SizedBox(height: 20,),
            _crearInput4(),
            SizedBox(height: 20,),
            _crearInput5(),
          SizedBox(height: 10,),

          FlatButton(
            onPressed: (){},
            color: Colors.blue,
            child: Text('acepto', style: TextStyle(color: Colors.white),),
          )


          ],
        ),
      ),
    );
  }



Widget _crearInput1(){
  return Container(
    padding: EdgeInsets.all(15),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'ingrese su nombre',
        hintText: 'Nombre'
      ),
    ),
  );
}


Widget _crearInput2(){
  return Container(
    padding: EdgeInsets.all(15),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'ingrese su apellido',
        hintText: 'Apellido'
      ),
    ),
  );
}



Widget _crearInput3(){
  return Container(
    padding: EdgeInsets.all(15),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'ingrese su edad',
        hintText: 'edad'
      ),
    ),
  );
}



Widget _crearInput4(){
  return Container(
    padding: EdgeInsets.all(15),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'ingrese su telefono',
        hintText: 'telefono'
      ),
    ),
  );
}




Widget _crearInput5(){
  return Container(
    padding: EdgeInsets.all(15),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'ingrese su dirección',
        hintText: 'Dirección'
      ),
    ),
  );
}


Widget _crearInput6(){
  return Container(
    padding: EdgeInsets.all(15),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'experiencia laboral',
        hintText: 'Experiencia'
      ),
    ),
  );
}



}

