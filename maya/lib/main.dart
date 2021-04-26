import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import './screens/screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './translations/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(Phoenix(
    child: EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('np', 'NP')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'NP'),
        assetLoader: CodegenLoader(),
        child: MyApp()),
  ));
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Maya',
      // theme: ThemeData(
      //   textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      //   scaffoldBackgroundColor: kBackgroundColor,
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      // home: WelcomePage(),
      home: SplashScreen(),
    );
  }
}

// isBlackAndWhite
//         ? ColorFiltered(
//             colorFilter: ColorFilter.matrix([
//               0.2126,
//               0.7152,
//               0.0722,
//               0,
//               0,
//               0.2126,
//               0.7152,
//               0.0722,
//               0,
//               0,
//               0.2126,
//               0.7152,
//               0.0722,
//               0,
//               0,
//               0,
//               0,
//               0,
//               1,
//               0,
//             ]),
//             child: MaterialApp(
//               localizationsDelegates: context.localizationDelegates,
//               supportedLocales: context.supportedLocales,
//               locale: context.locale,
//               debugShowCheckedModeBanner: false,
//               title: 'Maya',
//               // theme: ThemeData(
//               //   textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
//               //   scaffoldBackgroundColor: kBackgroundColor,
//               //   primarySwatch: Colors.blue,
//               //   visualDensity: VisualDensity.adaptivePlatformDensity,
//               // ),
//               // home: WelcomePage(),
//               home: SplashScreen(),
//             ))
//         :
