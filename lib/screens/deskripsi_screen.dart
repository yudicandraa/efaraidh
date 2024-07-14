import 'package:flutter/material.dart';

class DeskripsiScreen extends StatefulWidget {
  @override
  _DeskripsiScreenState createState() => _DeskripsiScreenState();
}

class _DeskripsiScreenState extends State<DeskripsiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Replace with your Flutter Image widget, adjust properties as needed
              Image.asset(
                'assets/topmenu.png', // Assuming 'topmenu.png' is in the assets folder
                width: MediaQuery.of(context).size.width,

                fit: BoxFit.fitWidth,
              ),
              // Adjust spacing as necessary
              // Replace with your Flutter Image widget for textdeskripsi.png
              Container(
                child: Image.asset(
                  'assets/textdeskripsi.png',
                  // Assuming 'textdeskripsi.png' is in the assets folder
                  // Adjust position if needed using alignment properties
                ),
              ),
              // Adjust spacing as necessary
              // Replace with your Flutter ImageButton widget
            ],
          ),
        ),
      ),
    );
  }
}
