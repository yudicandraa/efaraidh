import 'package:efaraidh/screens/calculate_screen.dart';
import 'package:efaraidh/screens/deskripsi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top Menu Image
          Positioned(
            top: -200, // Center at 95% height
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/topmenu.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width /
                  (Image.asset('assets/topmenu.png').width ??
                      1 / (Image.asset('assets/topmenu.png').height ?? 1)),
              fit: BoxFit.cover,
            ),
          ),
          // Bottom Menu Image
          Positioned(
            top: 20, // Center at 83% height
            left: MediaQuery.of(context).size.width * 0.5 -
                MediaQuery.of(context).size.width * 0.5 / 2,
            child: Image.asset(
              'assets/textmenu.png',
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
          // Calculate Button

          Positioned(
            top: 250,
            left: MediaQuery.of(context).size.width * 0.5 -
                MediaQuery.of(context).size.width * 0.45 / 2,
            child: ElevatedButton(
              onPressed: () {
                // Add your onPressed logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculateScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0), // Adjust padding as needed
              ),
              child: Image.asset(
                'assets/menuhitung.png', // Replace with your image path
                height: 120.0, // Adjust height as needed
              ),
            ),
          ),

          Positioned(
            top: 450,
            left: MediaQuery.of(context).size.width * 0.5 -
                MediaQuery.of(context).size.width * 0.45 / 2,
            child: ElevatedButton(
              onPressed: () {
                // Add your onPressed logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeskripsiScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0), // Adjust padding as needed
              ),
              child: Image.asset(
                'assets/menudeksripsi.png', // Replace with your image path
                height: 120.0, // Adjust height as needed
              ),
            ),
          ),

          // Description Button

          // Bottom Menu Image
          Positioned(
            bottom: -200, // Center at 24% height
            left: -50,
            right: 0,
            child: Image.asset(
              'assets/menubuttom.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width /
                  (Image.asset('assets/menubuttom.png').width ??
                      1 / (Image.asset('assets/menubuttom.png').height ?? 1)),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
