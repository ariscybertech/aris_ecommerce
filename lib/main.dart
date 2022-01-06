import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/screens/splash.dart';
import 'package:ecommerce/styles/defauls.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: defaulColor,
        fontFamily: "Raleway",
      ),
      // home: Splash(),
      home: HomeScreen(),
    );
  }
}
