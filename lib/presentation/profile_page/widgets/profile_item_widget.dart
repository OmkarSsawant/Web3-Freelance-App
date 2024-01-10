import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 295,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLogoDeepOrange700,
            height: 32,
            width: 32,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
              left: 8,
              top: 8,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                CustomIconButton(
                  height: 48,
                  width: 48,
                  padding: EdgeInsets.all(8),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgBag,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12,
                    top: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Internship UI/UX Designer",
                        style: CustomTextStyles.titleSmallSemiBold,
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 1),
                            child: Text(
                              "Shopee Sg",
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 3,
                              top: 1,
                            ),
                            child: Text(
                              "•",
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Text(
                              "2019",
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
