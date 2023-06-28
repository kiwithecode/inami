import 'dart:async';
import 'package:appfran/Pages/DetailPage5.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'navbarPages.dart';

class DetailPageFour extends StatefulWidget {
  @override
  _DetailPageFourState createState() => _DetailPageFourState();
}

class _DetailPageFourState extends State<DetailPageFour> {
  String _formattedDate = DateFormat('hh:mm a').format(DateTime.now());
  Timer? _timer;
  String? _dropdownValue;
  final List<String> _numbers = List<String>.generate(10, (i) => (i + 1).toString());
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Cantidad Total de Nubes Medias:',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DropdownButton<String>(
                  value: _dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(fontSize: 15, color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropdownValue = newValue;
                    });
                  },
                  items: _numbers.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Altura:',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _alturaController,
                  decoration: InputDecoration(
                    hintText: 'Introduce la altura aquí',
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Género de las Nubes:',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'Introduce el género de las nubes aquí',
                    suffixIcon: IconButton(
                      onPressed: () => _generoController.clear(),
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100),
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
                  SizedBox(width: 80),
                  ElevatedButton(
  onPressed: () {
    // Obtener la hora actual
    DateTime now = DateTime.now();

    // Definir las horas de inicio y fin
    DateTime morningStart = DateTime(now.year, now.month, now.day, 7); // 7 AM
    DateTime morningEnd = DateTime(now.year, now.month, now.day, 8); // 8 AM
       DateTime eveningStart =
                          DateTime(now.year, now.month, now.day, 12); // 10 PM
                      DateTime eveningEnd =
                          DateTime(now.year, now.month, now.day, 23); // 11 PM

    // Comprobar si la hora actual está en el rango permitido
    if (now.isAfter(morningStart) && now.isBefore(morningEnd)) {
      // Si es por la mañana
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailPageFive()),
      );
    } 
    else if (now.isAfter(eveningStart) && now.isBefore(eveningEnd)) {
      // Si es por la noche
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailPageFive()),
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
      ),
    );
  }
}
