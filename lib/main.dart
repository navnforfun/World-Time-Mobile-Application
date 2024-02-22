import 'package:ex4_worldtime/pages/choose_location.dart';
import 'package:ex4_worldtime/pages/home.dart';
import 'package:ex4_worldtime/pages/loading.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation()
      },
    )
  );
}

