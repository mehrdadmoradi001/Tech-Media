import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_media/view/main_screen.dart';
import '../component/my_colors.dart';
import '../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 130,
                child: Image(
                  image: Assets.images.logo.provider(),height: 400,
                ),
              ),
              Positioned(
                bottom: 300,
                child: SpinKitFadingCube(
                  color: SolidColors.primaryColor,
                  size: 32.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
