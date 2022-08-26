import 'package:flutter/material.dart';
import 'package:gocrm/resources/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: screenSize.height * 0.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image(
              height: screenSize.height * 0.7,
              width: width,
              image: const AssetImage("images/cover.png"),
            )
          ],
        ),
      ],
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        height: screenSize.height * 0.5,
        width: screenSize.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'images/background.jpg',
          ),
        )),
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          width: ResponsiveWidget.isSmallScreen(context)
              ? screenSize.width
              : screenSize.width * 0.4,
          child: Text(
              "Organize your entire business on one management platform",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.ubuntu().fontFamily)),
        ));
  }
}
