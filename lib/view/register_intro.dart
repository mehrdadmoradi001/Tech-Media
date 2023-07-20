import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_media/component/my_strings.dart';
import 'package:tech_media/gen/assets.gen.dart';
import 'package:tech_media/view/my_category.dart';
import 'package:validators/validators.dart';

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
                onPressed: () {
                  _buildShowModalBottomSheet(context, size, textTheme);
                },
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

  Future<dynamic> _buildShowModalBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.insertYourEmail,
                    style: textTheme.headlineMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextField(
                      onChanged: (value) {
                        print('${value}is Email : ${isEmail(value)}');
                      },
                      style: textTheme.labelSmall,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: MyStrings.tecEmail,
                        hintStyle: textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _buildActivateCodeBottomSheet(context, size, textTheme);
                      },
                      child: Text(MyStrings.continuation))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _buildActivateCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.activateCode,
                    style: textTheme.headlineMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextField(
                      onChanged: (value) {
                        print('${value}is Email : ${isEmail(value)}');
                      },
                      style: textTheme.labelSmall,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '******',
                        hintStyle: textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const MyCategory(),
                          ),
                        );
                      },
                      child: Text(MyStrings.continuation))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
