import '../experience_setting_screen/widgets/experiencesetting_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';
import 'package:web3_freelancer/widgets/custom_icon_button.dart';

class ExperienceSettingScreen extends StatelessWidget {
  const ExperienceSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 28),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24, right: 24, bottom: 5),
                              child: Column(children: [
                                _buildExperience1(context),
                                SizedBox(height: 37),
                                CustomElevatedButton(
                                    text: "Add New Position",
                                    onPressed: () {
                                      onTapAddNewPosition(context);
                                    }),
                                SizedBox(height: 32),
                                _buildEducation2(context)
                              ]))))
                ])),
            bottomNavigationBar: _buildAddNewEducation(context)));
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
              onTapArrowBack(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Experience"));
  }

  /// Section Widget
  Widget _buildExperience1(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildEducation(context, education: "Experience",
                  onTapEditSquare: () {
                onTapEditSquare(context);
              }),
              SizedBox(height: 15),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 11.5),
                        child: SizedBox(
                            width: 295,
                            child: Divider(
                                height: 1,
                                thickness: 1,
                                color: appTheme.gray300)));
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ExperiencesettingItemWidget();
                  })
            ]));
  }

  /// Section Widget
  Widget _buildEducation2(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEducation(context, education: "Education"),
              SizedBox(height: 24),
              Padding(
                  padding: EdgeInsets.only(right: 83),
                  child: Row(children: [
                    CustomIconButton(
                        height: 48,
                        width: 48,
                        padding: EdgeInsets.all(8),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgFrame162724)),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(left: 12, top: 5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("University of Oxford",
                                      style:
                                          CustomTextStyles.titleSmallSemiBold),
                                  SizedBox(height: 6),
                                  Row(children: [
                                    Padding(
                                        padding: EdgeInsets.only(top: 1),
                                        child: Text("Computer Science",
                                            style: theme.textTheme.labelLarge)),
                                    Padding(
                                        padding:
                                            EdgeInsets.only(left: 4, top: 1),
                                        child: Text("•",
                                            style: theme.textTheme.labelLarge)),
                                    Padding(
                                        padding: EdgeInsets.only(left: 4),
                                        child: Text("2019",
                                            style: theme.textTheme.labelLarge))
                                  ])
                                ])))
                  ]))
            ]));
  }

  /// Section Widget
  Widget _buildAddNewEducation(BuildContext context) {
    return CustomElevatedButton(
        text: "Add New Education",
        margin: EdgeInsets.only(left: 24, right: 24, bottom: 55),
        onPressed: () {
          onTapAddNewEducation(context);
        });
  }

  /// Common widget
  Widget _buildEducation(
    BuildContext context, {
    required String education,
    Function? onTapEditSquare,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 2),
          child: Text(education,
              style: CustomTextStyles.titleMediumBold_1
                  .copyWith(color: theme.colorScheme.primary))),
      CustomImageView(
          imagePath: ImageConstant.imgEditSquarePrimary,
          height: 24,
          width: 24,
          onTap: () {
            onTapEditSquare!.call();
          })
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the newPositionScreen when the action is triggered.
  onTapEditSquare(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.newPositionScreen);
  }

  /// Navigates to the newPositionScreen when the action is triggered.
  onTapAddNewPosition(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.newPositionScreen);
  }

  /// Navigates to the addNewEducationScreen when the action is triggered.
  onTapAddNewEducation(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addNewEducationScreen);
  }
}
