import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';
import 'package:web3_freelancer/widgets/custom_drop_down.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';
import 'package:web3_freelancer/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AddNewEducationScreen extends StatelessWidget {
  AddNewEducationScreen({Key? key}) : super(key: key);

  TextEditingController frameOneController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  TextEditingController frameOneController1 = TextEditingController();

  TextEditingController frameOneController2 = TextEditingController();

  TextEditingController frameOneController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 32),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24, right: 24, bottom: 5),
                              child: Column(children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("School",
                                        style: theme.textTheme.titleSmall)),
                                SizedBox(height: 9),
                                CustomTextFormField(
                                    controller: frameOneController,
                                    hintText: "Ex: Harvard University"),
                                SizedBox(height: 20),
                                _buildINPUTFIELD(context),
                                SizedBox(height: 20),
                                _buildINPUTFIELD1(context),
                                SizedBox(height: 18),
                                _buildInputfield(context,
                                    mediumLabelSemi: "Start Date",
                                    smallLabelRegular: "Select Date"),
                                SizedBox(height: 18),
                                _buildInputfield(context,
                                    mediumLabelSemi: "End Date",
                                    smallLabelRegular: "Select Date"),
                                SizedBox(height: 18),
                                _buildINPUTFIELD4(context),
                                SizedBox(height: 20),
                                _buildINPUTFIELD5(context)
                              ]))))
                ])),
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
              onTapArrowBack(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Add New Education"));
  }

  /// Section Widget
  Widget _buildINPUTFIELD(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Degree", style: theme.textTheme.titleSmall),
      SizedBox(height: 7),
      CustomDropDown(
          hintText: "Ex: Bachelor",
          items: dropdownItemList,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          onChanged: (value) {})
    ]);
  }

  /// Section Widget
  Widget _buildINPUTFIELD1(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Field of study", style: theme.textTheme.titleSmall),
      SizedBox(height: 7),
      CustomTextFormField(
          controller: frameOneController1, hintText: "Ex: Business")
    ]);
  }

  /// Section Widget
  Widget _buildINPUTFIELD4(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Grade", style: theme.textTheme.titleSmall),
      SizedBox(height: 9),
      CustomTextFormField(
          controller: frameOneController2, hintText: "Ex: Business")
    ]);
  }

  /// Section Widget
  Widget _buildINPUTFIELD5(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Description", style: theme.textTheme.titleSmall),
      SizedBox(height: 7),
      CustomTextFormField(
          controller: frameOneController3,
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
        margin: EdgeInsets.only(left: 24, right: 24, bottom: 37),
        onPressed: () {
          onTapSaveChanges(context);
        });
  }

  /// Common widget
  Widget _buildInputfield(
    BuildContext context, {
    required String mediumLabelSemi,
    required String smallLabelRegular,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(mediumLabelSemi,
          style: theme.textTheme.titleSmall!
              .copyWith(color: theme.colorScheme.primary)),
      SizedBox(height: 9),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
          decoration: AppDecoration.outlineGray
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder24),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.only(top: 2),
                child: Text(smallLabelRegular,
                    style: CustomTextStyles.titleMediumBluegray400
                        .copyWith(color: appTheme.blueGray400))),
            CustomImageView(
                imagePath: ImageConstant.imgCalendar, height: 24, width: 24)
          ]))
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the experienceSettingScreen when the action is triggered.
  onTapSaveChanges(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.experienceSettingScreen);
  }
}
