import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ze Gotinha',
      theme: ThemeData(
        primaryColor: Colors.blue, 
        backgroundColor: Colors.blue, 
        colorScheme: ColorScheme.light(
          primary: Colors.blue,
          secondary: Colors.pink.shade400,

      )),
    ).modular();
  }
}