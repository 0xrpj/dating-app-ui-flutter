import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../constants.dart';

// import '../screens/screen.dart';
// import '../widgets/widget.dart';
//

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double likeBtnWidth = 150;
  double dislikeBtnWidth = 150;
  int _selectedItemPosition = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/images/girl1.png',
                height: 350,
                width: 350,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
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
              )),
          SizedBox(
            height: 20,
          ),
          AnimatedContainer(
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
                      // likeBtnWidth += 10;
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
          )
        ],
      ),
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
              : Colors.black,
          unselectedItemColor: Colors.blueGrey,
          //blueGrey thyo

          showUnselectedLabels: false,
          showSelectedLabels: false,

          currentIndex: _selectedItemPosition,
          onTap: (index) => setState(() => _selectedItemPosition = index),

          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_sharp), label: 'profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.water_damage_outlined), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.messenger_outline_rounded), label: 'messages'),
          ],
        ),
      ),
    );
  }
}
