import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';

// ignore: must_be_immutable
class FiftyfiveItemWidget extends StatelessWidget {
  const FiftyfiveItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.only(
        top: 14,
        right: 16,
        bottom: 14,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Design & Creative",
        style: TextStyle(
          color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 12,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
        ),
      ),
      avatar: CustomImageView(
        imagePath: ImageConstant.imgCheckmarkOnprimarycontainer,
        height: 18,
        width: 18,
        margin: EdgeInsets.only(right: 5),
      ),
      selected: false,
      backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      selectedColor: appTheme.deepOrangeA200,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.gray300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(
          22,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
