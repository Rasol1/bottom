import 'package:bottom/defaultbottom.dart';
import 'package:bottom/primumBottom.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  bool isLoading = false;
  bool isClickBottom = false;
// fonction for loding bottom

  handleButtonClick() {
    // check the button not clickable
    if (isClickBottom) {
      return 
      ;
      
    } else {
      setState(() {
        isLoading = true;
        isClickBottom = true;
      });
//  for time loding
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData myThemeDate = Theme.of(context);
    return Scaffold(
      body: SafeArea(child: pagebody(myThemeDate)),
    );
  }

  Stack pagebody(ThemeData myThemeDate) {
    return Stack(
      children: [
        //_____________     backgroung Image     _____________

        SizedBox(
          height: double.infinity,
          child: Image.asset(
            'assets/images/background1.jpg',
            fit: BoxFit.fill,
          ),
        ),

        //____________      background gradient       ______________

        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.white10,
                Colors.black12,
              ],
            ),
          ),
        ),

        // _______________    bottom    ___________________
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultBottom(
              secondTextColor: myThemeDate.colorScheme.onSecondary,
              onBackgroundColor: myThemeDate.colorScheme.onPrimary,
              backgroundColor: myThemeDate.colorScheme.primary,
              pathIcon: 'assets/icons/ghost.svg',
              mainText: "Generate primum picture",
              secondText: 'Free',
              onTap: isLoading ? null : handleButtonClick,
              isloading: isLoading,
            ),
            PrimumBottom(
              onBackgroundColor: myThemeDate.colorScheme.onPrimary,
              backgroundColor: myThemeDate.colorScheme.primary,
              pathIcon: 'assets/icons/octopus.svg',
              mainText: "Generate octopus level picture",
              coinNumber: 15,
              coinColor: const Color(0xffFFC809),
              isloading: isLoading,
              onTap: isLoading?null:handleButtonClick(),
            ),
          ],
        )
      ],
    );
  }
}
