import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_media/component/my_colors.dart';
import 'package:tech_media/component/my_strings.dart';
import 'package:tech_media/controller/home_screen_controller.dart';
import 'package:tech_media/gen/assets.gen.dart';
import 'package:tech_media/models/fake_data.dart';

import '../component/my_components.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  // ایجاد dependency با controller یی که براش ساختیم که از متد put استفاده میکنیم
  // که دسترسی به داده ها و متدهایی که داخلش تعریف کردیم
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: homeScreenController.loading.value == false
            ? Obx(
              () =>
              Column(
                children: [
                  //AppBar custom
                  const SizedBox(height: 8),
                  //banner
                  poster(),
                  const SizedBox(height: 16),
                  // Hashtags
                  tags(),
                  const SizedBox(height: 32),
                  //view hots blog
                  SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),
                  topVisited(),
                  //photo & title hots blog
                  const SizedBox(height: 32),
                  SeeMorePodcast(
                      bodyMargin: bodyMargin, textTheme: textTheme),
                  topPodcasts(),
                  const SizedBox(height: 50),
                ],
              ),
        )
            : const LoadingSpinK(),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: homeScreenController.topVisitedList.length,
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
                            image: NetworkImage(homeScreenController
                                .topVisitedList[index].image!),
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
                              homeScreenController
                                  .topVisitedList[index].author!,
                              style: textTheme.labelMedium,
                            ),
                            Row(
                              children: [
                                Text(
                                  homeScreenController
                                      .topVisitedList[index].view!,
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
                    homeScreenController.topVisitedList[index].title!,
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

  Widget topPodcasts() {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: homeScreenController.topPodcasts.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                EdgeInsets.fromLTRB(8, 8, index == 0 ? bodyMargin : 15, 8),
                //blogModelList
                child: CachedNetworkImage(
                  imageUrl: homeScreenController.topPodcasts[index].poster!,
                  imageBuilder: (context, imageProvider) =>
                      Container(
                        height: size.height / 5.3,
                        width: size.width / 2.4,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  placeholder: (context, url) => const LoadingSpinK(),
                  errorWidget: (context, url, error) =>
                  const Icon(
                    Icons.image_not_supported_outlined,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.fromLTRB(8, 8, index == 0 ? bodyMargin : 15, 8),
                child: SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    homeScreenController.topPodcasts[index].title!,
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

  Widget poster() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              gradient: LinearGradient(
                colors: GradientColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) =>
                Container(
                  height: size.height / 5.3,
                  width: size.width / 2.4,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            placeholder: (context, url) =>
            const SpinKitFadingCube(
              color: SolidColors.primaryColor,
              size: 32.0,
            ),
            errorWidget: (context, url, error) =>
            const Icon(
              Icons.image_not_supported_outlined,
              size: 50,
              color: Colors.grey,
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
  Widget tags(){
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: HashTagModelList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
            child: MainTagsHashtags(
              textStyle: textTheme.titleMedium,
              textTheme: textTheme,
              index: index,
              gradient: const LinearGradient(
                colors: GradientColors.tags,
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
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