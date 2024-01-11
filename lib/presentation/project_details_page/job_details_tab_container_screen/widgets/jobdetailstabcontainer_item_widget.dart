import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class JobdetailstabcontainerItemWidget extends StatelessWidget {
  final String s, v, image;
  JobdetailstabcontainerItemWidget(
      {Key? key, required this.s, required this.v, required this.image})
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
              imagePath: image,
            ),
          ),
          SizedBox(height: 9),
          Text(
            s,
            style: CustomTextStyles.labelLargeGray500_1,
          ),
          SizedBox(height: 9),
          Text(
            v,
            style: CustomTextStyles.titleSmallSemiBold,
          ),
        ],
      ),
    );
  }
}
