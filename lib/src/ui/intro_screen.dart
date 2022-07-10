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
  final String exampleText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  @override
  Widget build(BuildContext context) {
    return PageIndicatorContainer(
      child: PageView(
        children: [
          _descriptionPage(
            text: exampleText,
            imagePath:
                'https://img.freepik.com/vector-gratis/trabajadores-profesionales-dibujos-animados-dia-trabajo_18591-56737.jpg',
          ),
          _descriptionPage(
            text: exampleText,
            imagePath:
                'https://img.freepik.com/vector-gratis/persona-habla-telefono-movil-hombre-feliz-habla-telefono-inteligente-sonriendo-gesticulando-chico-riendo-llamada-telefono-celular-ilustracion-vector-plano-comunicacion-telefonica-aislada-sobre-fondo-blanco_633472-42.jpg?w=2000',
          ),
          _descriptionPage(
            text: exampleText,
            imagePath:
                'https://png.pngtree.com/png-vector/20190119/ourlarge/pngtree-yellow-ring-the-doorbell-doorbell-the-man-png-image_478062.jpg',
          ),
          _descriptionPage(
            text: exampleText,
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
