import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'DetailPage3.dart';
import 'TermoMini.dart';
import 'navbarPages.dart';

class DetailPageTwo extends StatefulWidget {
  @override
  _DetailPageTwoState createState() => _DetailPageTwoState();
}

class _DetailPageTwoState extends State<DetailPageTwo> {
  String _formattedDate = DateFormat('hh:mm a').format(DateTime.now());
  Timer? _timer;
  String? _dropdownValue;
  final List<String> _directions = ['Norte', 'Sur', 'Este', 'Oeste'];

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
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 150.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Velocidad del Viento:',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 250, // Ajusta el valor según tus necesidades
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'm/s',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Dirección del Viento:',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Expanded(
                child: DropdownButton<String>(
                  value: _dropdownValue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconSize: 20,
                  elevation: 15,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropdownValue = newValue;
                    });
                  },
                  items:
                      _directions.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 90),
                ElevatedButton(
                  onPressed: () {
                    // Obtener la hora actual
                    DateTime now = DateTime.now();

                    // Definir las horas de inicio y fin
                    DateTime morningStart =
                        DateTime(now.year, now.month, now.day, 7); // 7 AM
                    DateTime morningEnd =
                        DateTime(now.year, now.month, now.day, 18); // 8 AM
                    DateTime eveningStart =
                        DateTime(now.year, now.month, now.day, 12); // 10 PM
                    DateTime eveningEnd =
                        DateTime(now.year, now.month, now.day, 23); // 11 PM

                    // Comprobar si la hora actual está en el rango permitido
                    if (now.isAfter(morningStart) && now.isBefore(morningEnd)) {
                      // Si es por la mañana
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TermoMini()),
                      );
                    } else if (now.isAfter(eveningStart) &&
                        now.isBefore(eveningEnd)) {
                      // Si es por la noche
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPageThree()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 43, 255, 0),
                  ),
                  child: Text('Siguiente'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
