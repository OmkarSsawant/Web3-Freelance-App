import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class JobdetailstabcontainerItemWidget extends StatelessWidget {
  final String s, v;
  final String? image;
  final Icon? icon;
  JobdetailstabcontainerItemWidget(
      {Key? key, required this.s, required this.v,  this.image,this.icon})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 67,
      child: Column(
        children: [
          if(image!=null)
          CustomIconButton(
            height: 48,
            width: 48,
            padding: EdgeInsets.all(12),
            decoration: IconButtonStyleHelper.fillGrayTL16
                .copyWith(color: Colors.grey[300]),
            child: CustomImageView(
              imagePath: image,
            ),
          ),
          if(icon!=null)
            icon!,
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
