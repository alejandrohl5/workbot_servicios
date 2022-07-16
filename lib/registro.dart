import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workbot_servicios/constants.dart';
import 'package:workbot_servicios/src/bloc/auth_cubit.dart';
import 'package:workbot_servicios/src/navigation/routes.dart';

class registroLogin extends StatefulWidget {
  static Widget create(BuildContext context) => registroLogin();
  @override
  _registroLogin createState() => _registroLogin();
}

class _registroLogin extends State<registroLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  String? emailvalidator(String? value) {
    return (value == null || value.isEmpty)
        ? 'Es importante completar esta seccion'
        : null;
  }

  String? passwordvalidator(String? value) {
    if (value == null || value.isEmpty)
      return 'Es importante completar esta seccion';
    if (value.length < 8) return 'La contraseña debe tener minimo 8 caracteres';
    if (_passwordController.text != _repeatPasswordController.text)
      return 'La contraseña no coinciden';
    return null;
  }

  Widget _email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Correo Electronico:',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 25.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _emailController,
            validator: emailvalidator,
            obscureText: false,
            autocorrect: !false,
            enableSuggestions: !false,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white, fontFamily: 'Open Sans'),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.white,
              ),
              hintText: 'Ingrese un Correo Electronico',
              hintStyle: kHintTextStyle,
              fillColor: Colors.white.withOpacity(0.3),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _contrasena() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Contraseña',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 25.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _passwordController,
            validator: passwordvalidator,
            obscureText: true,
            autocorrect: !true,
            enableSuggestions: !true,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white, fontFamily: 'Open Sans'),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.white,
              ),
              hintText: 'Ingrese un contraseña',
              hintStyle: kHintTextStyle,
              fillColor: Colors.white.withOpacity(0.3),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _Repeatcontrasena() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Repite Contraseña',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 25.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _repeatPasswordController,
            validator: passwordvalidator,
            obscureText: true,
            autocorrect: !true,
            enableSuggestions: !true,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white, fontFamily: 'Open Sans'),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: Colors.white,
              ),
              hintText: 'Vuelva a Ingresar la Contraseña',
              hintStyle: kHintTextStyle,
              fillColor: Colors.white.withOpacity(0.3),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _logearbtn() {
    return GestureDetector(
      onTap: () {
        context.read<AuthCubit>().reset();
        Navigator.pushNamed(context, Routes.login);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '¿Ya tiene una cuenta? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Inicie Sesion',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonregistro() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) ;
          context.read<AuthCubit>().createUserWithEmailAndPassword(
              _emailController.text, _passwordController.text);
        },
        child: Text(
          "Registrarse",
          style: TextStyle(
            color: Color(0xff527daa),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open Sans',
          ),
        ),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (_, state) {
          return Form(
            key: _formKey,
            child: Scaffold(
              body: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff73aef5),
                              Color(0xff61a4f1),
                              Color(0xff478de0),
                              Color(0xff398ae5),
                            ],
                            stops: [0.1, 0.4, 0.7, 0.9],
                          ),
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 120.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Registrate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Open Sans',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              _email(),
                              SizedBox(
                                height: 20.0,
                              ),
                              _contrasena(),
                              SizedBox(
                                height: 20.0,
                              ),
                              _Repeatcontrasena(),
                              _buttonregistro(),
                              _logearbtn(),
                              if (state is AuthSigninIn)
                                Center(
                                  child: CircularProgressIndicator(),
                                ),
                              if (state is AuthError)
                                AlertDialog(
                                  content: Text(state.mesage),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
