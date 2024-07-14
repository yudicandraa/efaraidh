import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // First Image (unggul at top right)
          Positioned(
            right: 0,
            top: 20,
            child: Image.asset(
              'assets/unggul.png',
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height * 0.30,
            ),
          ),
          // Second Image (selamatdatang at top left)
          Positioned(
            left: 0,
            top: -50,
            child: Image.asset(
              'assets/selamatdatang.png',
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
          // Third Image (mainbuttom centered at the bottom)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/mainbuttom.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width /
                  (Image.asset('assets/mainbuttom.png').width ??
                      1 / (Image.asset('assets/mainbuttom.png').height ?? 1)),
              fit: BoxFit.cover,
            ),
          ),
          // ImageButton (mulai centered at the bottom, above mainbuttom)
          Positioned(
            left: MediaQuery.of(context).size.width * 0.5 -
                MediaQuery.of(context).size.width * 0.3 / 2,
            bottom: MediaQuery.of(context).size.height * 0.1 / 80,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/menu');
              },
              child: Image.asset(
                'assets/mulai.png',
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
