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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            Container(
              child: Text(
                'Velocidad del Viento:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'm/s',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Dirección del Viento:',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Expanded(
                child: DropdownButton<String>(
                  value: _dropdownValue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconSize: 20,
                  elevation: 15,
                  style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  underline: Container(
                    height: 2,
                    color: const Color.fromARGB(255, 0, 0, 0),
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
                        padding: const EdgeInsets.all(8),
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 17, 0),
                  ),
                  child: Text('Atras'),
                ),
                ElevatedButton(
  onPressed: () {
    // Obtener la hora actual
    DateTime now = DateTime.now();

    // Definir las horas de inicio y fin
    DateTime morningStart = DateTime(now.year, now.month, now.day, 7); // 7 AM
    DateTime morningEnd = DateTime(now.year, now.month, now.day, 18); // 8 AM
   DateTime eveningStart = DateTime(now.year, now.month, now.day, 12); // 10 PM
    DateTime eveningEnd = DateTime(now.year, now.month, now.day, 23); // 11 PM

    // Comprobar si la hora actual está en el rango permitido
    if (now.isAfter(morningStart) && now.isBefore(morningEnd)) {
      // Si es por la mañana
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TermoMini()),
      );
    } 
    else if (now.isAfter(eveningStart) && now.isBefore(eveningEnd)) {
      // Si es por la noche
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailPageThree()),
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
