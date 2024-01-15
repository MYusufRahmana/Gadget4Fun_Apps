import 'package:flutter/material.dart';
import 'main/home_ponsel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gadget4Fun',
      theme: ThemeData(),
      home: const home_ponsel(), //<-- Class home_ponsel.dart
    );
  }
}
