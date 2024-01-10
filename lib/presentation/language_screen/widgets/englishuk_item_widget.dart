import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';

// ignore: must_be_immutable
class EnglishukItemWidget extends StatelessWidget {
  const EnglishukItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            "English (UK)",
            style: CustomTextStyles.titleMediumGray900,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgCheckmarkGreenA700,
          height: 24,
          width: 24,
          margin: EdgeInsets.only(bottom: 2),
        ),
      ],
    );
  }
}
