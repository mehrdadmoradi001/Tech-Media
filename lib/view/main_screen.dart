import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_media/component/my_colors.dart';
import 'package:tech_media/component/my_strings.dart';
import 'package:tech_media/models/fake_data.dart';
import '../gen/assets.gen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.menu),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: SvgPicture.asset(
                      Assets.images.logo.path,
                      height: size.height / 12,
                    ),
                  ),
                  Icon(Icons.search),
                ],
              ),
              SizedBox(height: 8),
              Stack(
                children: [
                  Container(
                    width: size.width / 1.25,
                    height: size.height / 4.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                      image: DecorationImage(
                          image: AssetImage(homePagePosterMap['imageAsset']),
                          //Image(image: homePagePosterMap['imageAsset'].provider()).image,
                          fit: BoxFit.cover),
                    ),
                    foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                        gradient: LinearGradient(
                          colors: GradientColors.homePosterCoverGradiant,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              homePagePosterMap['writer'] +
                                  ' - ' +
                                  homePagePosterMap['data'],
                              style: textTheme.labelMedium,
                            ),
                            Row(
                              children: [
                                Text(
                                  homePagePosterMap['view'],
                                  style: textTheme.labelMedium,
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,28,0),
                          child: Text(
                            homePagePosterMap['title'],
                            style: textTheme.labelLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
