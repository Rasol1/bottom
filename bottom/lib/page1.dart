import 'package:bottom/bottom.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final ThemeData myThemeDate = Theme.of(context);
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
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DefaultBottom(
                  onBackgroundColor: myThemeDate.colorScheme.onPrimary,
                    backgroundColor: myThemeDate.colorScheme.primary,
                    pathIcon: 'assets/icons/ghost.png',
                    mainText: "Generate primum picture",
                    secondText: 'Free'),
                DefaultBottom(
                  onBackgroundColor: myThemeDate.colorScheme.onPrimary,
                  backgroundColor: myThemeDate.colorScheme.primary,
                  pathIcon: 'assets/icons/octopus.png',
                  mainText: "Generate octopus level picture",
                  secondText: 'Free',
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class SpinKitFadingCircle {}
