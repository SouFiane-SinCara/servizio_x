import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:servizio_x/core/helpers/app_extensions.dart';

import '../../../../core/helpers/size_boxes.dart';
import '../../../../core/theme/text_styles.dart';

class OnboardingContainerWidget extends StatefulWidget {
  final String imageName;
  final String primaryText;
  final String secondaryText;
  const OnboardingContainerWidget({
    super.key,
    required this.imageName,
    required this.primaryText,
    required this.secondaryText,
  });

  @override
  State<OnboardingContainerWidget> createState() =>
      _OnboardingContainerWidgetState();
}

class _OnboardingContainerWidgetState extends State<OnboardingContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          //? Onboarding image.
          Image.asset(
            'lib/core/assets/images/${widget.imageName}.png',
            height: 200.h(context),
          ),
          //? the primary text
          Container(
            margin: EdgeInsets.symmetric(horizontal: 80.w(context)),
            child: AutoSizeText(
              widget.primaryText,
              style: TextStyles.darkGreenBold.copyWith(fontSize: 24),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          heightSize(20, context),
          //? the secondary text
          Container(
            margin:  EdgeInsets.symmetric(horizontal: 80.w(context)),
            child: AutoSizeText(
              widget.secondaryText,
              textAlign: TextAlign.center,
              style: TextStyles.greyW400.copyWith(fontSize: 20),
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
