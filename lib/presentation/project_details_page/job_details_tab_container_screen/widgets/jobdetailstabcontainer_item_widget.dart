import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class JobdetailstabcontainerItemWidget extends StatelessWidget {
  const JobdetailstabcontainerItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 67,
      child: Column(
        children: [
          CustomIconButton(
            height: 48,
            width: 48,
            padding: EdgeInsets.all(12),
            decoration: IconButtonStyleHelper.fillGreen,
            child: CustomImageView(
              imagePath: ImageConstant.imgWallet,
            ),
          ),
          SizedBox(height: 9),
          Text(
            "Salary",
            style: CustomTextStyles.labelLargeGray500_1,
          ),
          SizedBox(height: 9),
          Text(
            "6k - 11k",
            style: CustomTextStyles.titleSmallSemiBold,
          ),
        ],
      ),
    );
  }
}
