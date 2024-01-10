import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class JobtypeItemWidget extends StatelessWidget {
  const JobtypeItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 20,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      width: 156,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2),
          CustomIconButton(
            height: 64,
            width: 64,
            padding: EdgeInsets.all(16),
            decoration: IconButtonStyleHelper.fillPrimary,
            child: CustomImageView(
              imagePath: ImageConstant.imgWork,
            ),
          ),
          SizedBox(height: 29),
          Text(
            "Find a job",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 9),
          SizedBox(
            width: 120,
            child: Text(
              "It’s easy to find your dream jobs here with us.",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.labelLargeGray500_1.copyWith(
                height: 1.67,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
