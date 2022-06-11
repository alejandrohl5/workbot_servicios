// ignore_for_file: camel_case_types
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:workbot_servicios/login_page.dart';
import 'package:workbot_servicios/rosario_formulario.dart';
import 'servis.dart';

class inicio_sesion extends StatelessWidget {
  const inicio_sesion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        FadeInDownBig(
          duration: const Duration(seconds: 2),
          // ignore: deprecated_member_use
          child: RaisedButton(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: const Text(
                "Crearse una cuenta",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 30.0,
            color: const Color.fromARGB(255, 5, 119, 212),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const formularioRosario()),
              ));
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ZoomIn(
            duration: const Duration(seconds: 2),
            // ignore: deprecated_member_use
            child: RaisedButton(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                child: const Text(
                  "iniciar Sesion",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 30.0,
              color: const Color.fromARGB(255, 5, 119, 212),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => LoginPage()),
                ));
              },
            )),
        const SizedBox(
          height: 20,
        ),
        FadeInUpBig(
            duration: const Duration(seconds: 2),
            // ignore: deprecated_member_use
            child: RaisedButton(
              child: Container(
                width: 290,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                child: const Center(
                  child: Text(
                    "Continuar",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 30.0,
              color: const Color.fromARGB(255, 5, 119, 212),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => servicios_james()),
                ));
              },
            ))
      ]),
    );
  }
}
