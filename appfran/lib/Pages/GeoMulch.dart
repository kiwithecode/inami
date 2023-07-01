import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'GeoCesped.dart';

import 'navbarPages.dart';

class GeoMulch extends StatefulWidget {
  @override
  _GeoMulchState createState() => _GeoMulchState();
}

class _GeoMulchState extends State<GeoMulch> {
  String _formattedDate = DateFormat('hh:mm a').format(DateTime.now());
  Timer? _timer;
  final List<String> _labels = ["2CM", "5CM", "10CM", "15CM", "20CM", "30CM"];

  final TextEditingController _temperaturaController = TextEditingController();
  List<TextEditingController> _geotermometrosControllers = [];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(minutes: 1), (Timer t) => _getTime());

    for (var i = 0; i < _labels.length; i++) {
      _geotermometrosControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _temperaturaController.dispose();

    for (var controller in _geotermometrosControllers) {
      controller.dispose();
    }

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
                      'Geotermómetros Mulch:',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              for (var i = 0; i < _labels.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text(_labels[i], style: TextStyle(fontSize: 16)),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: _geotermometrosControllers[i],
                          decoration: InputDecoration(
                              hintText: 'Ingresar datos',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                        ),
                      ),
                    ],
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
                  SizedBox(width: 80),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GeoCesped()),
                      );
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
