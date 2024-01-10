import '../profile_page/widgets/fortyseven_item_widget.dart';
import '../profile_page/widgets/profile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_trailing_image.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';
import 'package:web3_freelancer/widgets/custom_icon_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 30),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Column(children: [
                          _buildBG(context),
                          SizedBox(height: 16),
                          Container(
                              width: 273,
                              margin: EdgeInsets.only(left: 51, right: 50),
                              child: Text(
                                  "UI/UX Designer, Web Design, Mobile App Design",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles.titleSmallBluegray400
                                      .copyWith(height: 1.57))),
                          SizedBox(height: 16),
                          _buildJobApplied(context),
                          SizedBox(height: 24),
                          Divider(color: appTheme.gray300),
                          SizedBox(height: 22),
                          _buildAboutMe(context),
                          SizedBox(height: 24),
                          _buildSkills2(context),
                          SizedBox(height: 24),
                          _buildExperience1(context),
                          SizedBox(height: 24),
                          _buildEducation1(context)
                        ]))))));
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
        title: AppbarTitle(text: "Profile"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgComponent3Primary,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
              onTap: () {
                onTapImage1(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildBG(BuildContext context) {
    return SizedBox(
        height: 225,
        width: 327,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          CustomImageView(
              imagePath: ImageConstant.imgBg,
              height: 120,
              width: 327,
              radius: BorderRadius.circular(8),
              alignment: Alignment.topCenter),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 87),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    CustomImageView(
                        imagePath: ImageConstant.img63,
                        height: 89,
                        width: 89,
                        radius: BorderRadius.circular(44)),
                    SizedBox(height: 9),
                    Text("Gustavo Lipshutz",
                        style: CustomTextStyles.titleMediumBlack900),
                    SizedBox(height: 7),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                          padding: EdgeInsets.only(top: 1),
                          child: Text("Open to work",
                              style: CustomTextStyles
                                  .titleSmallGray500SemiBold_1)),
                      Container(
                          height: 16,
                          width: 16,
                          margin: EdgeInsets.only(left: 10, bottom: 3),
                          padding: EdgeInsets.all(3),
                          decoration: AppDecoration.success.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder8),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgCheck,
                              height: 9,
                              width: 9,
                              alignment: Alignment.center))
                    ])
                  ])))
        ]));
  }

  /// Section Widget
  Widget _buildJobApplied(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              width: 154,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              decoration: AppDecoration.fillGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder24),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text("25",
                            style: CustomTextStyles.titleMediumBold_1)),
                    Padding(
                        padding: EdgeInsets.only(top: 5),
                        child:
                            Text("Applied", style: theme.textTheme.labelLarge))
                  ])),
          CustomElevatedButton(
              height: 48,
              width: 154,
              text: "10",
              margin: EdgeInsets.only(left: 19),
              buttonStyle: CustomButtonStyles.fillGrayTL241,
              buttonTextStyle: CustomTextStyles.titleMediumBold_1)
        ]));
  }

  /// Section Widget
  Widget _buildAboutMe(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2),
              _buildSkills(context,
                  skills: "About Me", editSquare: ImageConstant.imgEditSquare),
              SizedBox(height: 14),
              Container(
                  width: 272,
                  margin: EdgeInsets.only(right: 22),
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero, cursus molestie nullam ac pharetra est nec enim. Vel eleifend semper nunc faucibus donec pretium.",
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleSmallBluegray400
                          .copyWith(height: 1.57)))
            ]));
  }

  /// Section Widget
  Widget _buildSkills2(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 23),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: _buildSkills(context,
                  skills: "Skills", editSquare: ImageConstant.imgEditSquare)),
          SizedBox(height: 12),
          Wrap(
              runSpacing: 12,
              spacing: 12,
              children:
                  List<Widget>.generate(8, (index) => FortysevenItemWidget())),
          SizedBox(height: 17)
        ]));
  }

  /// Section Widget
  Widget _buildExperience1(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSkills(context,
                  skills: "Experience",
                  editSquare: ImageConstant.imgEditSquarePrimary),
              SizedBox(height: 22),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 11.5),
                        child: SizedBox(
                            width: 235,
                            child: Divider(
                                height: 1,
                                thickness: 1,
                                color: appTheme.gray300)));
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ProfileItemWidget();
                  })
            ]));
  }

  /// Section Widget
  Widget _buildEducation1(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        padding: EdgeInsets.all(15),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSkills(context,
                  skills: "Education",
                  editSquare: ImageConstant.imgEditSquarePrimary),
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

  /// Common widget
  Widget _buildSkills(
    BuildContext context, {
    required String skills,
    required String editSquare,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 2),
          child: Text(skills,
              style: theme.textTheme.titleMedium!
                  .copyWith(color: theme.colorScheme.primary))),
      CustomImageView(imagePath: editSquare, height: 24, width: 24)
    ]);
  }

  /// Navigates back to the previous screen.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapImage1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.settingsScreen);
  }
}
