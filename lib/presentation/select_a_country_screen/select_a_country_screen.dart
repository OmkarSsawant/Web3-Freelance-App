import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_radio_button.dart';

class SelectACountryScreen extends StatelessWidget {
  SelectACountryScreen({Key? key})
      : super(
          key: key,
        );

  String radioGroup = "";

  List<String> radioList = [
    "lbl_afghanistan",
    "lbl_albania",
    "lbl_algeria",
    "lbl_andorra",
    "lbl_angola",
    "msg_antigua_and_barbuda",
    "lbl_argentina",
    "lbl_argentina",
    "lbl_armenia",
    "lbl_australia",
    "lbl_austria",
    "lbl_azerbaijan",
    "lbl_azerbaijan"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _buildSelectaCountry(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildSelectaCountry(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 24,
            right: 217,
          ),
          child: CustomRadioButton(
            text: "Afghanistan",
            value: radioList[2],
            groupValue: radioGroup,
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 22,
            right: 253,
          ),
          child: CustomRadioButton(
            text: "Albania",
            value: radioList[3],
            groupValue: radioGroup,
            padding: EdgeInsets.symmetric(vertical: 1),
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 24,
            right: 256,
          ),
          child: CustomRadioButton(
            text: "Algeria\r",
            value: radioList[4],
            groupValue: radioGroup,
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 22,
            right: 248,
          ),
          child: CustomRadioButton(
            text: "Andorra",
            value: radioList[5],
            groupValue: radioGroup,
            padding: EdgeInsets.symmetric(vertical: 1),
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 24,
            right: 256,
          ),
          child: CustomRadioButton(
            text: "Angola",
            value: radioList[6],
            groupValue: radioGroup,
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 22,
            right: 148,
          ),
          child: CustomRadioButton(
            text: "Antigua and Barbuda\r",
            value: radioList[7],
            groupValue: radioGroup,
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 22,
            right: 234,
          ),
          child: CustomRadioButton(
            text: "Argentina",
            value: radioList[8],
            groupValue: radioGroup,
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 22,
            right: 234,
          ),
          child: CustomRadioButton(
            text: "Argentina",
            value: radioList[9],
            groupValue: radioGroup,
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 22,
            right: 246,
          ),
          child: CustomRadioButton(
            text: "Armenia",
            value: radioList[10],
            groupValue: radioGroup,
            padding: EdgeInsets.symmetric(vertical: 1),
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 24,
            right: 243,
          ),
          child: CustomRadioButton(
            text: "Australia",
            value: radioList[11],
            groupValue: radioGroup,
            padding: EdgeInsets.symmetric(vertical: 1),
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 24,
            right: 256,
          ),
          child: CustomRadioButton(
            text: "Austria",
            value: radioList[12],
            groupValue: radioGroup,
            padding: EdgeInsets.symmetric(vertical: 1),
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 24,
            right: 229,
          ),
          child: CustomRadioButton(
            text: "Azerbaijan",
            value: radioList[13],
            groupValue: radioGroup,
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(24, 22, 229, 5),
          child: CustomRadioButton(
            text: "Azerbaijan",
            value: radioList[14],
            groupValue: radioGroup,
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
      ],
    );
  }
}
