import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';

class EnterOtpPage extends StatefulWidget {
  const EnterOtpPage({Key? key}) : super(key: key);

  @override
  EnterOtpPageState createState() => EnterOtpPageState();
}

class EnterOtpPageState extends State<EnterOtpPage>
    with AutomaticKeepAliveClientMixin<EnterOtpPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.background,
                child: Column(children: [
                  SizedBox(height: 40),
                  _buildContinue(context)
                ]))));
  }

  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          CustomElevatedButton(
              text: "Continue",
              onPressed: () {
                onTapContinue(context);
              }),
          SizedBox(height: 26),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Didn’t receive code?",
                    style: CustomTextStyles.titleMediumGray500),
                Text("Resend Code", style: theme.textTheme.titleMedium)
              ]))
        ]));
  }

  /// Navigates to the jobTypeScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.jobTypeScreen);
  }
}
