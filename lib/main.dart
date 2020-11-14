import 'package:flutter/material.dart';
import 'package:login2/src/Blocs/providers.dart';
import 'package:login2/src/paginas/home.dart';
import 'package:login2/src/paginas/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'El Trabajo Deseado',
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => LoginPagina(),
          'home': (BuildContext context) => HomePagina()
        },
        theme: ThemeData(primaryColor: Color.fromARGB(255, 8, 207, 32)),
      ),
    );
  }
}
