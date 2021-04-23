import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maya/screens/storage.dart';
import '../constants.dart';
import '../screens/screen.dart';
import '../widgets/widget.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

String finalEmail, finalName;

class SplashScreen extends StatelessWidget {
  final SecureStorage secureStorage = SecureStorage();

  Future<String> fetchValues() async {
    finalEmail = await secureStorage.readSecureData("email");
    finalName = await secureStorage.readSecureData("name");
    return finalEmail;
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
            else
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  textTheme:
                      GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
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
              ); // snapshot.data  :- get your object which is pass from your downloadData() function
          }
        });
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //Safearea class avoids notch and other intrusions.
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Image(
                          image: AssetImage('assets/images/final-removebg.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            //   child: Image.asset('assets/images/logonomaya.png',
                            //       width: 80),
                            // ),
                            // SizedBox(
                            //   width: 50,
                            ),
                        Text(
                          "मायासँग जोडिनुहोस्\nमायाबाट",
                          style: kHeadline,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        "Connect with Maya to get one step closer to your love.",
                        // "",
                        style: kBodyTextPlus,
                        textAlign: TextAlign.center,
                      ),
                    ),
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
              Padding(
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
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => RegisterPage()));
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
