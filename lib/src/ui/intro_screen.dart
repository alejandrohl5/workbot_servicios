import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:workbot_servicios/introducccion.dart';
import 'package:workbot_servicios/src/bloc/auth_cubit.dart';

class IntroScreen extends StatelessWidget {
  static Widget create(BuildContext context) => IntroScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _IntroPager(),
    );
  }
}

class _IntroPager extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return PageIndicatorContainer(
      child: PageView(
        children: [
          _descriptionPage(
            text: "Bienvenido a Workbot-Services"
                "\n"
                "\n"
                "Una app con fines de fomentar la laboralidad de los ciudadanos peruanos",
            imagePath:
                'https://img.freepik.com/vector-gratis/trabajadores-profesionales-dibujos-animados-dia-trabajo_18591-56737.jpg',
          ),
          _descriptionPage(
            text:
                "En nuestra app se podra contactar con una gran variedad de profesionales, que estaran muy capacitados para poder resolver sus inconvenientes o problemas.",
            imagePath:
                'https://img.freepik.com/vector-gratis/persona-habla-telefono-movil-hombre-feliz-habla-telefono-inteligente-sonriendo-gesticulando-chico-riendo-llamada-telefono-celular-ilustracion-vector-plano-comunicacion-telefonica-aislada-sobre-fondo-blanco_633472-42.jpg?w=2000',
          ),
          _descriptionPage(
            text:
                "Ademas la app cuenta con la opcion de que usted tambien puede ofrecer su servicio al publico, con la opcion 'Trabajador', la cual le brinda funcionalidades unicas en nuestra app",
            imagePath:
                'https://png.pngtree.com/png-vector/20190119/ourlarge/pngtree-yellow-ring-the-doorbell-doorbell-the-man-png-image_478062.jpg',
          ),
          _descriptionPage(
            text:
                "Nuestra vision como desarrolladores es el fomentar a profesionales con poca o mucha experiencia, con el fin de que avancen en el mundo laboral y se conviertan en grandes profesionales",
            imagePath:
                'https://png.pngtree.com/png-vector/20190130/ourlarge/pngtree-office-worker-shaking-hands-talking-decorative-elements-withsuitwhite-collaroffice-workerbackpackhand-png-image_594904.jpg',
          ),
          PageLogin()
        ],
      ),
      length: 5,
      align: IndicatorAlign.bottom,
      indicatorSpace: 15,
      indicatorSelectorColor: Colors.grey,
      indicatorColor: Colors.blueGrey,
    );
  }
}

class _descriptionPage extends StatelessWidget {
  final String text;
  final String imagePath;
  const _descriptionPage({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(55),
      child: Column(
        children: [
          Image.network(
            imagePath,
            width: 200,
            height: 200,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _loginpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
