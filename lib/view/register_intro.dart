import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_media/component/my_colors.dart';
import 'package:tech_media/component/my_strings.dart';
import 'package:tech_media/gen/assets.gen.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.tcbot.path,
                height: 100,
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                    text: MyStrings.welcome, style: textTheme.headlineLarge),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return textTheme.labelLarge;
                      }
                      return textTheme.titleMedium;
                    },
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return  SolidColors.primaryColor;
                      }
                      return  SolidColors.seeMore;
                    },
                  ),
                ),
                child: Text(
                  MyStrings.letsGo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
