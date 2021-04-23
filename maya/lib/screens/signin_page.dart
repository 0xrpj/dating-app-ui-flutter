import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maya/screens/storage.dart';
import '../constants.dart';
import '../screens/screen.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../widgets/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

Widget _alertWidget(BuildContext context, String title, String content) {
  showDialog(
      context: context,
      builder: (context) => new AlertDialog(
            title: new Text(title),
            content: new Text(content),
            actions: [
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("Dismiss"),
              ),
            ],
            actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 20),
          ));
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool isPasswordVisible = true;
  bool loading = false;

  final SecureStorage secureStorage = SecureStorage();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            // resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: kBackgroundColor,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image(
                  width: 24,
                  color: Colors.white,
                  image: Svg('assets/images/back_arrow.svg'),
                ),
              ),
            ),
            body: SafeArea(
              //to make page scrollable
              child: Container(
                child: CustomScrollView(
                  reverse: true,
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        // padding: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 18),

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome back.",
                                    style: kHeadline,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "We missed you <3!",
                                    style: kBodyText2,
                                  ),
                                  SizedBox(
                                    // height: 40,
                                    height: MediaQuery.of(context).size.height /
                                        30.05,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: TextField(
                                      controller: usernameController,
                                      style: kBodyText.copyWith(
                                          color: Colors.white),
                                      // keyboardType: inputType,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(20),
                                        hintText: 'Phone, email or username',
                                        hintStyle: kBodyText,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: TextField(
                                      controller: passwordController,
                                      // isPasswordVisible: isPasswordVisible,
                                      // onTap: () {
                                      //   setState(() {
                                      //     isPasswordVisible = !isPasswordVisible;
                                      //   });
                                      // },
                                      style: kBodyText.copyWith(
                                        color: Colors.white,
                                      ),
                                      obscureText: isPasswordVisible,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                      decoration: InputDecoration(
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: IconButton(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onPressed: () {
                                              setState(() {
                                                isPasswordVisible =
                                                    !isPasswordVisible;
                                              });
                                            },
                                            icon: Icon(
                                              isPasswordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.all(20),
                                        hintText: 'Password',
                                        hintStyle: kBodyText,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Dont't have an account? ",
                                  style: kBodyText,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => RegisterPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Register',
                                    style: kBodyText.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            MyTextButton(
                              buttonName: 'Sign In',
                              onTap: () async {
                                try {
                                  setState(() => loading = true);

                                  FirebaseUser user = (await FirebaseAuth
                                          .instance
                                          .signInWithEmailAndPassword(
                                              email: usernameController.text,
                                              password:
                                                  passwordController.text))
                                      .user;

                                  if (user != null) {
                                    //Saving to storage so that login data is retained
                                    secureStorage.writeSecureData(
                                        "email", user.email);
                                    secureStorage.writeSecureData(
                                        "name", user.displayName);

                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => HomePage(),
                                      ),
                                    );
                                    setState(() => loading = false);
                                  }
                                } catch (error) {
                                  setState(() => loading = false);
                                  var errorCode = error.code;
                                  var errorMessage = error.message;

                                  if (errorCode == 'ERROR_USER_DISABLED') {
                                    _alertWidget(context, "Account Disabled",
                                        "Your account has been disabled for violating our terms and conditions.\n\nDetailed error message:\n$errorMessage");
                                  } else if (errorCode ==
                                      'ERROR_USER_NOT_FOUND') {
                                    _alertWidget(
                                        context,
                                        "Invalid email or password",
                                        "Please recheck your email or password.\nIf you haven't created an account, please create an account first.\n\nDetailed error message:\n$error");
                                  } else if (errorCode ==
                                      'ERROR_TOO_MANY_REQUESTS') {
                                    _alertWidget(
                                        context,
                                        "Too many failed attempts",
                                        "Please try again later as the access from this device is blocked temporarily.\n\nDetailed error message:\n$error");
                                  } else {
                                    _alertWidget(
                                        context,
                                        "Invalid email or password",
                                        "Please recheck your email or password.\nIf you haven't created an account, please create an account first.\n\nDetailed error message:\n$error");
                                  }
                                }
                                // if (usernameController.text == 'rosh' &&
                                //     passwordController.text == 'hello123') {
                                //   // if (passwordController.text == 'hello123') {
                                //   // Navigator.push(
                                //   //   context,
                                //   //   CupertinoPageRoute(
                                //   //     builder: (context) => HomePage(),
                                //   //   ),
                                //   // );
                                //   // }
                                // } else {
                                //   showDialog(
                                //     context: context,
                                //     builder: (BuildContext context) {
                                //       return AlertDialog(
                                //         title: Text("Login unsuccessful"),
                                //         content: Text(
                                //             "Please check your username and password."),
                                //         actions: [
                                //           // okButton,
                                //           FlatButton(
                                //             child: Text("OK"),
                                //             onPressed: () {
                                //               Navigator.pop(context);
                                //             },
                                //           )
                                //         ],
                                //       );
                                //     },
                                //   );
                                // }
                              },
                              // bgColor: Colors.white,
                              // textColor: Colors.black87,
                              bgColor: Color(0xFFEC3F27),
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
