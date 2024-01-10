import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_trailing_image.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';
import 'package:web3_freelancer/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({Key? key}) : super(key: key);

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      SizedBox(height: 32),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 24, right: 24, bottom: 5),
                                  child: Column(children: [
                                    _buildINPUTFIELD(context),
                                    SizedBox(height: 18),
                                    _buildINPUTFIELD1(context),
                                    SizedBox(height: 18),
                                    _buildINPUTFIELD2(context),
                                    SizedBox(height: 18),
                                    _buildINPUTFIELD3(context),
                                    SizedBox(height: 18),
                                    _buildINPUTFIELD4(context)
                                  ]))))
                    ]))),
            bottomNavigationBar: _buildSaveChanges(context)));
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
        centerTitle: true,
        title: AppbarTitle(text: "Personal Info"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgEditSquare,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 13))
        ]);
  }

  /// Section Widget
  Widget _buildINPUTFIELD(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("First Name", style: theme.textTheme.titleSmall),
      SizedBox(height: 9),
      CustomTextFormField(controller: firstNameController, hintText: "Gustavo")
    ]);
  }

  /// Section Widget
  Widget _buildINPUTFIELD1(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Last Name", style: theme.textTheme.titleSmall),
      SizedBox(height: 9),
      CustomTextFormField(controller: lastNameController, hintText: "Lipshutz")
    ]);
  }

  /// Section Widget
  Widget _buildINPUTFIELD2(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Email", style: theme.textTheme.titleSmall),
      SizedBox(height: 9),
      CustomTextFormField(
          controller: emailController,
          hintText: "xyz@gmail.com",
          textInputType: TextInputType.emailAddress)
    ]);
  }

  /// Section Widget
  Widget _buildINPUTFIELD3(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Phone ", style: theme.textTheme.titleSmall),
      SizedBox(height: 9),
      CustomTextFormField(
          controller: phoneController, hintText: "+1 1234567890")
    ]);
  }

  /// Section Widget
  Widget _buildINPUTFIELD4(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Location", style: theme.textTheme.titleSmall),
      SizedBox(height: 9),
      CustomTextFormField(
          controller: locationController,
          hintText: "Lorem ipsun",
          textInputAction: TextInputAction.done,
          maxLines: 6,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20))
    ]);
  }

  /// Section Widget
  Widget _buildSaveChanges(BuildContext context) {
    return CustomElevatedButton(
        text: "Save Changes",
        margin: EdgeInsets.only(left: 24, right: 24, bottom: 44),
        buttonStyle: CustomButtonStyles.fillGrayTL24,
        buttonTextStyle: CustomTextStyles.titleMediumGray50001);
  }

  /// Navigates back to the previous screen.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }
}
