import '../language_screen/widgets/chineses_item_widget.dart';
import '../language_screen/widgets/englishuk_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                child: Column(children: [
                  _buildSuggestedLanguages(context),
                  SizedBox(height: 24),
                  _buildOtherLanguages(context),
                  SizedBox(height: 5)
                ]))));
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
        title: AppbarTitle(text: "Language"));
  }

  /// Section Widget
  Widget _buildSuggestedLanguages(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2),
              Text("Suggested Languages",
                  style: CustomTextStyles.labelLargeSemiBold),
              SizedBox(height: 16),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 7.0),
                        child: SizedBox(
                            width: 295,
                            child: Divider(
                                height: 1,
                                thickness: 1,
                                color: appTheme.gray300)));
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return EnglishukItemWidget();
                  })
            ]));
  }

  /// Section Widget
  Widget _buildOtherLanguages(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3),
              Text("Other Languages",
                  style: CustomTextStyles.labelLargeSemiBold),
              SizedBox(height: 19),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                            width: 295,
                            child: Divider(
                                height: 1,
                                thickness: 1,
                                color: appTheme.gray300)));
                  },
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ChinesesItemWidget();
                  })
            ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowBack(BuildContext context) {
    Navigator.pop(context);
  }
}
