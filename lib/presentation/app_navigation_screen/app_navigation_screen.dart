import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Splash Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Onboarding Three",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.onboardingThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign Up - Create Acount",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signUpCreateAcountScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign Up - Complete Account ",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signUpCompleteAccountScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Job Type",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.jobTypeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Speciallization",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.speciallizationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Select a Country",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.selectACountryScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Enter OTP - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.enterOtpTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Home - Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.homeContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Search",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.searchScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Job Details - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.jobDetailsTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Message Action",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.messageActionScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Chat",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.chatScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Apply Job",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.applyJobScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle:
                              "Notifications - My Proposals - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context,
                              AppRoutes
                                  .notificationsMyProposalsTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Settings",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.settingsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Personal Info",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.personalInfoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Experience Setting",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.experienceSettingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "New Position",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.newPositionScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Add New Education",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addNewEducationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Privacy",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.privacyScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Language",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.languageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Notifications",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationsScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Divider(
            height: 1,
            thickness: 1,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 5),
            Divider(
              height: 1,
              thickness: 1,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
