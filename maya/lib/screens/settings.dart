import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
// import 'package:flutter_tts/flutter_tts.dart';
import 'package:maya/screens/profile.dart';
import 'package:maya/screens/screen.dart';
import 'package:maya/screens/settings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maya/screens/storage.dart';
import '../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';
//Settings widget
import 'package:flutter_settings/button/settings_button_layer.dart';
import 'package:flutter_settings/checkbox/layer/checkbox_layer.dart';
import 'package:flutter_settings/checkbox/settings_checkbox_factory.dart';
import 'package:flutter_settings/checkbox/shapes/square_checkbox_shape.dart';
import 'package:flutter_settings/checkbox/shapes/switch_checkbox_shape.dart';
import 'package:flutter_settings/inputField/base/base_input_dialog.dart';
import 'package:flutter_settings/inputField/dialogs/simple_input_dialog.dart';
import 'package:flutter_settings/inputField/input_dialog_factory.dart';
import 'package:flutter_settings/list/items/selection_check_item.dart';
import 'package:flutter_settings/list/items/selection_item_factory.dart';
import 'package:flutter_settings/list/items/selection_radio_item.dart';
import 'package:flutter_settings/list/selection_dialogs/SimpleSelectionDialog.dart';
import 'package:flutter_settings/models/settings_list_item.dart';
import 'package:flutter_settings/navigator/base/base_navigator_shape.dart';
import 'package:flutter_settings/navigator/layer/navigator_layer.dart';
import 'package:flutter_settings/navigator/shapes/arrow_navigator_shape.dart';
import 'package:flutter_settings/slider/slider_layer.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';
import 'package:flutter_settings/widgets/BaseWidget.dart';
import 'package:flutter_settings/widgets/Separator.dart';
import 'package:flutter_settings/widgets/SettingsButton.dart';
import 'package:flutter_settings/widgets/SettingsCheckBox.dart';
import 'package:flutter_settings/widgets/SettingsIcon.dart';
import 'package:flutter_settings/widgets/SettingsInputField.dart';
import 'package:flutter_settings/widgets/SettingsNavigatorButton.dart';
import 'package:flutter_settings/widgets/SettingsSection.dart';
import 'package:flutter_settings/widgets/SettingsSelectionList.dart';
import 'package:flutter_settings/widgets/SettingsSlider.dart';

import '../constants.dart';

import 'package:local_auth/local_auth.dart';

LocalAuthentication localAuthentication = LocalAuthentication();
bool isFingerprint = false;
bool isAuth = false;
final SecureStorage secureStorage = SecureStorage();

