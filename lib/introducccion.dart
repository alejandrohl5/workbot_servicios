import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workbot_servicios/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workbot_servicios/src/bloc/auth_cubit.dart';
import 'package:workbot_servicios/src/navigation/routes.dart';

class PageLogin extends StatefulWidget {
  static Widget create(BuildContext context) => PageLogin();
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? validatore(String? value) {
    return (value == null || value.isEmpty)
        ? 'Es importante completar esta seccion'
        : null;
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
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _emailController,
            validator: validatore,
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
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _passwordController,
            validator: validatore,
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

  Widget _btncontrasena() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Presiones el boton si olvido su contraseña'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          '¿Has olvidado tu contraseña?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _butonlogin() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) ;
          context.read<AuthCubit>().signInWithEmailAndPassword(
              _emailController.text, _passwordController.text);
        },
        child: Text(
          "Iniciar Sesion",
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

  Widget _textregistro() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Inicia Sesion con',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _btnsocial(onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _btnrowsocial() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _btnsocial(
            () => context.read<AuthCubit>().signInWithFacebook(),
            AssetImage(
              'assets/facebook.jpg',
            ),
          ),
          _btnsocial(
            () => context.read<AuthCubit>().signInWithGoogle(),
            AssetImage(
              'assets/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _registrarbtn() {
    return GestureDetector(
      onTap: () {
        context.read<AuthCubit>().reset();
        Navigator.pushNamed(context, Routes.registro);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '¿No tienes una cuenta? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Registrate',
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
                                'Inicio Sesion',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Open Sans',
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              _email(),
                              SizedBox(
                                height: 20.0,
                              ),
                              _contrasena(),
                              _btncontrasena(),
                              _butonlogin(),
                              _textregistro(),
                              _btnrowsocial(),
                              _registrarbtn(),
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
