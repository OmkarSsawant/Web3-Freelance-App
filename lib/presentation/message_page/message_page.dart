import '../message_page/widgets/message_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_trailing_image.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';
import 'package:web3_freelancer/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class MessagePage extends StatelessWidget {
  MessagePage({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(24),
                child: Column(children: [
                  SizedBox(height: 4),
                  CustomSearchView(
                      controller: searchController, hintText: "Search Message"),
                  SizedBox(height: 24),
                  _buildDot(context),
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 15),
                  _buildAvatar(context),
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 15),
                  _buildMessage(context),
                  Spacer(),
                  CustomElevatedButton(
                      height: 46,
                      width: 137,
                      text: "New Chat",
                      leftIcon: Container(
                          margin: EdgeInsets.only(right: 4),
                          child: CustomImageView(
                              imagePath:
                                  ImageConstant.imgPlusOnprimarycontainer,
                              height: 18,
                              width: 18)),
                      buttonStyle: CustomButtonStyles.fillPrimaryTL20,
                      buttonTextStyle:
                          CustomTextStyles.titleSmallOnPrimaryContainerSemiBold,
                      alignment: Alignment.centerRight)
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
              onTapImage(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Message"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgComponent3,
              margin: EdgeInsets.fromLTRB(16, 13, 16, 14))
        ]);
  }

  /// Section Widget
  Widget _buildDot(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapDot(context);
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              height: 56,
              width: 56,
              child: Stack(alignment: Alignment.bottomRight, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgImage56x56,
                    height: 56,
                    width: 56,
                    radius: BorderRadius.circular(28),
                    alignment: Alignment.center),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                            color: appTheme.green600,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: theme.colorScheme.onPrimaryContainer
                                    .withOpacity(1),
                                width: 1))))
              ])),
          Padding(
              padding: EdgeInsets.only(left: 12, top: 3),
              child: _buildNameDescription(context,
                  wadeWarren: "Esther Howard",
                  loremIpsumDolor: "Lorem ipsum dolor sit amet...")),
          Spacer(),
          Padding(
              padding: EdgeInsets.only(top: 7),
              child: _buildTime(context, time: "10:20", widget: "2"))
        ]));
  }

  /// Section Widget
  Widget _buildAvatar(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapAvatar(context);
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgAvatar,
              height: 56,
              width: 56,
              radius: BorderRadius.circular(28)),
          Padding(
              padding: EdgeInsets.only(left: 12, top: 3),
              child: _buildNameDescription(context,
                  wadeWarren: "Wade Warren",
                  loremIpsumDolor: "Lorem ipsum dolor sit amet...")),
          Spacer(),
          Padding(
              padding: EdgeInsets.only(top: 7),
              child: _buildTime(context, time: "10:20", widget: "2"))
        ]));
  }

  /// Section Widget
  Widget _buildMessage(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 7.5),
              child: SizedBox(
                  width: 327,
                  child: Divider(
                      height: 1, thickness: 1, color: appTheme.gray300)));
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return MessageItemWidget();
        });
  }

  /// Common widget
  Widget _buildNameDescription(
    BuildContext context, {
    required String wadeWarren,
    required String loremIpsumDolor,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(wadeWarren,
          style: CustomTextStyles.titleMediumBold
              .copyWith(color: theme.colorScheme.primary)),
      SizedBox(height: 9),
      Text(loremIpsumDolor,
          style: CustomTextStyles.titleSmallBluegray400
              .copyWith(color: appTheme.blueGray400))
    ]);
  }

  /// Common widget
  Widget _buildTime(
    BuildContext context, {
    required String time,
    required String widget,
  }) {
    return Column(children: [
      Text(time,
          style: CustomTextStyles.labelLargeSemiBold
              .copyWith(color: appTheme.blueGray400)),
      SizedBox(height: 6),
      Align(
          alignment: Alignment.centerRight,
          child: Container(
              width: 24,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: AppDecoration.fillPrimary
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
              child: Text(widget,
                  style: theme.textTheme.labelMedium!.copyWith(
                      color: theme.colorScheme.onPrimaryContainer
                          .withOpacity(1)))))
    ]);
  }

  /// Navigates back to the previous screen.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the chatScreen when the action is triggered.
  onTapDot(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.chatScreen);
  }

  /// Navigates to the chatScreen when the action is triggered.
  onTapAvatar(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.chatScreen);
  }
}
