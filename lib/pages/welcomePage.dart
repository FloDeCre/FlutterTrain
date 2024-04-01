import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'listPage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/logo_flutter.svg",
              width:90 ,
            ),
            const Padding(
              padding: EdgeInsets.only(top:50.0),
              child: Text(
                "Welcome in the body",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Arcade",
                  //fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Text(
              "Little demo app\n To handle awesome flutter",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
  }
}