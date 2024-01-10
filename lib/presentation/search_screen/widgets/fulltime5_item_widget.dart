import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';

// ignore: must_be_immutable
class Fulltime5ItemWidget extends StatelessWidget {
  const Fulltime5ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Fulltime",
        style: TextStyle(
          color: appTheme.blueGray400,
          fontSize: 12,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w500,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.gray100,
      selectedColor: appTheme.gray100,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
