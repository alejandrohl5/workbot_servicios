import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:workbot_servicios/introducccion.dart';
import 'package:workbot_servicios/constants.dart';
import 'package:workbot_servicios/servis.dart';
import 'package:workbot_servicios/src/bloc/auth_cubit.dart';

class registroLogin extends StatefulWidget {
  @override
  _registroLogin createState() => _registroLogin();
}

class _registroLogin extends State<registroLogin> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nombreTextController = TextEditingController();

  Widget _nombre() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nombre',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: reusable('Nombre', 'Ingrese su Nombre', Icons.person, false,
              _nombreTextController),
        ),
      ],
    );
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
          child: reusable('Correo Electronico', 'Ingrese un Correo Electronico',
              Icons.email_outlined, false, _emailTextController),
        ),
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
            child: reusable('Contraseña', 'Ingrese una Contraseña',
                Icons.lock_outline, true, _passwordTextController)),
      ],
    );
  }

  Widget _textregistro() {
    return Column(
      children: <Widget>[
        Text(
          '- O -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Registrese con',
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
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _btnsocial(
            () => print('Registrese con Facebook'),
            AssetImage(
              'assets/facebook.jpg',
            ),
          ),
          _btnsocial(
            user != null
                ? null
                : () async {
                    await _googleSignIn.signIn().then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => servicios_james())));
                  },
            AssetImage(
              'assets/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _logearbtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageLogin()));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (_, state) {
          return Scaffold(
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
                            _nombre(),
                            SizedBox(
                              height: 20.0,
                            ),
                            _email(),
                            SizedBox(
                              height: 20.0,
                            ),
                            _contrasena(),
                            firebaseUIButton(context, 'Registrate', () {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _emailTextController.text,
                                      password: _passwordTextController.text)
                                  .then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            servicios_james()));
                              }).onError((error, stackTrace) {
                                print("Error ${error.toString()}");
                              });
                            }),
                            _textregistro(),
                            _btnrowsocial(),
                            _logearbtn()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
