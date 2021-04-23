import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maya/screens/storage.dart';
import 'screen.dart';

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
        "Hearts: 50k+",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xFFEC3F27)),
      ),
      SizedBox(
        width: 60,
      ),
      Text(
        "Maya Streak: 1k+",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xFFEC3F27)),
      ),
    ],
  );
}

Widget _interest() {
  return SizedBox(
      width: 330,
      height: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: RaisedButton(
          color: Color(0xFFFD7F00),
          textColor: Colors.white,
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Add your interests",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                ),
              ),
            ],
          ),
        ),
      ));
}

Widget _ad() {
  return SizedBox(
      width: 330,
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
                "Upgrade to Maya+",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
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
          child: Text("Logout", style: TextStyle(color: Colors.white)))
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
      _interest(),
      SizedBox(
        height: 20,
      ),
      _ad(),
      SizedBox(
        height: 20,
      ),
      _logout(context)
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
