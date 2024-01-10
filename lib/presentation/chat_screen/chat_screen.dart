import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_trailing_image.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';
import 'package:web3_freelancer/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 80),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 32,
                                    width: 32,
                                    margin: EdgeInsets.only(bottom: 36),
                                    child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgAvatar32x32,
                                              height: 32,
                                              width: 32,
                                              radius: BorderRadius.circular(16),
                                              alignment: Alignment.center),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                  height: 8,
                                                  width: 8,
                                                  decoration: BoxDecoration(
                                                      color: appTheme.green600,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      border: Border.all(
                                                          color: theme
                                                              .colorScheme
                                                              .onPrimaryContainer
                                                              .withOpacity(1),
                                                          width: 1))))
                                        ])),
                                Expanded(
                                    child: Container(
                                        margin: EdgeInsets.only(left: 12),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 9),
                                        decoration: AppDecoration.fillGray
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .customBorderTL241),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(height: 5),
                                              Container(
                                                  width: 164,
                                                  margin: EdgeInsets.only(
                                                      right: 14),
                                                  child: Text(
                                                      "Lorem ipsum dolor sit et, consectetur adipiscing.",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: CustomTextStyles
                                                          .titleSmallBluegray400
                                                          .copyWith(
                                                              height: 1.57)))
                                            ])))
                              ])),
                      SizedBox(height: 6),
                      Padding(
                          padding: EdgeInsets.only(left: 44),
                          child: Text("15:42 PM",
                              style: CustomTextStyles.labelMediumGray500)),
                      SizedBox(height: 26),
                      _buildCard(context),
                      SizedBox(height: 26),
                      Padding(
                          padding: EdgeInsets.only(right: 80),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 32,
                                    width: 32,
                                    margin: EdgeInsets.only(bottom: 36),
                                    child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgAvatar32x32,
                                              height: 32,
                                              width: 32,
                                              radius: BorderRadius.circular(16),
                                              alignment: Alignment.center),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                  height: 8,
                                                  width: 8,
                                                  decoration: BoxDecoration(
                                                      color: appTheme.green600,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      border: Border.all(
                                                          color: theme
                                                              .colorScheme
                                                              .onPrimaryContainer
                                                              .withOpacity(1),
                                                          width: 1))))
                                        ])),
                                Expanded(
                                    child: Container(
                                        margin: EdgeInsets.only(left: 12),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 9),
                                        decoration: AppDecoration.fillGray
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .customBorderTL241),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(height: 5),
                                              Container(
                                                  width: 164,
                                                  margin: EdgeInsets.only(
                                                      right: 14),
                                                  child: Text(
                                                      "Lorem ipsum dolor sit et, consectetur adipiscing.",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: CustomTextStyles
                                                          .titleSmallBluegray400
                                                          .copyWith(
                                                              height: 1.57)))
                                            ])))
                              ])),
                      SizedBox(height: 6),
                      Padding(
                          padding: EdgeInsets.only(left: 44),
                          child: Text("15:42 PM",
                              style: CustomTextStyles.labelMediumGray500)),
                      SizedBox(height: 5)
                    ])),
            bottomNavigationBar: _buildMessage(context)));
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
        title: AppbarTitle(text: "Chance Septimus"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgComponent3,
              margin: EdgeInsets.fromLTRB(16, 13, 16, 14))
        ]);
  }

  /// Section Widget
  Widget _buildCard(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Padding(
          padding: EdgeInsets.only(left: 97),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Expanded(
                child: CustomElevatedButton(
                    height: 46,
                    text: "Lorem ipsum dolor sit et",
                    buttonStyle: CustomButtonStyles.fillPrimaryTL24,
                    buttonTextStyle:
                        CustomTextStyles.titleSmallOnPrimaryContainer)),
            CustomImageView(
                imagePath: ImageConstant.imgUser,
                height: 32,
                width: 32,
                margin: EdgeInsets.only(left: 12, top: 7, bottom: 7))
          ])),
      SizedBox(height: 6),
      Padding(
          padding: EdgeInsets.only(right: 44),
          child: Text("15:42 PM", style: CustomTextStyles.labelMediumGray500))
    ]);
  }

  /// Section Widget
  Widget _buildMessage(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24, right: 24, bottom: 40),
        child: CustomTextFormField(
            controller: messageController,
            hintText: "Type your message...",
            textInputAction: TextInputAction.done,
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            borderDecoration: TextFormFieldStyleHelper.fillGray,
            fillColor: appTheme.gray300));
  }

  /// Navigates back to the previous screen.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }
}
