import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_media/component/my_colors.dart';
import 'package:tech_media/view/home_screen.dart';
import 'package:tech_media/view/profile_screen.dart';

import '../gen/assets.gen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    List<Widget> techMainScreenPage = [
      HomeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
      ProfileScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
    ];

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: SolidColors.scaffoldBg,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.menu),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: SvgPicture.asset(
                Assets.images.logo.path,
                height: size.height / 12,
              ),
            ),
            const Icon(Icons.search),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Positioned.fill(
                child: techMainScreenPage[selectedPageIndex],
              ),
            ),
            //HomeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
            BottomNavBar(
              size: size,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.size,
    required this.changeScreen,
  });

  final Size size;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 15,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.white,
              offset: Offset(-10, -25),
            ),
            BoxShadow(
              blurRadius: 20,
              color: Colors.white,
              offset: Offset(-10, 20),
            )
          ],
          gradient: LinearGradient(
            colors: GradientColors.bottomNavBackground,
            begin: Alignment(-1, -1),
            end: Alignment(1, 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: (() => changeScreen(0)),
              icon: ImageIcon(
                Assets.icons.home.provider(),
                color: Colors.black,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                Assets.icons.writer.path,
                width: 60,
                height: 60,
              ),
            ),
            IconButton(
              onPressed: (() => changeScreen(1)),
              icon: ImageIcon(
                Assets.icons.user.provider(),
                color: Colors.black,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
