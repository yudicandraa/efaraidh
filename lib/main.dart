import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/deskripsi_screen.dart';
import 'screens/calculate_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EFaraidh',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/menu': (context) => MenuScreen(),
        '/deskripsi': (context) => DeskripsiScreen(),
        '/calculate': (context) => CalculateScreen(),
      },
    );
  }
}
