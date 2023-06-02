import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class DefaultBottom extends StatefulWidget {
  final String pathIcon;
  final String mainText;
  final String secondText;
  final Color backgroundColor;
  final Color onBackgroundColor;

  DefaultBottom({
    super.key,
    required this.pathIcon,
    required this.mainText,
    required this.secondText,
    required this.backgroundColor,
    required this.onBackgroundColor,
  });

  @override
  State<DefaultBottom> createState() => _DefaultBottomState();
}

class _DefaultBottomState extends State<DefaultBottom> {
  
  static const spinkit = SpinKitRing(
    color: Colors.white,
    lineWidth: 2,
    size: 35.0,
  );
  bool isLoading = false;

  void handleButtonClick() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final myTextTheme = Theme.of(context);
    return bottom(myTextTheme, screenHeight);
  }

  InkWell bottom(ThemeData myTextTheme, double screenHeight) {
    return InkWell(
      onTap: isLoading ? null : handleButtonClick,
      child: bottomBody(myTextTheme,screenHeight),
    );
  }

  Container bottomBody(ThemeData myTextTheme,double screenHeight) {
    return Container(
      padding: EdgeInsets.fromLTRB(12,8,12,8),
      margin: EdgeInsets.fromLTRB(26 , 4,26, 4),
      height: screenHeight*0.085,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.backgroundColor,
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset.zero)
          ]),
      child: bottomChild(myTextTheme),
    );
  }

  bottomChild(ThemeData myTextTheme) {
    
    if (isLoading)
          return  spinkit;
    else {
      return Row(
      children: [
        ClipRRect(
          child: Image.asset(
            widget.pathIcon,
            width: 30,
            color: widget.onBackgroundColor,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        
        
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.mainText,
                style: myTextTheme.textTheme.bodyLarge!
                    .apply(color: widget.onBackgroundColor),
              ),
              Text(widget.secondText),
            ],
          )
      ],
    );
    }
  }
}
