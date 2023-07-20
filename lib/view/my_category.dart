import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_media/component/my_strings.dart';
import '../gen/assets.gen.dart';

class MyCategory extends StatelessWidget {
  const MyCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.height / 20;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: bodyMargin),
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
            ],
          ),
        ),
      ),
    );
  }
}
