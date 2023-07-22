import 'package:flutter/material.dart';
import 'package:tech_media/component/my_colors.dart';
import 'package:tech_media/component/my_strings.dart';
import 'package:tech_media/gen/assets.gen.dart';
import 'package:tech_media/models/fake_data.dart';

import '../component/my_components.dart';

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
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: Column(
          children: [
            //AppBar custom
            const SizedBox(height: 8),
            //banner
            HomePagePoster(size: size, textTheme: textTheme),
            const SizedBox(height: 16),
            // Hashtags
            HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(height: 32),
            //view hots blog
            SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),
            //photo & title hots blog
            HomePageBlogList(
                size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(height: 32),
            SeeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),
            HomePagePodcastList(size: size, bodyMargin: bodyMargin),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: blogModelList.getRange(1, 6).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.fromLTRB(8, 8, index == 0 ? bodyMargin : 15, 8),
                //blogModelList
                child: Container(
                  height: size.height / 5.3,
                  width: size.width / 2.4,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(blogModelList[index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(8, 8, index == 0 ? bodyMargin : 15, 8),
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
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
          child: ImageIcon(
            Assets.icons.microphon.provider(),
            color: SolidColors.blackColor,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          MyStrings.viewHotsPodCasts,
          style: textTheme.headlineMedium,
        ),
      ],
    );
  }
}

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: blogModelList.getRange(0, 5).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.fromLTRB(8, 8, index == 0 ? bodyMargin : 15, 8),
                //blogModelList
                child: SizedBox(
                  height: size.height / 5.3,
                  width: size.width / 2.4,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(blogModelList[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        foregroundDecoration: const BoxDecoration(
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                const SizedBox(width: 8),
                                const Icon(
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
                padding:
                    EdgeInsets.fromLTRB(8, 8, index == 0 ? bodyMargin : 15, 8),
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
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
          child: ImageIcon(
            Assets.icons.bluePen.provider(),
            color: SolidColors.blackColor,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          MyStrings.viewHotsBlog,
          style: textTheme.headlineMedium,
        ),
      ],
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: HashTagModelList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
            child: MainTagsHashtags(
              textTheme: textTheme,
              index: index,
            ),
          );
        },
      ),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            image: DecorationImage(
                image: AssetImage(homePagePosterMap['imageAsset']),
                //Image(image: homePagePosterMap['imageAsset'].provider()).image,
                fit: BoxFit.cover),
          ),
          foregroundDecoration: const BoxDecoration(
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
                      const SizedBox(width: 8),
                      const Icon(
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
    );
  }
}
