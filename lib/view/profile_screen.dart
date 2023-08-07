import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_media/component/my_colors.dart';
import 'package:tech_media/component/my_components.dart';
import 'package:tech_media/component/my_strings.dart';
import 'package:tech_media/gen/assets.gen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SolidColors.scaffoldBg,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            SvgPicture.asset(
              Assets.images.profileAvatar.path,
              height: 100,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  Assets.icons.bluePen.provider(),
                  color: SolidColors.seeMore,
                ),
                const SizedBox(width: 8),
                Text(
                  MyStrings.imageProfileEdit,
                  style: textTheme.headlineMedium,
                ),
              ],
            ),
            const SizedBox(height: 60),
            Text(
              MyStrings.nameFatemeAmiri,
              style: textTheme.headlineLarge,
            ),
            Text(
              MyStrings.gmailFatemeAmiri,
              style: textTheme.headlineLarge,
            ),
            const SizedBox(height: 40),
            TechDivider(size: size),
            InkWell(
              onTap: () {
                //execute
              },
              splashColor: SolidColors.primaryColor,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavBlog,
                    style: textTheme.headlineLarge,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            TechDivider(size: size),
            InkWell(
              onTap: () {
                //execute
              },
              splashColor: SolidColors.primaryColor,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavPodcast,
                    style: textTheme.headlineLarge,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            TechDivider(size: size),
            InkWell(
              onTap: () {
                //execute
              },
              splashColor: SolidColors.primaryColor,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.logOut,
                    style: textTheme.headlineLarge,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
