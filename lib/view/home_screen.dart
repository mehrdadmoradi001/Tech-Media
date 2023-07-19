import 'package:flutter/material.dart';
import 'package:tech_media/component/my_colors.dart';
import 'package:tech_media/component/my_strings.dart';
import 'package:tech_media/gen/assets.gen.dart';
import 'package:tech_media/models/fake_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: Column(
          children: [
            //AppBar custom
            SizedBox(height: 8),
            //banner
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
                        image:
                        AssetImage(homePagePosterMap['imageAsset']),
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
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
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
                        padding: const EdgeInsets.fromLTRB(0, 0, 28, 0),
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
            SizedBox(height: 16),
            // Hashtags
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: HashTagModelList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 8, index == 0 ? bodyMargin : 15, 8),
                    child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(24),
                          ),
                          gradient: LinearGradient(
                            colors: GradientColors.tags,
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                          ),
                        ),
                        child: Padding(
                          padding:
                          const EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: Row(
                            children: [
                              ImageIcon(
                                Assets.icons.hashtagicon.provider(),
                                color: Colors.white,
                                size: 14,
                              ),
                              SizedBox(width: 8),
                              Text(
                                HashTagModelList[index].title,
                                style: textTheme.titleMedium,
                              ),
                            ],
                          ),
                        )),
                  );
                },
              ),
            ),
            SizedBox(height: 32),
            //view hots blog
            Row(
              children: [
                Padding(
                  padding:
                  EdgeInsets.only(right: bodyMargin, bottom: 8),
                  child: ImageIcon(
                    Assets.icons.bluePen.provider(),
                    color: SolidColors.blackColor,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  MyStrings.viewHotsBlog,
                  style: textTheme.headlineMedium,
                ),
              ],
            ),
            //photo & title hots blog
            SizedBox(
              height: size.height / 3.5,
              child: ListView.builder(
                itemCount: blogModelList.getRange(0, 5).length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            8, 8, index == 0 ? bodyMargin : 15, 8),
                        //blogModelList
                        child: SizedBox(
                          height: size.height / 5.3,
                          width: size.width / 2.4,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        blogModelList[index].imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  gradient: LinearGradient(
                                    colors: GradientColors.blogPost,
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      blogModelList[index].writer,
                                      style: textTheme.labelMedium,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          blogModelList[index].views,
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
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            8, 8, index == 0 ? bodyMargin : 15, 8),
                        child: SizedBox(
                          width: size.width / 2.4,
                          child: Text(
                            blogModelList[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Padding(
                  padding:
                  EdgeInsets.only(right: bodyMargin, bottom: 8),
                  child: ImageIcon(
                    Assets.icons.microphon.provider(),
                    color: SolidColors.blackColor,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  MyStrings.viewHotsPodCasts,
                  style: textTheme.headlineMedium,
                ),
              ],
            ),
            SizedBox(
              height: size.height / 3.5,
              child: ListView.builder(
                itemCount: blogModelList.getRange(1, 6).length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            8, 8, index == 0 ? bodyMargin : 15, 8),
                        //blogModelList
                        child: Container(
                          height: size.height / 5.3,
                          width: size.width / 2.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                  blogModelList[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            8, 8, index == 0 ? bodyMargin : 15, 8),
                        child: SizedBox(
                          width: size.width / 2.4,
                          child: Text(
                            blogModelList[index].writer,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 50),

          ],
        ),
      ),
    );
  }
}