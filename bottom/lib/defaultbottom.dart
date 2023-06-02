import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable

// _______________     start default bottom      __________________
class DefaultBottom extends StatefulWidget {
  final String pathIcon;
  final String mainText;
  final String secondText;
  final Color backgroundColor;
  final Color onBackgroundColor;
  final Color secondTextColor;

  DefaultBottom({
    super.key,
    required this.pathIcon,
    required this.mainText,
    required this.secondText,
    required this.backgroundColor,
    required this.onBackgroundColor,
    required this.secondTextColor,
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
  bool isButtonCliked = false;

  handleButtonClick() {    // function for loding in bottom

    if (isButtonCliked) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('The button has already been clicked')));
    }else{
    setState(() {
      isLoading = true;
      isButtonCliked = true;
    });

    Future.delayed(Duration(seconds: 1), () {
      //function for time loding and stop it
      setState(() {
        isLoading = false;
      });
    });}
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context); // to be rsponsive
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final myThemeData = Theme.of(context);
    return bottom(myThemeData, screenHeight);
  }

  InkWell bottom(ThemeData myTextTheme, double screenHeight) {
    return InkWell(
      onTap: isLoading ? null : handleButtonClick,
      child: bottomBody(myTextTheme, screenHeight), // get the style/body
    );
  }

// _____________      start body/style bottom     ______________
  Container bottomBody(ThemeData myTextTheme, double screenHeight) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
      margin: EdgeInsets.fromLTRB(26, 4, 26, 4),
      height: screenHeight * 0.085,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.backgroundColor,
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset.zero)
          ]),
      child: bottomChild(myTextTheme), //get the children
    );
  }
// _____________      end body/style bottom     ______________

// _____________      child bottom     ______________
  bottomChild(ThemeData myTextTheme) {
    if (isLoading)
      return spinkit;
    else {
      return Row(
        children: [
          ClipRRect(
            child: SvgPicture.asset(widget.pathIcon)
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
              Text(
                widget.secondText,
                style: myTextTheme.textTheme.bodyMedium!
                    .copyWith(color: widget.secondTextColor),
              ),
            ],
          )
        ],
      );
    }
  }
}

// ____________     end default bottom      ______________
