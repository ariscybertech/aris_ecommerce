import 'package:ecommerce/screens/auth/signin.dart';
import 'package:ecommerce/styles/defauls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: defaulColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // * just to set the total width so it helps in alignment

            SizedBox(
              width: width,
              // * this is just for upper margin
              height: height * .02,
            ),

            // * text -> find your gadget

            SizedBox(
              height: height * .17,
              // width: width * .9,
              child: Text(
                "Find your\nGadget",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: height * 0.07,
                ),
              ),
            ),
            SizedBox(
              height: height * .5,
              child: Image(
                image: AssetImage(
                  "assets/images/splash.png",
                ),
              ),
            ),

            SizedBox(
              height: height * .03,
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    CupertinoPageRoute(
                      builder: (ctx) => Signin(),
                    ),
                    (route) => false);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: width * .8,
                height: height * .07,
                child: Center(
                  child: Text(
                    "Get started",
                    style: TextStyle(
                      color: defaulColor,
                      fontWeight: FontWeight.bold,
                      fontSize: height * .02,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
