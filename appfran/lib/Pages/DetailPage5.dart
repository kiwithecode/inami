import 'dart:async';
import 'package:appfran/Pages/DetailPage6.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'navbarPages.dart';

class DetailPageFive extends StatefulWidget {
  @override
  _DetailPageFiveState createState() => _DetailPageFiveState();
}

class _DetailPageFiveState extends State<DetailPageFive> {
  String _formattedDate = DateFormat('hh:mm a').format(DateTime.now());
  Timer? _timer;
  String? _dropdownValue;
  final List<String> _numbers =
      List<String>.generate(10, (i) => (i + 1).toString());
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
              SizedBox(height: 20.0),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Cantidad Total de Nubes Alta:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
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
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Altura:',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _alturaController,
                  decoration: InputDecoration(
                      hintText: 'Introduce la altura aquí',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Género de las Nubes:',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'Buscar',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => _generoController.clear(),
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
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
                  SizedBox(width: 80.0),
                  ElevatedButton(
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
                              builder: (context) => DetailPageSix()),
                        );
                      } else if (now.isAfter(eveningStart) &&
                          now.isBefore(eveningEnd)) {
                        // Si es por la noche
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPageSix()),
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
