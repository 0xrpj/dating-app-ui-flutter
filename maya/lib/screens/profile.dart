import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:maya/screens/storage.dart';
import 'screen.dart';
import '../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

Widget _coverPlusDP(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 30,
      ),
      Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Image.asset(
                  'assets/images/cover.jpg',
                  height: 200,
                  width: 380,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 3.2,
            top: MediaQuery.of(context).size.height / 8.2,
            child: Container(
              decoration: new BoxDecoration(
                border: Border.all(width: 5, color: Color(0xFFEC3F27)),
                borderRadius: BorderRadius.circular(150),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.asset(
                  'assets/images/profile.png',
                  height: 170,
                  width: 170,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _details(BuildContext context) {
  return Column(
    children: [
      Text(
        "Shrinkhala Khatiwada",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontStyle: FontStyle.normal),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "21, Nepal",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 23,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Going to Harvard soon!",
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            fontFamily: "Poppins Bold"),
      ),
    ],
  );
}

Widget _friendsnStreaks() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        LocaleKeys.hearts.tr() + ": 50k+",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xFFEC3F27)),
      ),
      SizedBox(
        width: 60,
      ),
      Text(
        LocaleKeys.maya.tr() + " " + LocaleKeys.streak.tr() + ": 1k+",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xFFEC3F27)),
      ),
    ],
  );
}

Widget _profileButtons(String text) {
  String number = text.split("\n")[0];
  String other_text = text.split("\n")[1];
  String emoji = text.split("\n")[2];

  return SizedBox(
    child: GlassContainer.clearGlass(
        width: 170,
        height: 80,
        color: Colors.white10,
        gradient: LinearGradient(
          colors: [
            Color(0xFFEC3F27).withOpacity(0.60),
            Color(0xFFEC3F27).withOpacity(0.40)
          ],
          // begin: Alignment.topLeft,
          // end: Alignment.bottomRight,
        ),
        borderGradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.60),
            Colors.white.withOpacity(0.10),
            Colors.black.withOpacity(0.05),
            Colors.black.withOpacity(0.05)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.39, 0.40, 1.0],
        ),
        blur: 20.0,
        borderWidth: 1.5,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 3.0,
        shadowColor: Colors.black.withOpacity(0.30),
        alignment: Alignment.center,
        // frostedOpacity: 0.12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                // color: Colors.redAccent,
              ),
            ),
            Text(
              other_text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        )),
  );
}

Widget _cards() {
  return Center(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _profileButtons("13\nnew matches\n🔥"),
            SizedBox(
              width: 20,
            ),
            _profileButtons("171\nnew likes\n💝"),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _profileButtons("9785\nprofile visitors\n🥰"),
            SizedBox(
              width: 20,
            ),
            _profileButtons("6\nunmatched me\n👎"),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

Widget _interest() {
  return SizedBox(
      width: 180,
      height: 40,
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(40),
        child: RaisedButton(
          color: Color(0xFFFD7F00),
          textColor: Colors.white,
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.addInt.tr(),
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ));
}

Widget _ad() {
  return SizedBox(
      width: 250,
      height: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: RaisedButton(
          color: Color(0xFFEC3F27),
          textColor: Colors.white,
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.upgMayaPlus.tr(),
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ));
}

Widget _logout(BuildContext context) {
  final SecureStorage secureStorage = SecureStorage();
  return Column(
    children: [
      FlatButton(
          onPressed: () {
            secureStorage.deleteSecureData("email");
            Navigator.pushReplacement(context,
                CupertinoPageRoute(builder: (context) => SplashScreen()));
          },
          color: Colors.red,
          child: Text(LocaleKeys.logOut.tr(),
              style: TextStyle(color: Colors.white)))
    ],
  );
}

Widget _layoutDetails(BuildContext context) {
  Orientation orientation = MediaQuery.of(context).orientation;

  if (orientation == Orientation.portrait) {
    return Column(children: [
      _coverPlusDP(context),
      SizedBox(
        height: 120,
      ),
      _details(context),
      SizedBox(
        height: 20,
      ),
      _friendsnStreaks(),
      SizedBox(
        height: 20,
      ),
      _cards(),
      // SizedBox(
      //   height: 10,
      // ),
      // _interest(),
      SizedBox(
        height: 10,
      ),
      _ad(),

      SizedBox(
        height: 20,
      ),

      // SizedBox(
      //   height: 20,
      // ),
      // _logout(context)
    ]);
  } else {
    return Column();
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return _layoutDetails(context);
  }
}
