import 'package:flutter/material.dart';
//import 'Pages/DetailPage.dart';
import 'Pages/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
       // '/detail': (context) => DetailPage(),
        // Añade las demás rutas aquí
      },
    );
  }
}
