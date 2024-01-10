import 'package:web3_freelancer/utils.dart';

import 'fulltime1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ProjectRecommendationTileWidget extends StatelessWidget {
  const ProjectRecommendationTileWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 273,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: AppDecoration.fillPrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 96),
                child: CustomIconButton(
                  height: 48,
                  width: 48,
                  padding: EdgeInsets.all(8),
                  decoration: IconButtonStyleHelper.fillOnPrimaryContainer,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgBag,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 12,
                  top: 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Senior UI/UX Designer",
                      style: CustomTextStyles.titleSmallOnPrimaryContainerBold,
                    ),
                    SizedBox(height: 7),
                    Opacity(
                      opacity: 0.8,
                      child: Text(
                        "Shopee",
                        style: CustomTextStyles
                            .labelLargeOnPrimaryContainerSemiBold,
                      ),
                    ),
                    SizedBox(height: 11),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        "Jakarta, Indonesia (Remote)",
                        style: CustomTextStyles.labelLargeOnPrimaryContainer_1,
                      ),
                    ),
                    SizedBox(height: 9),
                    Text(
                      "1100 - 12.000/Month",
                      style: CustomTextStyles.labelLargeOnPrimaryContainer_3,
                    ),
                    SizedBox(height: 17),
                    FilledButton.icon(
                        label: const Text("Bid"),
                        onPressed: () {},
                        icon: const Icon(Icons.money_outlined)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
