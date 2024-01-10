import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';
import 'package:web3_freelancer/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class NotificationsmyproposalsItemWidget extends StatelessWidget {
  const NotificationsmyproposalsItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomIconButton(
              height: 48,
              width: 48,
              padding: EdgeInsets.all(7),
              child: CustomImageView(
                imagePath: ImageConstant.imgGroupRed800,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12,
                top: 4,
                bottom: 3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Senior UI/UX Designer",
                    style: CustomTextStyles.titleSmallBold,
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Shell",
                    style: CustomTextStyles.labelLargeGray500,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 14),
        CustomElevatedButton(
          height: 28,
          width: 81,
          text: "Opened",
          margin: EdgeInsets.only(left: 60),
          buttonStyle: CustomButtonStyles.fillGreen,
          buttonTextStyle: CustomTextStyles.bodySmallGreen600,
        ),
      ],
    );
  }
}
