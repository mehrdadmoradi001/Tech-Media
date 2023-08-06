import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_media/component/my_colors.dart';
import 'package:tech_media/component/my_strings.dart';
import 'package:tech_media/view/home_screen.dart';
import 'package:tech_media/view/profile_screen.dart';

import '../gen/assets.gen.dart';


final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    /*List<Widget> techMainScreenPage = [
      HomeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
      ProfileScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
    ];*/

    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: SolidColors.scaffoldBg,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: bodyMargin),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                child: DrawerHeader(
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.images.logo.path,
                    ),
                  ), //Image.asset(Assets.images.logo.path,height: 2,),
                ),
              ),
              ListTile(
                title: Text(
                  MyStrings.userProfile,
                  style: textTheme.headlineLarge,
                ),
                onTap: () {},
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  MyStrings.aboutTec,
                  style: textTheme.headlineLarge,
                ),
                onTap: () {},
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  MyStrings.shareTec,
                  style: textTheme.headlineLarge,
                ),
                onTap: () {},
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  MyStrings.tecInGithub,
                  style: textTheme.headlineLarge,
                ),
                onTap: () {},
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        backgroundColor: SolidColors.scaffoldBg,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(onTap: () {
              _key.currentState!.openDrawer();
            }, child: const Icon(Icons.menu)),
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
        child: Obx(
          ()=> Stack(
            children: [
              Positioned.fill(
                child: IndexedStack(
                  index: selectedPageIndex.value,
                  children: [
                    HomeScreen(
                        size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                    ProfileScreen(
                        size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  ],
                ),
              ),
              //HomeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
              BottomNavBar(
                size: size,
                changeScreen: (int value) {

                    selectedPageIndex.value = value;

                },
              ),
            ],
          ),
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
