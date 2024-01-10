import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_trailing_image.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';
import 'package:web3_freelancer/widgets/custom_text_form_field.dart';
import 'package:web3_freelancer/presentation/apply_job_popup_dialog/apply_job_popup_dialog.dart';

// ignore_for_file: must_be_immutable
class ApplyJobScreen extends StatelessWidget {
  ApplyJobScreen({Key? key}) : super(key: key);

  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController frameOneController = TextEditingController();

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
                              _buildINPUTFIELD(context),
                              SizedBox(height: 26),
                              _buildINPUTFIELD1(context),
                              SizedBox(height: 28),
                              _buildCVFields(context),
                              SizedBox(height: 28),
                              _buildINPUTFIELD2(context),
                              SizedBox(height: 5)
                            ]))))),
            bottomNavigationBar: _buildContinue(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 51,
        leadingWidth: 48,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgComponent1,
            margin: EdgeInsets.only(left: 24, top: 13, bottom: 14),
            onTap: () {
              onTapImage(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Apply Job"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgComponent3,
              margin: EdgeInsets.fromLTRB(16, 13, 16, 14))
        ]);
  }

  /// Section Widget
  Widget _buildINPUTFIELD(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Full Name", style: theme.textTheme.titleSmall),
          SizedBox(height: 9),
          CustomTextFormField(
              controller: fullNameController, hintText: "Brooklyn Simmons")
        ]));
  }

  /// Section Widget
  Widget _buildINPUTFIELD1(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Email Address", style: theme.textTheme.titleSmall),
          SizedBox(height: 9),
          CustomTextFormField(
              controller: emailController,
              hintText: "xyz@gmail.com",
              textInputType: TextInputType.emailAddress)
        ]));
  }

  /// Section Widget
  Widget _buildCVFields(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Upload CV", style: theme.textTheme.titleSmall),
      SizedBox(height: 7),
      DottedBorder(
          color: appTheme.gray300,
          padding: EdgeInsets.only(left: 1, top: 1, right: 1, bottom: 1),
          strokeWidth: 1,
          radius: Radius.circular(24),
          borderType: BorderType.RRect,
          dashPattern: [6, 6],
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 124, vertical: 39),
              decoration: AppDecoration.outlineGray300
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder24),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgCloudUpload1,
                    height: 40,
                    width: 40),
                SizedBox(height: 8),
                Text("Upload File", style: CustomTextStyles.titleSmallSemiBold)
              ])))
    ]);
  }

  /// Section Widget
  Widget _buildINPUTFIELD2(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Website, Blog, or Portfolio",
              style: theme.textTheme.titleSmall),
          SizedBox(height: 7),
          CustomTextFormField(
              controller: frameOneController,
              hintText: "http://...",
              textInputAction: TextInputAction.done)
        ]));
  }

  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return CustomElevatedButton(
        text: "Continue",
        margin: EdgeInsets.only(left: 24, right: 24, bottom: 40),
        onPressed: () {
          onTapContinue(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

  /// Displays a dialog with the [ApplyJobPopupDialog] content.
  onTapContinue(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: ApplyJobPopupDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
