import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:maya/screens/profile.dart';
import 'package:maya/screens/screen.dart';
import 'package:maya/screens/settings.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:maya/screens/storage.dart';
import 'package:tcard/tcard.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shake/shake.dart';
// import 'package:feature_discovery/feature_discovery.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

// class TutorialKeys {
//   static final keyOne = GlobalKey();
//   static final keyTwo = GlobalKey();
//   static final keyThree = GlobalKey();
//   static final keyFour = GlobalKey();
//   static final keyFive = GlobalKey();
// }

class _MainPageState extends State<MainPage> {
  double likeBtnWidth = 75;
  double dislikeBtnWidth = 75;
  TCardController _controller = TCardController();
  int cardNumber;
  bool isVisible;
  bool isFirstCard = true;

  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      Fluttertoast.showToast(
          msg: "6 people looking at your profile right now!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.yellowAccent,
          textColor: Colors.black,
          fontSize: 16.0);
    });
  }

  Widget _picture(imgLocation) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 23.0,
            spreadRadius: -13.0,
            color: Colors.black54,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Image.asset(
          imgLocation,
          height: 400,
          width: 350,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _bio(List details) {
    String name = details[0];
    String age = details[1];
    String bio = details[2];
    String location = details[3];
    return SizedBox(
        width: 350,
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: RaisedButton(
            color: Color(0xFFEC3F27),
            textColor: Colors.white,
            onPressed: () {},
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  name + ", " + age,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 27,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  bio,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on),
                      Text(
                        " " + location,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _likeUnlikeButtons() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              print("Dislike");
              _controller.forward(direction: SwipDirection.Left);
            },
            child: AvatarGlow(
              endRadius: 45.0,
              glowColor: Colors.redAccent,
              // duration: Duration(milliseconds: 4000),
              showTwoGlows: true,
              child: Image(
                // elevation: 8.0,
                image: AssetImage('assets/images/cross2.png'),
                width: dislikeBtnWidth,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _controller.forward(direction: SwipDirection.Right);
            },
            child: AvatarGlow(
              endRadius: 50.0,
              glowColor: Colors.redAccent,
              child: Image(
                image: AssetImage('assets/images/heart.png'),
                width: dislikeBtnWidth,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // setState(() {
              //   // isVisible = false;
              // });
              //
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => EmptyChatPage("Prakriti Regmi"),
                ),
              );
            },
            child: AvatarGlow(
              endRadius: 45.0,
              glowColor: Colors.redAccent,
              child: Image(
                image: AssetImage('assets/images/chat.png'),
                width: dislikeBtnWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _layoutDetails() {
    @override
    Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      setState(() {
        likeBtnWidth = 150;
        dislikeBtnWidth = 150;
        // likeBtnWidth -= 10;
        // dislikeBtnWidth -= 10;
      });

      List<String> images = [
        'assets/images/girls/girl1.png',
        'assets/images/girls/girl2.png',
        'assets/images/girls/girl3.png',
        'assets/images/girls/girl4.png',
        'assets/images/girls/girl5.png',
        'assets/images/girls/girl6.png',
      ];

      List<String> personalDetails = [
        'Prakriti Regmi%20%Lets read Murakami together.%Chabahil (1 mi away)',
        'Dristi Sigdel%19%Belle áme%Sundhara (2 mi away)',
        'Prajita Upreti%19%Here to make friends.%Makalbari (2.3 mi away)',
        'Sugandhi C.%21%Not looking for any drama.%Bhaktapur (7 mi away)',
        "Pawana Shrestha%20%Why am I here for?%Attarkhel",
        "Tanuja Shrestha%21%Hi there! ♐︎%Dakshin Dhoka"
      ];

      List<Widget> cards = List.generate(
        images.length < personalDetails.length
            ? images.length
            : personalDetails.length,
        (int index) {
          return GlassContainer.frostedGlass(
            height: 800,
            width: 800,

            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.40),
                Colors.white.withOpacity(0.10)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
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
            elevation: 3.0,
            shadowColor: Colors.black.withOpacity(0.30),
            alignment: Alignment.center,
            frostedOpacity: 0.12,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            // margin: EdgeInsets.all(8.0),
            // padding: EdgeInsets.all(8.0),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: Container(
                  // height: 800,
                  // width: 900,
                  // decoration: BoxDecoration(
                  // color: Color(0xfff2f2f4),
                  // border: Border.all(
                  //   color: Color(0xfff2f2f4),
                  // ),
                  // borderRadius: BorderRadius.all(Radius.circular(30)),
                  // boxShadow: [
                  //   BoxShadow(
                  //     // color: Colors.grey[500],
                  //     blurRadius:
                  //         23.0, // has the effect of softening the shadow
                  //     spreadRadius:
                  //         -2, // has the effect of extending the shadow
                  //     offset: Offset(
                  //       2.0, // horizontal, move right 10
                  //       2.0, // vertical, move down 10
                  //     ),
                  //   )
                  // ],
                  // ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Center(child: _picture(images[index])),
                          SizedBox(
                            height: 30,
                          ),
                          _bio(personalDetails[index].split("%")),
                          SizedBox(
                            height: 10,
                          ),
                          _likeUnlikeButtons()
                        ],
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: SizedBox(
                          width: 30,
                          child: Visibility(
                            visible: isFirstCard,
                            child: isVisible
                                ? FloatingActionButton(
                                    hoverColor: Colors.green,
                                    backgroundColor: Colors.white,
                                    onPressed: () {
                                      // setState(() {
                                      //   isVisible = false;
                                      // });
                                      _controller.back();
                                    },
                                    child: Icon(
                                      Icons.undo_rounded,
                                      color: Colors.redAccent,
                                    ),
                                  )

                                // ? FloatingActionButton(
                                //     heroTag: null,
                                //     onPressed: () {
                                //       setState(() {
                                //         isVisible = false;
                                //         print("pressed undo");
                                //       });
                                //     },
                                //     child: Icon(Icons.undo_rounded),
                                //     backgroundColor: Color(0xFFEC3F27),
                                //   )
                                : Container(),
                            replacement: Container(),
                          ),
                        ),
                      ),
                    ],
                    // child:
                  ),
                )),
          );
          // );
        },
      );

      return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: TCard(
          controller: _controller,
          onForward: (index, info) {
            if (info.direction == SwipDirection.Right) {
              Fluttertoast.showToast(
                  msg: "Liked",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.yellow,
                  textColor: Colors.black,
                  fontSize: 16.0);
            }

            setState(() {
              isFirstCard = false;
            });
          },
          onBack: (index, info) {
            // _controller.forward(SwipDirection);
            // print(index);
          },
          onEnd: () {
            _controller.reset();
          },
          size: Size(double.infinity, double.infinity),
          cards: cards,
        ),
      );

      // return Center(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 20,
      //       ),
      //       TCard(
      //         size: Size(400, 500),
      //         cards: cards,
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       _bio()
      //     ],
      //   ),
      // );
    } else {
      setState(() {
        likeBtnWidth = 110;
        dislikeBtnWidth = 110;
        // likeBtnWidth -= 10;
        // dislikeBtnWidth -= 10;
      });
      return Row(
        mainAxisAlignment:
            MainAxisAlignment.center, //Center Row contents horizontally,
        crossAxisAlignment:
            CrossAxisAlignment.center, //Center Row contents vertically,
        children: [
          SizedBox(
            width: 40,
          ),
          Container(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _picture('assets/images/girl1.png'),
            ),
          ),
          SizedBox(
            width: 80,
          ),
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    children: [
                      Container(
                          width: 300,
                          height: 150,
                          child: _bio(["he", "hi", "ho", "ho"])),
                      Container(child: _likeUnlikeButtons()),
                    ],
                  )),
            ],
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    isVisible = true;
    return _layoutDetails();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItemPosition = 1;
  final SecureStorage secureStorage = SecureStorage();

  final tabs = [ProfilePage(), MainPage(), ChatSection()];

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit maya?'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                // onTap: () => Navigator.of(context).pop(true),
                onTap: () => SystemNavigator.pop(),
                child: Text("YES"),
              ),
            ],
            actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 20),
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 5, 0),
                child: Image.asset(
                  "assets/images/logonomaya.png",
                  width: 50,
                ),
              ),
              // centerTitle: true,
              title: Text(
                // "मा या",
                "Maya",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 26,
                  color: Colors.pinkAccent[400],
                ),
              ),
              actions: <Widget>[
                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.accessibility_new,
                    size: 28.0,
                    color: Colors.redAccent,
                  ),
                  onSelected: (value) {
                    switch (value) {
                      case 'B/W Filter on':
                        secureStorage.writeSecureData("blackandwhite", "true");
                        Phoenix.rebirth(context);
                        break;

                      case 'B/W Filter off':
                        secureStorage.deleteSecureData("blackandwhite");
                        Phoenix.rebirth(context);
                        break;

                      case 'Invert on':
                        secureStorage.writeSecureData("invert", "true");
                        Phoenix.rebirth(context);
                        break;

                      case 'Invert off':
                        secureStorage.deleteSecureData("invert");
                        Phoenix.rebirth(context);
                        break;
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return {
                      'B/W Filter on',
                      'B/W Filter off',
                      'Invert on',
                      'Invert off'
                    }.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => SettingsPage(),
                            ));
                      },
                      child: Icon(
                        Icons.settings_outlined,
                        size: 28.0,
                        color: Colors.redAccent,
                      ),
                    )),
              ],
            ),
          ),
          body: tabs[_selectedItemPosition],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                ),
              ],
            ),
            child: SnakeNavigationBar.color(
              height: 60,
              backgroundColor: Colors.white,
              behaviour: SnakeBarBehaviour.floating,
              snakeShape: SnakeShape.indicator,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0))),
              // padding: EdgeInsets.all(12),

              ///configuration for SnakeNavigationBar.color
              // snakeViewColor: Colors.redAccent,
              snakeViewColor: Color(0xFFEC3F27),
              selectedItemColor: SnakeShape.circle == SnakeShape.indicator
                  ? Colors.black
                  // : Color(0xFFEC3F27),
                  : Color(0xFFEC3F27),
              unselectedItemColor: Colors.blueGrey,
              //blueGrey thyo

              showUnselectedLabels: false,
              showSelectedLabels: false,

              currentIndex: _selectedItemPosition,
              onTap: (index) => setState(() => _selectedItemPosition = index),

              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_sharp, size: 28),
                    label: 'profile'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.water_damage_outlined, size: 28),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.messenger_outline_rounded, size: 28),
                    label: 'messages'),
              ],
            ),
          ),
        ));
  }
}
