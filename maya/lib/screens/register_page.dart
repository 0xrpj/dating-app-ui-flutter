import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../widgets/widget.dart';
import '../constants.dart';
import 'package:maya/screens/screen.dart';
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

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisibility = true;
  bool loading = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
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
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      // padding: const EdgeInsets.symmetric(
                      //   horizontal: 20,
                      // ),
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Column(
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Register",
                                  style: kHeadline,
                                ),
                                Text(
                                  "Create new account to get started.",
                                  style: kBodyText2,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                TextField(
                                  controller: _nameController,
                                  style:
                                      kBodyText.copyWith(color: Colors.white),
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    hintText: "Name",
                                    hintStyle: kBodyText,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextField(
                                  controller: _emailController,
                                  style:
                                      kBodyText.copyWith(color: Colors.white),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    hintText: "Email",
                                    hintStyle: kBodyText,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextField(
                                  controller: _phoneController,
                                  style:
                                      kBodyText.copyWith(color: Colors.white),
                                  keyboardType: TextInputType.phone,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    hintText: "Phone",
                                    hintStyle: kBodyText,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextField(
                                  controller: _passwordController,
                                  style: kBodyText.copyWith(
                                    color: Colors.white,
                                  ),
                                  obscureText: passwordVisibility,
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
                                            passwordVisibility =
                                                !passwordVisibility;
                                          });
                                        },
                                        icon: Icon(
                                          passwordVisibility
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
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
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
                                "Already have an account? ",
                                style: kBodyText,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => SignInPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Sign In",
                                  style: kBodyText.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MyTextButton(
                            buttonName: 'Register',
                            onTap: () async {
                              if (_emailController.text.isEmpty ||
                                  _passwordController.text.isEmpty ||
                                  _nameController.text.isEmpty ||
                                  _phoneController.text.isEmpty) {
                                _alertWidget(context, "Error in registration",
                                    "Some fields are empty.\nPlease fill out every fields.");
                              } else if (_phoneController.text.length < 10) {
                                _alertWidget(context, "Phone error",
                                    "The phone number you provided is invalid.\nPlease choose a valid number.");
                              } else {
                                try {
                                  setState(() => loading = true);

                                  FirebaseUser user = (await FirebaseAuth
                                          .instance
                                          .createUserWithEmailAndPassword(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text))
                                      .user;

                                  if (user != null) {
                                    UserUpdateInfo updateUser =
                                        UserUpdateInfo();
                                    updateUser.displayName =
                                        _nameController.text;
                                    user.updateProfile(updateUser);

                                    showDialog(
                                        context: context,
                                        builder: (context) => new AlertDialog(
                                              title: new Text(
                                                  "Registration Successful!"),
                                              content: new Text(
                                                  "You will now be taken to the homepage."),
                                              actions: [
                                                new GestureDetector(
                                                  onTap: () => {
                                                    Navigator.push(
                                                      context,
                                                      CupertinoPageRoute(
                                                        builder: (context) =>
                                                            HomePage(),
                                                      ),
                                                    ),
                                                    setState(
                                                        () => loading = false)
                                                  },
                                                  child: Text("Continue"),
                                                ),
                                              ],
                                              actionsPadding:
                                                  EdgeInsets.fromLTRB(
                                                      0, 0, 20, 20),
                                            ));
                                  }
                                } catch (error) {
                                  setState(() => loading = false);
                                  var errorCode = error.code;
                                  var errorMessage = error.message;
                                  if (errorCode == 'ERROR_WEAK_PASSWORD') {
                                    _alertWidget(context, "Password Error",
                                        "The password is too weak.\nPlease try another stronger password.\n\nDetailed error message:\n$errorMessage");
                                  } else if (errorCode ==
                                      'ERROR_EMAIL_ALREADY_IN_USE') {
                                    _alertWidget(context, "Email Error",
                                        "Email is already in use by another account.\nPlease enter a new email.\n\nDetailed error message:\n$error");
                                  } else if (errorCode ==
                                      'ERROR_INVALID_EMAIL') {
                                    _alertWidget(context, "Email Error",
                                        "Email is invalid.\nPlease check the spelling and structure of email.\n\nDetailed error message:\n$error");
                                  } else {
                                    _alertWidget(
                                        context,
                                        "Something weird happened.",
                                        "A bug that we didn't predict has occured.\nPlease consider emailing the developer on roshan.parajuly1@gmail.com\n\nDetailed error message:\n$errorMessage");
                                  }
                                  print(error);
                                }
                              }
                            },
                            // bgColor: Colors.white,
                            // textColor: Colors.black87,
                            bgColor: Color(0xFFF1792C),
                            textColor: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
