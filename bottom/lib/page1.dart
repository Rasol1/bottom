import 'package:bottom/bottom.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              'assets/images/background1.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.white10,
                  Colors.black12,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 0,
            left: 0,
            child: MaterialButton(
              onPressed: () {},
              child: DefaultBottom(),
            ),
          )
        ],
      )),
    );
  }
}
