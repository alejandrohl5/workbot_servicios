import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workbot_servicios/src/bloc/auth_cubit.dart';
import 'package:workbot_servicios/src/navigation/routes.dart';
import 'package:workbot_servicios/src/ui/intro_screen.dart';

final _navigatoryKey = GlobalKey<NavigatorState>();

class inicio extends StatelessWidget {
  static Widget create() {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignedOut) {
          _navigatoryKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.intro, (route) => false);
        } else if (state is AuthSingedIn) {
          _navigatoryKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.home, (route) => false);
        }
      },
      child: inicio(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatoryKey,
      onGenerateRoute: Routes.routes,
      title: 'Worbot',
      debugShowCheckedModeBanner: false,
    );
  }
}
