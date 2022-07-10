import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workbot_servicios/src/bloc/auth_cubit.dart';
import 'package:workbot_servicios/src/repository/auth_repository.dart';

class HomeScreen extends StatelessWidget {
  static Widget create(BuildContext context) => HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page')),
      body: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: ((previous, current) => current is AuthSingedIn),
        builder: (_, state) {
          final authUser = (state as AuthSingedIn).user;
          return Center(
              child: Column(
            children: [
              Text('User: ${authUser.email}'),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () => context.read<AuthCubit>().signOut(),
                child: Text('Cerrar sesion'),
              ),
            ],
          ));
        },
      ),
    );
  }
}
