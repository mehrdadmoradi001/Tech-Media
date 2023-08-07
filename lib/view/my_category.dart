import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_media/component/my_colors.dart';
import 'package:tech_media/component/my_components.dart';
import 'package:tech_media/component/my_strings.dart';
import 'package:tech_media/models/fake_data.dart';
import '../gen/assets.gen.dart';

class MyCategory extends StatefulWidget {
  const MyCategory({Key? key}) : super(key: key);

  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.height / 20;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: bodyMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 36),
                SvgPicture.asset(
                  Assets.images.tcbot.path,
                  height: 100,
                ),
                const SizedBox(height: 16),
                Text(
                  textAlign: TextAlign.center,
                  MyStrings.successfulRegistration,
                  style: textTheme.headlineLarge,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    hintText: MyStrings.nameAndFamilyName,
                    hintStyle: textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  textAlign: TextAlign.center,
                  MyStrings.chooseCats,
                  style: textTheme.headlineLarge,
                ),
                const SizedBox(height: 32),
                //tag hashtag list
                SizedBox(
                  height: 85,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    itemCount: HashTagModelList.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            // If selectedTags didn't contain an index, add index
                            if(!selectedTags.contains(HashTagModelList[index])){
                              selectedTags.add(HashTagModelList[index]);
                            }
                          });
                        },
                        child: MainTagsHashtags(
                          textStyle: textTheme.titleMedium,
                          gradient: const LinearGradient(
                            colors: GradientColors.tags,
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                          ),
                          textTheme: textTheme,
                          index: index,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Image.asset(
                  Assets.icons.downCatArrow.path,
                  height: 55,
                ),
                const SizedBox(height: 24),
                //selectedTags
                SizedBox(
                  height: 85,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    itemCount: selectedTags.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.23,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(24),
                          ),
                          color: SolidColors.surface,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(width: 8),
                              Text(
                                selectedTags[index].title,
                                style: textTheme.displaySmall,
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedTags.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    CupertinoIcons.delete,
                                    color: Colors.grey,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
