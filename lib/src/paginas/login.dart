// import 'dart:js';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login2/src/Blocs/providers.dart';

class LoginPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _heigth = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 250, 255, 246),
        body: Stack(
          children: <Widget>[
            fondo(_width, _heigth),
            login(context, _width, _heigth)
          ],
        ));
  }

  fondo(width, heigth) {
    final fondo = Container(
      height: heigth * 0.45,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color.fromARGB(255, 8, 207, 32),
            Color.fromARGB(255, 46, 243, 66),
            Color.fromARGB(255, 76, 253, 99)
          ]),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0))),
    );

    final circulo = Container(
      height: width * 0.20,
      width: width * 0.200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            width * 0.200,
          ),
          color: Color.fromARGB(70, 255, 255, 255)),
    );

    return Stack(
      children: [
        fondo,
        Positioned(top: heigth * 0.10, left: width * 0.05, child: circulo),
        Positioned(top: -0.05 * heigth, left: width * 0.86, child: circulo),
        Positioned(top: 0.15 * heigth, left: width * 0.53, child: circulo),
        Positioned(top: 0.32 * heigth, left: width * 0.15, child: circulo),
        Container(
          padding: EdgeInsets.symmetric(vertical: heigth * 0.070),
          // decoration: BoxDecoration(color: Clors.red),
          child: Column(
            children: [
              Icon(
                Icons.account_circle_sharp,
                color: Color.fromARGB(255, 255, 255, 255),
                size: heigth * 0.10,
              ),
              SizedBox(height: 10.0, width: double.infinity),
              Text(
                'El Trabajo Deseado.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: heigth * 0.04,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20, width: double.infinity),
              Container(
                padding: EdgeInsets.only(left: width * 0.040),
                child: Text(
                  'Seremos el puente entre las personas que están buscando "El Trabajo Deseado" y las Empresas.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: heigth * 0.022,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget login(BuildContext context, width, heigth) {
    final bloc = Provider.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: heigth * 0.38,
            ),
          ),
          Container(
            width: width * 0.85,
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            padding: EdgeInsets.symmetric(vertical: heigth * 0.05),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 255, 246),
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0),
                ]),
            child: Column(
              children: [
                Text(
                  'Ingreso ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 8, 207, 32),
                      fontWeight: FontWeight.bold,
                      fontSize: heigth * 0.03),
                ),
                SizedBox(
                  height: heigth * 0.005,
                ),
                InputEmail(width, heigth, bloc),
                SizedBox(
                  height: heigth * 0.02,
                ),
                InputContrasenia(width, heigth, bloc),
                SizedBox(
                  height: heigth * 0.02,
                ),
                BotonIngresar(context, width, heigth, bloc),
                SizedBox(
                  height: heigth * 0.02,
                ),
                BotonCrearCuenta(width, heigth)
              ],
            ),
          ),
          SizedBox(
            height: heigth * 0.02,
          ),
          GestureDetector(
            child: Text(
              '¿Olvidó la contraseña? Click aquí',
              style: TextStyle(fontSize: heigth * 0.020),
            ),
            onTap: () {
              // print('Hola Mundo');
            },
          ),
          SizedBox(
            height: heigth * 0.07,
          )
        ],
      ),
    );
  }

  InputEmail(width, heigth, LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              errorText: snapshot.error,
              labelText: 'CORREO',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: heigth * 0.020,
                color: Colors.grey,
              ),
              // focusedBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(
              //     color: Color.fromARGB(255, 8, 207, 32),
              //   ),
              // ),
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  InputContrasenia(width, heigth, LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.contraseniaStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              counterText: "*",
              errorText: snapshot.error,
              labelText: 'CONTRASEÑA',
              labelStyle: TextStyle(
                // fontFamily: 'Monserrat',
                fontWeight: FontWeight.bold,
                fontSize: heigth * 0.020,
                color: Colors.grey,
              ),
              // focusedBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(
              //     color: Color.fromARGB(255, 8, 207, 32),
              //   ),
              // ),
            ),
            onChanged: bloc.changeContrasenia,
          ),
        );
      },
    );
  }

  BotonIngresar(BuildContext context, width, height, bloc) {
    // habilitarBoton

    return StreamBuilder(
      stream: bloc.habilitarBoton,
      builder: (context, snapshot) {
        return RaisedButton(
            shape: StadiumBorder(),
            color: Color.fromARGB(255, 8, 207, 32),
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.02, horizontal: width * 0.23),
              decoration: BoxDecoration(),
              child: Text(
                'Ingresar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: height * 0.025,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: snapshot.hasData ? () {} : null);
      },
    );
  }

  BotonCrearCuenta(width, heigth) {
    return RaisedButton(
      shape: StadiumBorder(),
      color: Color.fromARGB(255, 8, 207, 32),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: heigth * 0.02, horizontal: width * 0.18),
        decoration: BoxDecoration(),
        child: Text(
          'Crear Cuenta',
          style: TextStyle(
              color: Colors.white,
              fontSize: heigth * 0.025,
              fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () {},
    );
  }
}
