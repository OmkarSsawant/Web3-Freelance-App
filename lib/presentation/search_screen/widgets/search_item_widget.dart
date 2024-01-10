import 'fulltime5_item_widget.dart';
import 'package:flutter/material.dart' hide SearchController;
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class SearchItemWidget extends StatelessWidget {
  SearchItemWidget({
    Key? key,
    this.onTapSettings,
  }) : super(
          key: key,
        );

  VoidCallback? onTapSettings;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapSettings!.call();
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: AppDecoration.outlineGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 1,
                bottom: 67,
              ),
              child: CustomIconButton(
                height: 48,
                width: 48,
                padding: EdgeInsets.all(7),
                child: CustomImageView(
                  imagePath: ImageConstant.imgSettingsRed800,
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
                    style: CustomTextStyles.titleMediumBold_1,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Motorola",
                    style: CustomTextStyles.labelLargeGray500,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "560 - 12.000/Month",
                    style: theme.textTheme.labelLarge,
                  ),
                  SizedBox(height: 13),
                  Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: List<Widget>.generate(
                        2, (index) => Fulltime5ItemWidget()),
                  ),
                ],
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgComponent3,
              height: 24,
              width: 24,
              margin: EdgeInsets.only(
                left: 30,
                bottom: 92,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
