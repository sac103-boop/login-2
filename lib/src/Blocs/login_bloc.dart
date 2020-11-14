import 'dart:async';

import 'package:login2/src/Blocs/validadores.dart';

import 'package:rxdart/rxdart.dart';

class LoginBloc with Validadores {
  // final _emailValidacion = StreamController<String>.broadcast(); sin rxdart
  // final _contraseniaValidacion = StreamController<String>.broadcast();

  final _emailValidacion = BehaviorSubject<String>(); //con rxdart
  final _contraseniaValidacion = BehaviorSubject<String>();
  //Recuperar los datos del sistema

  Stream<String> get emailStream => _emailValidacion.stream.transform(vemail);
  Stream<String> get contraseniaStream =>
      _contraseniaValidacion.stream.transform(contrasenia);

  Stream<bool> get habilitarBoton =>
      Rx.combineLatest2(emailStream, contraseniaStream, (e, p) => true);

  //insertar valores al Stream
  Function(String) get changeEmail => _emailValidacion.sink.add;
  Function(String) get changeContrasenia => _contraseniaValidacion.sink.add;

  dispose() {
    _emailValidacion?.close();
    _contraseniaValidacion?.close();
  }
}
