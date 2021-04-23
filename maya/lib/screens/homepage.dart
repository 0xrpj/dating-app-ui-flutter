import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:maya/screens/profile.dart';
import 'package:maya/screens/screen.dart';
import 'package:maya/screens/settings.dart';

import '../constants.dart';

// import '../screens/screen.dart';
// import '../widgets/widget.dart';
//
//
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double likeBtnWidth = 150;
  double dislikeBtnWidth = 150;

  Widget _picture() {
    return Draggable(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.asset(
          'assets/images/girl1.png',
          height: 350,
          width: 350,
          fit: BoxFit.fill,
        ),
      ),
      feedback: Material(
        type: MaterialType.transparency,
        child: Image.asset(
          'assets/images/girl1.png',
          height: 350,
          width: 350,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _bio() {
    return SizedBox(
        width: 350,
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
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
                  "Ichya Parajuli, 21",
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
                  "Lawyer, Optimist.",
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
                        " Chabahil, Kathmandu",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
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
            },
            child: Image(
              image: AssetImage('assets/images/dislike.png'),
              width: dislikeBtnWidth,
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Like");
              setState(() {
                likeBtnWidth -= 10;
                // likeBtnWidth -= 10;
                // dislikeBtnWidth -= 10;
              });
            },
            child: Image(
              image: AssetImage('assets/images/like.png'),
              width: likeBtnWidth,
            ),
          )
        ],
      ),
    );
  }

  Widget _layoutDetails() {
    Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      setState(() {
        likeBtnWidth = 150;
        dislikeBtnWidth = 150;
        // likeBtnWidth -= 10;
        // dislikeBtnWidth -= 10;
      });
      return Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(child: _picture()),
          SizedBox(
            height: 40,
          ),
          _bio(),
          SizedBox(
            height: 20,
          ),
          _likeUnlikeButtons()
        ],
      );
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
              child: _picture(),
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
                      Container(width: 300, height: 150, child: _bio()),
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
    return _layoutDetails();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItemPosition = 1;

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
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => SettingsPage(),
                          ));
                      print("tapped setting icon");
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
      ),
    );
  }
}
