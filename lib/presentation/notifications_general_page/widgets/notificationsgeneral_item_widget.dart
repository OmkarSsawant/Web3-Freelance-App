import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class NotificationsgeneralItemWidget extends StatelessWidget {
  const NotificationsgeneralItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 13),
              child: CustomIconButton(
                height: 32,
                width: 32,
                padding: EdgeInsets.all(4),
                decoration: IconButtonStyleHelper.fillGrayTL16,
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
                    "Junior UI Designer ",
                    style: CustomTextStyles.titleSmallBold,
                  ),
                  SizedBox(height: 7),
                  Text(
                    "Shopee Sg",
                    style: theme.textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                top: 4,
                bottom: 24,
              ),
              child: Text(
                "32 Min ago",
                style: CustomTextStyles.labelLargeGray500_1,
              ),
            ),
          ],
        ),
        SizedBox(height: 11),
        Container(
          width: 233,
          margin: EdgeInsets.only(
            left: 44,
            right: 50,
          ),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.labelLargePrimary_1.copyWith(
              height: 1.67,
            ),
          ),
        ),
      ],
    );
  }
}
