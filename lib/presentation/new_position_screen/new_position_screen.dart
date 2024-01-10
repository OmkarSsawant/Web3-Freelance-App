import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';
import 'package:web3_freelancer/widgets/custom_drop_down.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';
import 'package:web3_freelancer/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class NewPositionScreen extends StatelessWidget {
  NewPositionScreen({Key? key}) : super(key: key);

  TextEditingController frameOneController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  TextEditingController nameController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  TextEditingController frameOneController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 36),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24, right: 24, bottom: 5),
                              child: Column(children: [
                                _buildINPUTFIELD(context),
                                SizedBox(height: 20),
                                _buildINPUTFIELD1(context),
                                SizedBox(height: 20),
                                _buildINPUTFIELD2(context),
                                SizedBox(height: 18),
                                _buildINPUTFIELD3(context),
                                SizedBox(height: 18),
                                _buildINPUTFIELD4(context),
                                SizedBox(height: 18),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("End Date",
                                        style: theme.textTheme.titleSmall)),
                                SizedBox(height: 9),
                                _buildFrameOne(context,
                                    smallLabelRegular: "Select Date"),
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
        title: AppbarTitle(text: "Add New Position"));
  }

  /// Section Widget
  Widget _buildINPUTFIELD(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Title", style: theme.textTheme.titleSmall),
      SizedBox(height: 9),
      CustomTextFormField(
          controller: frameOneController, hintText: "Ex: UI Designer")
    ]);
  }

  /// Section Widget
  Widget _buildINPUTFIELD1(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Employment Type", style: theme.textTheme.titleSmall),
          SizedBox(height: 7),
          CustomDropDown(
              icon: Container(
                  margin: EdgeInsets.fromLTRB(30, 14, 19, 13),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCheckmarkGray900,
                      height: 24,
                      width: 24)),
              hintText: "Please Select",
              items: dropdownItemList,
              onChanged: (value) {})
        ]));
  }

  /// Section Widget
  Widget _buildINPUTFIELD2(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Company Name", style: theme.textTheme.titleSmall),
      SizedBox(height: 7),
      CustomTextFormField(controller: nameController, hintText: "Ex: Shopee")
    ]);
  }

  /// Section Widget
  Widget _buildINPUTFIELD3(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Location ", style: theme.textTheme.titleSmall),
      SizedBox(height: 9),
      CustomTextFormField(
          controller: locationController, hintText: "Ex: Singapore, Singapore")
    ]);
  }

  /// Section Widget
  Widget _buildINPUTFIELD4(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Start Date", style: theme.textTheme.titleSmall),
      SizedBox(height: 9),
      _buildFrameOne(context, smallLabelRegular: "Select Date")
    ]);
  }

  /// Section Widget
  Widget _buildINPUTFIELD5(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Job Role Description", style: theme.textTheme.titleSmall),
      SizedBox(height: 7),
      CustomTextFormField(
          controller: frameOneController1,
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
  Widget _buildFrameOne(
    BuildContext context, {
    required String smallLabelRegular,
  }) {
    return Container(
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
        ]));
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
