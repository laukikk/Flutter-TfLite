import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:TfLite/screens/camera_screen.dart';
import 'package:TfLite/screens/all_models.dart';

class PageData {
  final String title;
  final IconData icon;
  final Color bgColor;
  final Color textColor;
  final Color logoColor;
  final String screen;
  final String subtitle;

  PageData({
    this.title,
    this.icon,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
    this.logoColor,
    this.screen,
    this.subtitle,
  });
}

class OnboardingExample extends StatelessWidget {
  static const String id = 'onboarding';
  final List<PageData> pages = [
    PageData(
        icon: Icons.nature_people_rounded,
        title: "Real-time Detection",
        textColor: Colors.black,
        bgColor: Color(0xFFFDBFDD),
        logoColor: Color(0xff4439D9),
        screen: CameraScreen.id,
        subtitle:
            'Detect objects real time by pointing your camera towards the subject'),
    PageData(
        icon: Icons.add_a_photo_rounded,
        title: "Click and Detect",
        bgColor: Color(0xFFFFFFFF),
        logoColor: Color(0xff8e9aaf),
        screen: AllModels.id,
        subtitle: 'Click a photo from your camera to detect objects.'),
    PageData(
        icon: Icons.image,
        title: "Load and Detect",
        bgColor: Color(0xFF0043D0),
        logoColor: Color(0xff01D6C0),
        screen: AllModels.id,
        textColor: Colors.white,
        subtitle: 'Load images from your gallery to detect objects'),
  ];

  List<Color> get colors => pages.map((p) => p.bgColor).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: colors,
        radius: 300,
        curve: Curves.ease,
        duration: Duration(seconds: 2),
        itemBuilder: (index, value) {
          PageData page = pages[index % pages.length];
          return Container(
            child: Theme(
              data: ThemeData(
                textTheme: TextTheme(
                  headline6: TextStyle(
                    color: page.textColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Helvetica',
                    letterSpacing: 0.0,
                    fontSize: 17,
                  ),
                  subtitle2: TextStyle(
                    color: page.textColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                ),
              ),
              child: PageCard(page: page),
            ),
          );
        },
      ),
    );
  }
}

class PageCard extends StatelessWidget {
  final PageData page;

  PageCard({@required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildPicture(context),
          SizedBox(height: 30),
          _buildText(context),
          Text('data'),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      page.title,
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPicture(
    BuildContext context, {
    double size = 190,
    double iconSize = 120,
  }) {
    return FlatButton(
      onPressed: () {
        Navigator.pushNamed(context, page.screen);
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(60.0)),
          color: page.bgColor
              .withBlue(page.bgColor.blue - 40)
              .withGreen(page.bgColor.green + 20)
              .withRed(page.bgColor.red - 100)
              .withAlpha(90),
        ),
        margin: EdgeInsets.only(
          top: 140,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Icon(
              page.icon,
              size: iconSize,
              color: page.logoColor,
            ),
          ],
        ),
      ),
    );
  }
}
