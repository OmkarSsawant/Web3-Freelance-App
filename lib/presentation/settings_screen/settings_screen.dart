import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/presentation/home_page/home_page.dart';
import 'package:web3_freelancer/presentation/message_page/message_page.dart';
import 'package:web3_freelancer/presentation/profile_page/profile_page.dart';
import 'package:web3_freelancer/presentation/saved_page/saved_page.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';
import 'package:web3_freelancer/widgets/custom_bottom_bar.dart';
import 'package:web3_freelancer/presentation/logout_popup_dialog/logout_popup_dialog.dart';

// ignore_for_file: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

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
                                _buildBannerProgress(context),
                                SizedBox(height: 32),
                                _buildAccount1(context),
                                SizedBox(height: 26),
                                _buildGeneral(context),
                                SizedBox(height: 26),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("About",
                                        style: CustomTextStyles
                                            .labelLargeSemiBold)),
                                SizedBox(height: 16),
                                _buildPrivacy(context,
                                    thumbsUp: ImageConstant.imgShield,
                                    experience: "Legal and Policies",
                                    onTapPrivacy: () {
                                  onTapLegalAndPolicies(context);
                                }),
                                SizedBox(height: 15),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Divider(indent: 36)),
                                SizedBox(height: 16),
                                _buildPrivacy(context,
                                    thumbsUp: ImageConstant.imgProfile,
                                    experience: "Help & Feedback"),
                                SizedBox(height: 17),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Divider(indent: 36)),
                                SizedBox(height: 16),
                                _buildPrivacy(context,
                                    thumbsUp: ImageConstant.imgVideoCamera,
                                    experience: "About Us"),
                                SizedBox(height: 28),
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtLargeLabelMedium(context);
                                    },
                                    child: Text("Logout",
                                        style: CustomTextStyles
                                            .titleMediumOnPrimary))
                              ]))))
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
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
        title: AppbarTitle(text: "Settings"));
  }

  /// Section Widget
  Widget _buildBannerProgress(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Row(children: [
          Container(
              height: 64,
              width: 64,
              margin: EdgeInsets.only(top: 5, bottom: 4),
              child: Stack(alignment: Alignment.center, children: [
                Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: 64,
                        width: 64,
                        child: CircularProgressIndicator(
                            value: 0.5, strokeWidth: 4))),
                Align(
                    alignment: Alignment.center,
                    child: Text("65%",
                        style: CustomTextStyles.titleMediumOnPrimaryContainer))
              ])),
          Padding(
              padding: EdgeInsets.only(left: 16, top: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Profile Completeness",
                        style: CustomTextStyles.titleMediumOnPrimaryContainer),
                    SizedBox(height: 4),
                    Opacity(
                        opacity: 0.8,
                        child: SizedBox(
                            width: 185,
                            child: Text(
                                "Quality profiles are 5 times more likely to get hired by clients.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles
                                    .labelLargeOnPrimaryContainer_2
                                    .copyWith(height: 1.67))))
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildAccount1(BuildContext context) {
    return Column(children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Text("Account", style: CustomTextStyles.labelLargeSemiBold)),
      SizedBox(height: 15),
      _buildPrivacy(context,
          thumbsUp: ImageConstant.imgPerson,
          experience: "Personal Info", onTapPrivacy: () {
        onTapAccount(context);
      }),
      SizedBox(height: 16),
      Align(alignment: Alignment.centerRight, child: Divider(indent: 36)),
      SizedBox(height: 15),
      _buildPrivacy(context,
          thumbsUp: ImageConstant.imgThumbsUpPrimary,
          experience: "Experience", onTapPrivacy: () {
        onTapPrivacy(context);
      }),
      SizedBox(height: 14),
      Align(alignment: Alignment.centerRight, child: Divider(indent: 36))
    ]);
  }

  /// Section Widget
  Widget _buildGeneral(BuildContext context) {
    return Column(children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Text("General", style: CustomTextStyles.labelLargeSemiBold)),
      SizedBox(height: 15),
      _buildPrivacy(context,
          thumbsUp: ImageConstant.imgBell,
          experience: "Notification", onTapPrivacy: () {
        onTapNotification(context);
      }),
      SizedBox(height: 16),
      Align(alignment: Alignment.centerRight, child: Divider(indent: 36)),
      SizedBox(height: 15),
      _buildPrivacy(context,
          thumbsUp: ImageConstant.imgGlobe,
          experience: "Language", onTapPrivacy: () {
        onTapLanguage(context);
      }),
      SizedBox(height: 14),
      Align(alignment: Alignment.centerRight, child: Divider(indent: 36)),
      SizedBox(height: 15),
      _buildPrivacy(context,
          thumbsUp: ImageConstant.imgShieldDone, experience: "Security"),
      SizedBox(height: 14),
      Align(alignment: Alignment.centerRight, child: Divider(indent: 36))
    ]);
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  /// Common widget
  Widget _buildPrivacy(
    BuildContext context, {
    required String thumbsUp,
    required String experience,
    Function? onTapPrivacy,
  }) {
    return GestureDetector(
        onTap: () {
          onTapPrivacy!.call();
        },
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomImageView(
                  imagePath: thumbsUp,
                  height: 24,
                  width: 24,
                  margin: EdgeInsets.only(top: 3)),
              Padding(
                  padding: EdgeInsets.only(left: 12, top: 7),
                  child: Text(experience,
                      style: theme.textTheme.titleMedium!
                          .copyWith(color: theme.colorScheme.primary))),
              Spacer(),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowRightPrimary,
                  height: 24,
                  width: 24,
                  margin: EdgeInsets.only(bottom: 4))
            ]));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Message:
        return AppRoutes.messagePage;
      case BottomBarEnum.Saved:
        return AppRoutes.savedPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.messagePage:
        return MessagePage();
      case AppRoutes.savedPage:
        return SavedPage();
      case AppRoutes.profilePage:
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates back to the previous screen.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the personalInfoScreen when the action is triggered.
  onTapAccount(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.personalInfoScreen);
  }

  /// Navigates to the experienceSettingScreen when the action is triggered.
  onTapPrivacy(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.experienceSettingScreen);
  }

  /// Navigates to the notificationsScreen when the action is triggered.
  onTapNotification(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationsScreen);
  }

  /// Navigates to the languageScreen when the action is triggered.
  onTapLanguage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.languageScreen);
  }

  /// Navigates to the privacyScreen when the action is triggered.
  onTapLegalAndPolicies(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.privacyScreen);
  }

  /// Displays a dialog with the [LogoutPopupDialog] content.
  onTapTxtLargeLabelMedium(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: LogoutPopupDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
