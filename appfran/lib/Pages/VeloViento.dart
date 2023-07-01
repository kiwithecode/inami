import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'VisiH.dart';
import 'navbarPages.dart';

class VeloViento extends StatefulWidget {
  @override
  _VeloVientoState createState() => _VeloVientoState();
}

class _VeloVientoState extends State<VeloViento> {
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
              SizedBox(height: 20.0),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Velocidad del viento(Anemometro):',
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
                    hintText: 'km/h',
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VisiH()),
                        );
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
