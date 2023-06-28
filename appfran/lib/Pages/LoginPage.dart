import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'DetailPage2.dart';
import 'navbarPages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _formattedDate = DateFormat('hh:mm a').format(DateTime.now());

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(minutes: 1), (Timer t) => _getTime());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _getTime() {
    final String formattedDateTime =
        DateFormat('hh:mm a').format(DateTime.now()).toString();
    setState(() {
      _formattedDate = formattedDateTime;
    });
  }
void _login() {
  if (_formKey.currentState != null) {
    _formKey.currentState!.save();

    // Obtener la hora actual
    DateTime now = DateTime.now();

    // Definir las horas de inicio y fin
    DateTime morningStart = DateTime(now.year, now.month, now.day, 9); // 7 AM
    DateTime morningEnd = DateTime(now.year, now.month, now.day, 10); // 8 AM
    DateTime eveningStart = DateTime(now.year, now.month, now.day, 12); // 10 PM
    DateTime eveningEnd = DateTime(now.year, now.month, now.day, 23); // 11 PM

    // Comprobar si la hora actual está en el rango permitido
    if ((now.isAfter(morningStart) && now.isBefore(morningEnd)) || 
        (now.isAfter(eveningStart) && now.isBefore(eveningEnd))) {
      if (_email == 'admin' && _password == '123') {
        print('Acceso exitoso');
        // Si es por la mañana
        if(now.isBefore(morningEnd)) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPageTwo()),
          );
        }
        // Si es por la noche
        else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPageTwo()),
          );
        }
      } else {
        print('Credenciales incorrectas');
      }
    } else {
      print(
          'No puedes iniciar sesión a esta hora. Por favor, intenta de nuevo entre las 7 AM y las 8 AM o entre las 10 PM y las 11 PM.');
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarPages(_formattedDate),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menú'),
              decoration: BoxDecoration(
                color: Color.fromRGBO(63, 210, 199, 0.99),
              ),
            ),
            ListTile(
              title: Text('Opción 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Opción 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Libreta Electrónica',
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Column(
                    children: [
                      Text(
                        'M003: Izobamba',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[600]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jorge Benalcazar',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 100.0,
                    left: 30.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50.0),
                      Text(
                        'Ingresar',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 15.0),
                            Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                      fontSize: 20,
                                    ),
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.all(10)),
                                onSaved: (value) => _email = value ?? "",
                              ),
                            ),
                            SizedBox(height: 25.0),
                            //SizedBox(height: 15.0),
                            Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Clave',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                                obscureText: true,
                                onSaved: (value) => _password = value ?? "",
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              alignment: AlignmentDirectional.centerEnd,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                                child: Text('Forgot your password'),
                                onPressed: () {},
                              ),
                            ),

                            SizedBox(height: 30.0),
                            Container(
                              width: 400,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightBlue,
                                  onPrimary: Colors.white,
                                  padding: EdgeInsets.all(20.0),
                                ),
                                onPressed: _login,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.lock,
                                      color: Colors.grey[200],
                                    ),
                                    SizedBox(width: 8),
                                    Text('Sign In'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
