// import 'dart:async';
// import 'package:appfran/Pages/DetailPage2.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'navbarPages.dart';

// class DetailPage extends StatefulWidget {
//   @override
//   _DetailPageState createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   String _formattedDate = DateFormat('hh:mm a').format(DateTime.now());
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(Duration(minutes: 1), (Timer t) => _getTime());
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   void _getTime() {
//     final String formattedDateTime =
//         DateFormat('hh:mm a').format(DateTime.now()).toString();
//     setState(() {
//       _formattedDate = formattedDateTime;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: NavbarPages(_formattedDate),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Container(
//           alignment: Alignment.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Hora: $_formattedDate',
//                 style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 15),
//               ),
//               SizedBox(height: 100),
//               Text(
//                 'Petición Acumulada:',
//                 style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 15),
//               ),
//               SizedBox(height: 8),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Introduce tu petición acumulada aquí',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.zero),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 100),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     style: ButtonStyle(
//                       fixedSize: MaterialStateProperty.all(Size(120, 50)),
//                       backgroundColor: MaterialStateProperty.all(
//                         Color.fromARGB(255, 255, 17, 0),
//                       ),
//                     ),
//                     child: Text('Atras'),
//                   ),
//                   SizedBox(width: 80),
//                   ElevatedButton(
//   onPressed: () {
//     // Obtener la hora actual
//     DateTime now = DateTime.now();

//     // Definir las horas de inicio y fin
//     DateTime morningStart = DateTime(now.year, now.month, now.day, 7); // 7 AM
//     DateTime morningEnd = DateTime(now.year, now.month, now.day, 8); // 8 AM
//     DateTime eveningStart = DateTime(now.year, now.month, now.day, 22); // 10 PM
//     DateTime eveningEnd = DateTime(now.year, now.month, now.day, 23); // 11 PM

//     // Comprobar si la hora actual está en el rango permitido
//     if (now.isAfter(morningStart) && now.isBefore(morningEnd)) {
//       // Si es por la mañana
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => MorningView4()),
//       );
//     } 
//     else if (now.isAfter(eveningStart) && now.isBefore(eveningEnd)) {
//       // Si es por la noche
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => AfternoonView1()),
//       );
//     }
//   },
//   style: ElevatedButton.styleFrom(
//     primary: Color.fromARGB(255, 43, 255, 0),
//   ),
//   child: Text('Siguiente'),
// ),

//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
