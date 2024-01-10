import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';

// ignore: must_be_immutable
class MessageactionItemWidget extends StatelessWidget {
  MessageactionItemWidget({
    Key? key,
    this.onTapEstherHoward,
  }) : super(
          key: key,
        );

  VoidCallback? onTapEstherHoward;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapEstherHoward!.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 56,
            width: 56,
            margin: EdgeInsets.only(bottom: 17),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage56x56,
                  height: 56,
                  width: 56,
                  radius: BorderRadius.circular(
                    28,
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      color: appTheme.green600,
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      border: Border.all(
                        color:
                            theme.colorScheme.onPrimaryContainer.withOpacity(1),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12,
              top: 3,
              bottom: 17,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Esther Howard",
                  style: CustomTextStyles.titleMediumBold,
                ),
                SizedBox(height: 9),
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
              bottom: 17,
            ),
            child: Column(
              children: [
                Text(
                  "10:20",
                  style: CustomTextStyles.labelLargeSemiBold,
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 24,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    decoration: AppDecoration.fillPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder12,
                    ),
                    child: Text(
                      "2",
                      style: theme.textTheme.labelMedium,
                    ),
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
