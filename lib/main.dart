import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_media/component/my_colors.dart';
import 'package:tech_media/view/register_intro.dart';
import 'package:tech_media/view/splash_screen.dart';

void main() {
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: SolidColors.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:const  [
        Locale('fa'), // farsi
      ],
      theme: ThemeData(
        fontFamily: 'vazir',
        brightness: Brightness.light,
        textTheme: const TextTheme(
          labelLarge: TextStyle(
              fontFamily: 'vazir',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: SolidColors.posterTitle),
          labelMedium: TextStyle(
              fontFamily: 'vazir',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColors.posterSubTitle),
          titleMedium: TextStyle(
              fontFamily: 'vazir',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.white),
          headlineMedium: TextStyle(
              fontFamily: 'vazir',
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: SolidColors.seeMore),
          headlineLarge: TextStyle(
              fontFamily: 'vazir',
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: SolidColors.blackColor),
        ),
      ),
      home: const RegisterIntro(),
    );
  }
}
