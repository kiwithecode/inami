import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'navbarPages.dart';

class Resumen extends StatefulWidget {
  @override
  _ResumenState createState() => _ResumenState();
}

class _ResumenState extends State<Resumen> {
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
            children: <Widget>[
              SizedBox(height: 50),
              Text(
                'Resumen',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 25),
              ),
              SizedBox(height: 25),
              Text(
                'Velocidad del viento',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'm/s',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Text(
                'Direccion del viento',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Text(
                'Termometro de Minima',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'm/s',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Text(
                'Precipitación',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'm/m',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Text(
                'Geotermometro',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '°C',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Text(
                'Cantidad total de nubosidad',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Text(
                'Cantidad total de nubes bajas',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Text(
                'Cantidad total de nubes medias',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Text(
                'Cantidad total de nubes altas',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Text(
                'Fenomeno Registrado',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Text(
                'Lectura micrometro',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'mm',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Text(
                'Velocidad del viento (Anemometro)',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'Km/h',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Text(
                'Velocidad Horizontal',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'Km',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Text(
                'Termómetro seco',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '°C',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Text(
                'Termómetro Humedo',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '°C',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              Text(
                'Presion Atmosferica',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'hPa',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
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
                        // Navigator.push(
                        //   context,

                        //   MaterialPageRoute(builder: (context) => Resumen()),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 43, 255, 0),
                      ),
                      child: Text('Terminar'),
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
