import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';

// ignore: must_be_immutable
class FortysevenItemWidget extends StatelessWidget {
  const FortysevenItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Design & Creative",
        style: TextStyle(
          color: theme.colorScheme.primary,
          fontSize: 12,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
        ),
      ),
      selected: false,
      backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      selectedColor: Colors.transparent,
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