Future<bool> checkFingerprint() async {
  bool canAuth = await localAuthentication.canCheckBiometrics;
  // List<BiometricType> bioList = List();
  try {
    if (canAuth) {
      // bioList = await localAuthentication.getAvailableBiometrics();
      bool result = await localAuthentication.authenticate(
          biometricOnly: true,
          localizedReason: " ",
          useErrorDialogs: true,
          stickyAuth: true);

      // if (result) {
      //   print("fingerprint milyo");
      // } else {
      //   print("fingerprint milena");
      // }
      return result; //auth supported but fingerprint not matched or similar errors
    } else {
      return false; //authentication not supported
    }
  } catch (e) {
    print(e);
    return false;
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedItemPosition = 1;
  String _phoneNumber = '9840378984';
  int _defaultLangList = 0;
  String _defaultLang = "English";
  List<SettingsSelectionItem<int>> _langList = List();

  _SettingsPageState() {
    _langList.add(SettingsSelectionItem<int>(0, "English"));
    _langList.add(SettingsSelectionItem<int>(1, "Nepali"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image(
              width: 24,
              color: Colors.black,
              image: Svg('assets/images/back_arrow.svg'),
            ),
          ),
          // centerTitle: true,
          title: Text(
            // "मा या",
            "Settings",
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              fontSize: 23,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "    " + LocaleKeys.accSett.tr(),
                style: TextStyle(fontSize: 19),
              ),
              SizedBox(
                height: 10,
              ),
              SettingsInputField(
                icon: new SettingsIcon(
                  //a custom icon please check out this custom_icons.dart
                  icon: Icons.call,
                  color: Colors.white,
                  backgroundColor: Colors.redAccent,
                ),
                dialogButtonText: 'Done',
                // title: 'Phone number',
                title: LocaleKeys.phNum.tr(),
                dialogTitle: LocaleKeys.updatePhNum.tr(),
                caption: _phoneNumber, //_simCaption,
                onPressed: (value) {
                  // print("helllllllllllllllllllllllllo" + LocaleKeys.delAcc.tr());
                  if (value.toString().isNotEmpty) {
                    Fluttertoast.showToast(
                        msg: "Phone number was updated.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);

                    setState(() {
                      _phoneNumber = value;
                    });
                  } else {
                    Fluttertoast.showToast(
                        msg: "Phone number was not updated.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                context: context,
              ),
              SettingsButton(
                title: "Edit Profile",
                // caption: "caffe wifi",
                icon: new SettingsIcon(
                  icon: Icons.edit,
                  backgroundColor: Colors.redAccent,
                  color: Colors.white,
                ),
                onPressed: () async {
                  Fluttertoast.showToast(
                      msg: "Feature will be added in next update.",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
              ),
              SettingsButton(
                title: "Logout",
                // caption: "caffe wifi",
                icon: new SettingsIcon(
                  icon: Icons.logout,
                  backgroundColor: Colors.redAccent,
                  color: Colors.white,
                ),
                onPressed: () async {
                  Fluttertoast.showToast(
                      msg: "Logging you out.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);

                  secureStorage.deleteSecureData("email");

                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(builder: (context) => SplashScreen()));
                },
              ),

              SettingsButton(
                title: LocaleKeys.delAcc.tr(),
                // caption: "caffe wifi",
                icon: new SettingsIcon(
                  icon: Icons.delete_forever_rounded,
                  backgroundColor: Colors.redAccent,
                  color: Colors.white,
                ),
                onPressed: () async {
                  Fluttertoast.showToast(
                      msg: "We will be sending you a confirmation email.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
              ),
              // SettingsSlider(
              //   value: 0.5,
              //   activeColor: Colors.blue,
              //   icon: new SettingsIcon(
              //     icon: Icons.list,
              //     color: Colors.red,
              //     text: 'Age Group',
              //   ),
              //   onChange: (value) {
              //     //Toast.show("now the brightness value becomes " +
              //     //      value.toString(), context);
              //   },
              // ),
              SizedBox(
                height: 10,
              ),
              Text(
                "    " + LocaleKeys.syssett.tr(),
                style: TextStyle(fontSize: 19),
              ),
              SizedBox(
                height: 10,
              ),
              SettingsCheckBox(
                title: LocaleKeys.useFin.tr(),
                icon: new SettingsIcon(
                  //a custom icon please check out this custom_icons.dart
                  icon: Icons.fingerprint_rounded,
                  color: Colors.white,
                  backgroundColor: Colors.redAccent,
                ),
                value: isFingerprint,
                type: CheckBoxWidgetType.Switch,
                onPressed: (bool value) async {
                  final result = await checkFingerprint();
                  if (result) {
                    setState(() {
                      // isFingerprint = true;
                    });
                    Fluttertoast.showToast(
                        msg: "Settings saved.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
              ),
              SettingsCheckBox(
                title: LocaleKeys.loc.tr(),
                // caption: "caffe wifi",
                icon: new SettingsIcon(
                  icon: Icons.gps_fixed_rounded,
                  backgroundColor: Colors.redAccent,
                  color: Colors.white,
                ),
                value: true,
                type: CheckBoxWidgetType.Switch,
                onPressed: () async {},
              ),
              SettingsSelectionList<int>(
                // turnOffList.add(SettingsSelectionItem<int>(0, "15 seconds"));
                items: _langList,
                chosenItemIndex: null,
                title: LocaleKeys.chhAppLang.tr(),
                dismissTitle: 'Cancel',
                // caption: _defaultLang,
                icon: new SettingsIcon(
                  icon: Icons.language_rounded,
                  color: Colors.white,
                  backgroundColor: Colors.redAccent,
                ),
                onSelect: (value, index) async {
                  setState(() {
                    _defaultLangList = index;
                    // _defaultLang = value.toString();
                  });
                  if (index == 0) {
                    //english selected
                    await context.setLocale(Locale("en", "US"));

                    setState(() {
                      _defaultLangList = 1;
                    });
                  } else if (index == 1) {
                    //nepali selected
                    await context.setLocale(Locale("np", "NP"));
                  }
                },
                context: context,
              ),
              SettingsButton(
                title: "Help and Support",
                // caption: "caffe wifi",
                icon: new SettingsIcon(
                  icon: Icons.help_center_rounded,
                  backgroundColor: Colors.redAccent,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await canLaunch(
                          "https://maya-application-android.netlify.app/")
                      ? await launch(
                          "https://maya-application-android.netlify.app/")
                      : throw 'Could not launch';
                },
              ),
              SettingsButton(
                title: "Report a bug",
                // caption: "caffe wifi",
                icon: new SettingsIcon(
                  icon: Icons.bug_report,
                  backgroundColor: Colors.redAccent,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await canLaunch(
                          "mailto:roshan.parajuly1@gmail.com?subject='Bug Report'&body=Device Details: \nPoco M2 Pro \n4 GB Ram\nAndroid 9 \nException: IgnoreHandle Exception on line 32.")
                      ? await launch(
                          "mailto:roshan.parajuly1@gmail.com?subject='Bug Report'&body=Device Details: \nPoco M2 Pro \n4 GB Ram\nAndroid 9 \nException: IgnoreHandle Exception on line 32.")
                      : throw 'Could not launch';
                },
              ),
              SettingsButton(
                title: "Integration inquiry",
                // caption: "caffe wifi",
                icon: new SettingsIcon(
                  icon: Icons.call,
                  backgroundColor: Colors.redAccent,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await canLaunch("tel:9864022333")
                      ? await launch("tel:9864022333")
                      : throw 'Could not launch';
                },
              ),
              SettingsButton(
                title: LocaleKeys.chAppUpd.tr(),
                // caption: "caffe wifi",
                icon: new SettingsIcon(
                  icon: Icons.update_rounded,
                  backgroundColor: Colors.redAccent,
                  color: Colors.white,
                ),
                onPressed: () async {
                  Fluttertoast.showToast(
                      msg: "Maya is up-to-date.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
