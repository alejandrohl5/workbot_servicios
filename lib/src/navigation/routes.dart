import 'package:flutter/material.dart';
import 'package:workbot_servicios/introducccion.dart';
import 'package:workbot_servicios/registro.dart';
import 'package:workbot_servicios/servis.dart';
import 'package:workbot_servicios/src/ui/intro_screen.dart';
import 'package:workbot_servicios/src/ui/splash_screen.dart';

class Routes {
  static const splash = '/';
  static const intro = '/intro';
  static const home = '/home';
  static const login = '/login';
  static const registro = '/registro';
  static const perfil = '/perfil';

  static Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return _buildRoute(SplashScreen.create);
      case intro:
        return _buildRoute(IntroScreen.create);
      case home:
        return _buildRoute(servicios_james.create);
      case login:
        return _buildRoute(PageLogin.create);
      case registro:
        return _buildRoute(registroLogin.create);
      default:
        throw Exception('Route does not exists');
    }
  }

  static MaterialPageRoute _buildRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}
