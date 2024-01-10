import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class ApplyJobPopupDialog extends StatelessWidget {
  const ApplyJobPopupDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 302,
      padding: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 28,
      ),
      decoration: AppDecoration.white.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4),
          CustomImageView(
            imagePath: ImageConstant.imgThumbsUp11,
            height: 101,
            width: 101,
          ),
          SizedBox(height: 25),
          Text(
            "Success",
            style: CustomTextStyles.titleMediumBold,
          ),
          SizedBox(height: 9),
          Text(
            "Your Application is succesfully sent",
            style: CustomTextStyles.titleSmallBluegray400SemiBold,
          ),
          SizedBox(height: 19),
          CustomElevatedButton(
            height: 54,
            width: 127,
            text: "Continue",
            buttonTextStyle:
                CustomTextStyles.titleSmallOnPrimaryContainerSemiBold,
          ),
        ],
      ),
    );
  }
}
