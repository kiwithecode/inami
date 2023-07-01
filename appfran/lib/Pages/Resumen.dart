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
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //SizedBox(height: 10.0),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Resumen:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              // SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Velocidad del viento:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'm/s',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Direccion del viento:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Termometro de Minima:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'm/s',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Precipitación:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'm/m',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Geotermometro:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              /*
              Text(
                'Geotermometro',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              */
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '°C',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Cantidad total de nubosidad:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              /*
              Text(
                'Cantidad total de nubosidad',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              */
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'Este',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Cantidad total de nubes bajas:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              /*
              Text(
                'Cantidad total de nubes bajas',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              */
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Cantidad total de nubes medias:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              /*
              Text(
                'Cantidad total de nubes medias',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              */
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Cantidad total de nubes altas:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              /*
              Text(
                'Cantidad total de nubes altas',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              */
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Fenomeno Registrado:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              /*
              Text(
                'Fenomeno Registrado',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              */
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Lectura micrometro:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              /*
              Text(
                'Lectura micrometro',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              */
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'mm',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Velocidad del viento (Anemometro):',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              /*
              Text(
                'Velocidad del viento (Anemometro)',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              */
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'Km/h',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Velocidad Horizontal:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              /*
              Text(
                'Velocidad Horizontal',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              */
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'Km',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Termómetro seco:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              /*
              Text(
                'Termómetro seco',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              */
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '°C',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Termómetro Humedo:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              /*
              Text(
                'Termómetro Humedo',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 15),
              ),
              */
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: '°C',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Presion Atmosferica:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _generoController,
                  decoration: InputDecoration(
                    hintText: 'hPa',
                    icon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
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
