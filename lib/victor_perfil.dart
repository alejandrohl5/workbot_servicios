import 'package:flutter/material.dart';


class perfil extends StatelessWidget {
  const perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Workbot'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            perfil1(),
            botonGuardarCambios()
          ],
        ),
      ),
    );
  
  }


Widget perfil1(){
  return SingleChildScrollView(
    child: Row(
      children: <Widget>[
        Divider(indent: 4,),
        SizedBox(
  
          height:400,
          width: 200,
          child: Container(
          
        
            child: Image.asset('assets/prueba.jpg',),
          ),
        ),
        
        SizedBox(
          height: 320,
          width: 200,
  
              child: SingleChildScrollView(
              
                child: Column(
                  
                    children: <Widget>[
                    
                      _perfilUsuario(),
                      SizedBox(height: 2,),
                      _edad(),
                      SizedBox(height: 2,),
                      _telefono(),
                      SizedBox(height: 2,),
                      _email(),
                      SizedBox(height: 2,),
                      _distrito(),
                      SizedBox(height: 2,),
                      _experiencia(),
                      
                      
                    ],
                  ),
              ),
                )
              ]
              ),
  );
    
          
}


Container _perfilUsuario(){
  return Container(         
          decoration: BoxDecoration(border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(10)
          ),          
          child: TextFormField(
            style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Victor Alejandro'
          ),
        ),            
  );
}


Container _edad(){
  return Container(         
          decoration: BoxDecoration(border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(10)
          ),          
          child: TextFormField(
            style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
          
            border: InputBorder.none,
            hintText: '25'
          ),
        ),            
  );
}



Container _telefono(){
  return Container(         
          decoration: BoxDecoration(border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(10)
          ),          
          child: TextFormField(
            style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '959150750'
          ),
        ),            
  );
}


Container _email(){
  return Container(         
          decoration: BoxDecoration(border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(10)
          ),          
          child: TextFormField(
            style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '76087583@certus.edu.pe'
          ),
        ),            
  );
}


Container _distrito(){
  return Container(         
          decoration: BoxDecoration(border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(10)
          ),          
          child: TextFormField(
            
            style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
          
            border: InputBorder.none,
            hintText: 'San de Lurigancho'
          ),
        ),            
  );
}

Container _experiencia(){
  return Container(         
          decoration: BoxDecoration(border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(10)
          ),          
          child: TextFormField(
            style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'construcción civil,mecánico, delivery',
            
          ),
        ),            
  );
}




}

class botonGuardarCambios extends StatelessWidget {
  const botonGuardarCambios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlatButton(
            onPressed: (){},
            color: Colors.blue,
            child: Text('guardar cambios', style: TextStyle(color: Colors.white),),
          )
      ],
    );
  }
}