import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:workbot_servicios/login_page.dart';
import 'login_page.dart';
import 'servis.dart';

class inicio_sesion extends StatelessWidget {
  const inicio_sesion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          
        FadeInDownBig(duration:Duration(seconds: 2),
            child: RaisedButton(
    
          child:Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal:40, vertical: 20),
            child: Text("Crearse una cuenta",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(10) 
            ),
            elevation: 30.0,
            color: Color.fromARGB(255, 5, 119, 212),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder:((context)=> LoginPage()),
              
              ));
            },
        ),),
        
        
        SizedBox(height: 20,),


        
        FadeInUpBig(duration:Duration(seconds: 2),
          child: RaisedButton(
          child:Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal:70, vertical: 20),
            child: Text("iniciar Sesion",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(10) 
            ),
            elevation: 30.0,
            color: Color.fromARGB(255, 5, 119, 212),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder:((context)=> servicios_james()),
              
              ));
            },
        ))
        ]
      ),
    );
  }


  }
