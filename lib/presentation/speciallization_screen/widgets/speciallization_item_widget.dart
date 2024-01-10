import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';

// ignore: must_be_immutable
class SpeciallizationItemWidget extends StatelessWidget {
  const SpeciallizationItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 9,
      ),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgCheckmark,
            height: 24,
            width: 24,
            margin: EdgeInsets.symmetric(vertical: 1),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              top: 5,
            ),
            child: Text(
              "Design & Creative",
              style: theme.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
