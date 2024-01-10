import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_trailing_image.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';
import 'package:web3_freelancer/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignUpCompleteAccountScreen extends StatelessWidget {
  SignUpCompleteAccountScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
                                horizontal: 24, vertical: 34),
                            child: Column(children: [
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 15),
                                      child: Text("Complete your account",
                                          style:
                                              theme.textTheme.headlineSmall))),
                              SizedBox(height: 9),
                              Text("Lorem ipsum dolor sit amet",
                                  style:
                                      CustomTextStyles.titleSmallBluegray400),
                              SizedBox(height: 33),
                              _buildINPUTFIELD(context),
                              SizedBox(height: 18),
                              _buildINPUTFIELD1(context),
                              SizedBox(height: 18),
                              _buildINPUTFIELD2(context),
                              SizedBox(height: 16),
                              _buildDropdown(context),
                              SizedBox(height: 40),
                              CustomElevatedButton(text: "Continue with Email"),
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
                              SizedBox(height: 19),
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
                              SizedBox(height: 5)
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
              controller: emailController, hintText: "Enter your first name")
        ]));
  }

  /// Section Widget
  Widget _buildINPUTFIELD1(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Last Name", style: theme.textTheme.titleSmall),
          SizedBox(height: 9),
          CustomTextFormField(
              controller: lastNameController, hintText: "Enter your last name")
        ]));
  }

  /// Section Widget
  Widget _buildINPUTFIELD2(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Password", style: theme.textTheme.titleSmall),
          SizedBox(height: 9),
          CustomTextFormField(
              controller: passwordController,
              hintText: "Create a password",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(30, 14, 16, 14),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgHide, height: 24, width: 24)),
              suffixConstraints: BoxConstraints(maxHeight: 52),
              obscureText: true,
              contentPadding: EdgeInsets.only(left: 16, top: 15, bottom: 15))
        ]));
  }

  /// Section Widget
  Widget _buildDropdown(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 11),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder24),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text("Select a country",
                  style: CustomTextStyles.titleMediumMedium_1)),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 24,
              width: 24,
              margin: EdgeInsets.only(top: 1))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtLargeLabelMedium(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
