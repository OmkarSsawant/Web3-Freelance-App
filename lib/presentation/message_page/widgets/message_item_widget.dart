import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';

// ignore: must_be_immutable
class MessageItemWidget extends StatelessWidget {
  const MessageItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgAvatar56x56,
          height: 56,
          width: 56,
          radius: BorderRadius.circular(
            28,
          ),
          margin: EdgeInsets.only(bottom: 17),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 12,
            top: 5,
            bottom: 17,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chance Septimus",
                style: CustomTextStyles.titleMediumBold,
              ),
              SizedBox(height: 7),
              Text(
                "Lorem ipsum dolor sit amet...",
                style: CustomTextStyles.titleSmallBluegray400,
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(
            top: 7,
            bottom: 49,
          ),
          child: Text(
            "10:20",
            style: CustomTextStyles.labelLargeSemiBold,
          ),
        ),
      ],
    );
  }
}
