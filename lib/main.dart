import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_media/component/my_colors.dart';
import 'package:tech_media/view/splash_screen.dart';

void main() {
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa'), // farsi
      ],
      theme: ThemeData(
        fontFamily: 'vazir',
        brightness: Brightness.light,
        textTheme: TextTheme(
          labelLarge: TextStyle(
            fontFamily: 'vazir',
              fontWeight: FontWeight.w500,
            fontSize: 16,
            color: SolidColors.posterTitle
          ),
          labelMedium: TextStyle(
              fontFamily: 'vazir',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColors.posterSubTitle
          ),
          titleMedium: TextStyle(
              fontFamily: 'vazir',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.white
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
