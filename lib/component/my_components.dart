import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_media/component/my_colors.dart';
import 'package:tech_media/gen/assets.gen.dart';
import 'package:tech_media/models/fake_data.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class MainTagsHashtags extends StatelessWidget {
  MainTagsHashtags({
    super.key,
    required this.textTheme,
    required this.index,
    this.gradient,
    this.color,
    this.textStyle,
  });

  final TextTheme textTheme;
  var index;
  Gradient? gradient;
  Color? color;
  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
        color: color,
        gradient: gradient,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashtagicon.provider(),
              color: Colors.white,
              size: 14,
            ),
            const SizedBox(width: 8),
            Text(
              HashTagModelList[index].title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingSpinK extends StatelessWidget {
  const LoadingSpinK({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: SolidColors.primaryColor,
      size: 32.0,
    );
  }
}
