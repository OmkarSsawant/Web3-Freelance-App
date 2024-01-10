import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_trailing_image.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';
import 'package:web3_freelancer/widgets/custom_outlined_button.dart';
import 'package:web3_freelancer/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignUpCreateAcountScreen extends StatelessWidget {
  SignUpCreateAcountScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 31),
                            child: Column(children: [
                              Text("Create account",
                                  style: theme.textTheme.headlineSmall),
                              SizedBox(height: 11),
                              Text("Lorem ipsum dolor sit amet",
                                  style:
                                      CustomTextStyles.titleMediumBluegray400),
                              SizedBox(height: 28),
                              CustomOutlinedButton(
                                  text: "Continue with Google",
                                  leftIcon: Container(
                                      margin: EdgeInsets.only(right: 12),
                                      child: CustomImageView(
                                          imagePath:
                                              ImageConstant.imgGooglesymbol1,
                                          height: 23,
                                          width: 24))),
                              SizedBox(height: 16),
                              CustomOutlinedButton(
                                  text: "Continue with Apple",
                                  leftIcon: Container(
                                      margin: EdgeInsets.only(right: 12),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgIconApple,
                                          height: 24,
                                          width: 24))),
                              SizedBox(height: 26),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 33),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: SizedBox(
                                                width: 62,
                                                child: Divider(
                                                    color:
                                                        appTheme.blueGray100))),
                                        Padding(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Text("Or continue with",
                                                style: CustomTextStyles
                                                    .titleSmallGray500SemiBold_1)),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: SizedBox(
                                                width: 74,
                                                child: Divider(indent: 12)))
                                      ])),
                              SizedBox(height: 28),
                              _buildINPUTFIELD(context),
                              SizedBox(height: 40),
                              CustomElevatedButton(
                                  text: "Continue with Email",
                                  onPressed: () {
                                    onTapContinueWithEmail(context);
                                  }),
                              SizedBox(height: 28),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Already have an account?",
                                            style: CustomTextStyles
                                                .titleMediumGray500),
                                        GestureDetector(
                                            onTap: () {
                                              onTapTxtLargeLabelMedium(context);
                                            },
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 3),
                                                child: Text(" Login",
                                                    style: theme.textTheme
                                                        .titleMedium)))
                                      ])),
                              SizedBox(height: 84),
                              Container(
                                  width: 245,
                                  margin: EdgeInsets.symmetric(horizontal: 40),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "By signing up you agree to our ",
                                            style: CustomTextStyles
                                                .titleSmallGray500SemiBold),
                                        TextSpan(
                                            text: "Terms",
                                            style: CustomTextStyles
                                                .titleSmallBlack900),
                                        TextSpan(
                                            text: " and ",
                                            style: CustomTextStyles
                                                .titleSmallGray500SemiBold),
                                        TextSpan(
                                            text: "Conditions of Use",
                                            style: CustomTextStyles
                                                .titleSmallBlack900)
                                      ]),
                                      textAlign: TextAlign.center)),
                              SizedBox(height: 8)
                            ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 48,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgComponent1,
            margin: EdgeInsets.only(left: 24, top: 13, bottom: 13),
            onTap: () {
              onTapImage(context);
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgComponent3,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 13))
        ]);
  }

  /// Section Widget
  Widget _buildINPUTFIELD(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Email", style: theme.textTheme.titleSmall),
          SizedBox(height: 9),
          CustomTextFormField(
              controller: emailController,
              hintText: "Enter your email address",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.emailAddress)
        ]));
  }

  /// Navigates back to the previous screen.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the signUpCompleteAccountScreen when the action is triggered.
  onTapContinueWithEmail(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpCompleteAccountScreen);
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtLargeLabelMedium(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
