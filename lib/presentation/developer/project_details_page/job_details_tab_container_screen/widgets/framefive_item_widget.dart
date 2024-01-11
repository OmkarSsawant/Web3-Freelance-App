import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';

// ignore: must_be_immutable
class FramefiveItemWidget extends StatelessWidget {
  final String s;
  const FramefiveItemWidget(this.s, {Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 6,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        s,
        style: TextStyle(
          color: appTheme.blueGray400,
          fontSize: 12,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w400,
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
