import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 331,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 39),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3),
              SizedBox(
                  width: 279,
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "I agree to the ",
                            style: CustomTextStyles.titleMediumGray500_1),
                        TextSpan(
                            text: "Terms of Service",
                            style: theme.textTheme.titleMedium),
                        TextSpan(
                            text: " and ",
                            style: CustomTextStyles.titleMediumGray500_1),
                        TextSpan(
                            text: "Conditions of Use",
                            style: theme.textTheme.titleMedium),
                        TextSpan(
                            text:
                                " including consent to electronic communications and I affirm that the information provided is my own.",
                            style: CustomTextStyles.titleMediumGray500_1)
                      ]),
                      textAlign: TextAlign.center)),
              SizedBox(height: 17),
              CustomElevatedButton(
                  height: 54,
                  width: 181,
                  text: "Agree and continue",
                  buttonTextStyle:
                      CustomTextStyles.titleSmallOnPrimaryContainerSemiBold,
                  onPressed: () {
                    onTapAgreeAndContinue(context);
                  }),
              SizedBox(height: 24),
              Text("Disgree", style: CustomTextStyles.titleSmallOnPrimary)
            ]));
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapAgreeAndContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeContainerScreen);
  }
}
