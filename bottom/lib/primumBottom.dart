// ignore_for_file: deprecated_member_use

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
  final onTap;
  final bool isloading;

  const PrimumBottom({
    super.key,
    required this.pathIcon,
    required this.mainText,
    required this.coinNumber,
    required this.backgroundColor,
    required this.onBackgroundColor,
    required this.coinColor,
    required this.onTap,
    required this.isloading,
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
      onTap: widget.onTap,
      child: bottomBody(
          myTextTheme, screenHeight, screenWidth), // get the bottom style/body
    );
  }

// ___________      start bottom body/style     _____________
  Container bottomBody(
      ThemeData myTextTheme, double screenHeight, double screenWidth) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      margin: const EdgeInsets.fromLTRB(26, 4, 26, 4),
      height: screenHeight * 0.085,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.backgroundColor,
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset.zero)
          ]),
      child: bottomChild(
          myTextTheme, screenWidth), //  get the children(Text,coinNumber)
    );
  }
// ___________      end bottom body/style     _____________

//___________      bottom children      _____________
  bottomChild(ThemeData myThemeData, double screenWidth) {
    if (widget.isloading)
      return spinkit;
    else {
      return Row(
        children: [
          ClipRRect(
              child: SvgPicture.asset(
            widget.pathIcon,
          )),
          const SizedBox(
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
                  SvgPicture.asset(
                    "assets/icons/coin.svg",
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
