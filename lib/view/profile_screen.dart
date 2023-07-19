import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_media/component/my_colors.dart';
import 'package:tech_media/component/my_strings.dart';
import 'package:tech_media/gen/assets.gen.dart';

import '../gen/assets.gen.dart';

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
    return  SingleChildScrollView(
      physics:  const BouncingScrollPhysics(),
      child: Column(
        children: [

          const SizedBox(height: 12),
          Row(
            children: [
              ImageIcon(Assets.icons.bluePen.provider(),color: SolidColors.seeMore,),
              const SizedBox(width: 8),
              Text(MyStrings.imageProfileEdit,style: textTheme.headlineMedium,),
            ],
          )
        ],
      ),
    );
  }
}
