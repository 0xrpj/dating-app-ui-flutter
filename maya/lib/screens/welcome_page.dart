import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maya/screens/storage.dart';
import '../constants.dart';
import '../screens/screen.dart';
import '../widgets/widget.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:invert_colors/invert_colors.dart';

String finalEmail, finalName, finalBaWfilter, finalInvertFilter;

class SplashScreen extends StatelessWidget {
  final SecureStorage secureStorage = SecureStorage();

  Future<String> fetchValues() async {
    finalEmail = await secureStorage.readSecureData("email");
    finalName = await secureStorage.readSecureData("name");
    finalBaWfilter = await secureStorage.readSecureData("blackandwhite");
    finalInvertFilter = await secureStorage.readSecureData("invert");

    return finalEmail;
  }

  Widget materialApp(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: kBackgroundColor,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/images/logonomaya.png',
        ),
        nextScreen: finalEmail == null ? WelcomePage() : HomePage(),
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }

  //Fetching data from secureStorage

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchValues(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center();
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else {
              if (finalBaWfilter != null) {
                return ColorFiltered(
                    colorFilter: ColorFilter.matrix([
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                    ]),
                    child: materialApp(context));
              } else if (finalInvertFilter != null) {
                return InvertColors(child: materialApp(context));
              } else {
                return materialApp(context);
              } // snapshot.data  :- get your object which is pass from your downloadData() function
            }
          }
        });
  }
}

Widget _welcomeImage(context, width, height) {
  return Center(
    child: Container(
      width: width,
      height: height,
      child: Image(
        image: AssetImage('assets/images/final-removebg.png'),
      ),
    ),
  );
}

Widget _motto() {
  return Center(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "मायासँग जोडिनुहोस्\nमायाबाट",
        style: kHeadline,
        textAlign: TextAlign.center,
      ),
    ],
  ));
}

Widget _extraMotto(context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    child: Text(
      "Connect with Maya to get one step closer to your love.",
      // "",
      style: kBodyTextPlus,
      textAlign: TextAlign.center,
    ),
  );
}

Widget _buttonsLogReg(context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
    child: Container(
      height: 60,
      decoration: BoxDecoration(
        // color: Colors.grey[850],
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: MyTextButton(
              // bgColor: Colors.white,
              // bgColor: Colors.yellowAccent,
              bgColor: Color(0xFFF1792C),
              buttonName: 'Register',
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => RegisterPage()));
              },
              // textColor: Colors.black87,
              textColor: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: MyTextButton(
              // bgColor: Colors.transparent,
              // bgColor: Colors.white,
              // bgColor: Colors.blueAccent,

              bgColor: Color(0xFFEC3F27),
              buttonName: 'Sign In',
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => SignInPage(),
                    ));
              },
              textColor: Colors.white,
              // textColor: Colors.black87,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _layoutDetails(BuildContext context) {
  Orientation orientation = MediaQuery.of(context).orientation;
  if (orientation == Orientation.portrait) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Flexible(
            child: Column(
              children: [
                _welcomeImage(context, MediaQuery.of(context).size.width * 0.5,
                    MediaQuery.of(context).size.height * 0.45),
                SizedBox(
                  height: 20,
                ),
                _motto(),
                SizedBox(
                  height: 20,
                ),
                _extraMotto(context),
                SizedBox(
                  height: 150,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    // "“A man is already halfway in love with any woman who listens to him.” – Brendan Francis",
                    "",
                    style: kBodyText,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          _buttonsLogReg(context),
        ],
      ),
    );
  } else {
    return Padding(
      // padding: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: [
            SizedBox(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _welcomeImage(context, 200.0, 400.0),
                ],
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 450,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_motto()],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 320,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 270,
                              height: 150,
                              child: _buttonsLogReg(context)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 240,
                              height: 50,
                              child: _extraMotto(context)),
                        ],
                      ),
                    ]),
                  ),
                ]),
          ]),

          // SizedBox(
          //   width: 160,
          // ),

          // SizedBox(
          //   height: 20,
          // ),
          // _motto(),
          // Row()
        ],
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //Safearea class avoids notch and other intrusions.
        child: _layoutDetails(context),
      ),
    );
  }
}
