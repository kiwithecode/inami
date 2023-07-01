import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'TermoSeco.dart';
import 'navbarPages.dart';

class VisiH extends StatefulWidget {
  @override
  _VisiHState createState() => _VisiHState();
}

class _VisiHState extends State<VisiH> {
  String _formattedDate = DateFormat('hh:mm a').format(DateTime.now());
  Timer? _timer;

  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(minutes: 1), (Timer t) => _getTime());
  }

  @override
  void dispose() {
    _timer?.cancel();
    _alturaController.dispose();
    _generoController.dispose();
    super.dispose();
  }

  void _getTime() {
    final String formattedDateTime =
        DateFormat('hh:mm a').format(DateTime.now()).toString();
    setState(() {
      _formattedDate = formattedDateTime;
    });
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 150),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Visibilidad Horizontal:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'Km',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => _generoController.clear(),
                      icon: Icon(Icons.clear),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {
                        // Agrega la funcionalidad de búsqueda aquí
                      },
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 200.0,
                    height: 100.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 17, 0),
                      ),
                      child: Text('Atras'),
                    ),
                  ),
                  SizedBox(width: 80),
                  ButtonTheme(
                    minWidth: 200.0,
                    height: 100.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // Obtener la hora actual
                        DateTime now = DateTime.now();

                        // Definir las horas de inicio y fin
                        DateTime morningStart =
                            DateTime(now.year, now.month, now.day, 7); // 7 AM
                        DateTime morningEnd =
                            DateTime(now.year, now.month, now.day, 8); // 8 AM
                        DateTime eveningStart =
                            DateTime(now.year, now.month, now.day, 12); // 10 PM
                        DateTime eveningEnd = DateTime(
                            now.year, now.month, now.day, 23); // 11 PM // 11 PM

                        // Comprobar si la hora actual está en el rango permitido
                        if (now.isAfter(morningStart) &&
                            now.isBefore(morningEnd)) {
                          // Si es por la mañana
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermoSeco()),
                          );
                        } else if (now.isAfter(eveningStart) &&
                            now.isBefore(eveningEnd)) {
                          // Si es por la noche
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermoSeco()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 43, 255, 0),
                      ),
                      child: Text('Siguiente'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
