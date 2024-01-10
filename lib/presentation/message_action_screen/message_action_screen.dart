import '../message_action_screen/widgets/messageaction_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/presentation/home_page/home_page.dart';
import 'package:web3_freelancer/presentation/message_page/message_page.dart';
import 'package:web3_freelancer/presentation/profile_page/profile_page.dart';
import 'package:web3_freelancer/presentation/saved_page/saved_page.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_trailing_image.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';
import 'package:web3_freelancer/widgets/custom_bottom_bar.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';
import 'package:web3_freelancer/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class MessageActionScreen extends StatelessWidget {
  MessageActionScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Column(children: [
                  SizedBox(height: 2),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: CustomSearchView(
                          controller: searchController,
                          hintText: "Search Message")),
                  SizedBox(height: 24),
                  _buildMessageAction(context),
                  Spacer(),
                  CustomElevatedButton(
                      height: 46,
                      width: 137,
                      text: "New Chat",
                      margin: EdgeInsets.only(right: 24),
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
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 97,
        leadingWidth: 48,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgComponent1,
            margin: EdgeInsets.only(left: 24, top: 15, bottom: 16),
            onTap: () {
              onTapImage(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Message"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgComponent3,
              margin: EdgeInsets.fromLTRB(16, 15, 16, 16))
        ]);
  }

  /// Section Widget
  Widget _buildMessageAction(BuildContext context) {
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
        itemCount: 4,
        itemBuilder: (context, index) {
          return MessageactionItemWidget(onTapEstherHoward: () {
            onTapEstherHoward(context);
          });
        });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
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

  /// Navigates to the chatScreen when the action is triggered.
  onTapEstherHoward(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.chatScreen);
  }

  /// Navigates back to the previous screen.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }
}
