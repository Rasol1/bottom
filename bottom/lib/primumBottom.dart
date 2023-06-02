import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ____________     start primum bottom     ______________

class PrimumBottom extends StatefulWidget {
  final String pathIcon;
  final String mainText;
  final int coinNumber;
  final Color backgroundColor;
  final Color onBackgroundColor;
  final Color coinColor;

  PrimumBottom({
    super.key,
    required this.pathIcon,
    required this.mainText,
    required this.coinNumber,
    required this.backgroundColor,
    required this.onBackgroundColor,
    required this.coinColor,
  });

  @override
  State<PrimumBottom> createState() => _PrimumBottomState();
}

class _PrimumBottomState extends State<PrimumBottom> {
  static const spinkit = SpinKitRing(
    color: Colors.white,
    lineWidth: 2,
    size: 35.0,
  );
  bool isLoading = false;
  bool isClickBottom = false;
// fonction for loding bottom

  handleButtonClick() {
    // check the button not clickable
    if (isClickBottom) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('The button has already been clicked'),
        ),
      );
      ;
    } else {
      setState(() {
        isLoading = true;
        isClickBottom = true;
      });
//  for time loding
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context); // to be rsponsive
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final myTextTheme = Theme.of(context);
    return bottom(myTextTheme, screenHeight, screenWidth);
  }

  InkWell bottom(
      ThemeData myTextTheme, double screenHeight, double screenWidth) {
    return InkWell(
      onTap: isLoading ? null : handleButtonClick,
      child: bottomBody(
          myTextTheme, screenHeight, screenWidth), // get the bottom style/body
    );
  }

// ___________      start bottom body/style     _____________
  Container bottomBody(
      ThemeData myTextTheme, double screenHeight, double screenWidth) {
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
      child: bottomChild(
          myTextTheme, screenWidth), //  get the children(Text,coinNumber)
    );
  }
// ___________      end bottom body/style     _____________

//___________      bottom children      _____________
  bottomChild(ThemeData myThemeData, double screenWidth) {
    if (isLoading)
      return spinkit;
    else {
      return Row(
        children: [
          ClipRRect(
            child: SvgPicture.asset(widget.pathIcon,)
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.mainText,
                style: myThemeData.textTheme.bodyLarge!
                    .apply(color: widget.onBackgroundColor),
              ),
              Row(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/icons/coin.png',
                      color: widget.coinColor,
                      width: screenWidth * 0.045,
                    ),
                  ),
                  Text(
                    widget.coinNumber.toString(),
                    style: myThemeData.textTheme.bodyMedium!
                        .copyWith(color: widget.coinColor),
                  ),
                ],
              ),
            ],
          )
        ],
      );
    }
  }
}

// ________________     end primum bottom     ___________________
