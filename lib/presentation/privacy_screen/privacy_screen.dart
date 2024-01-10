import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

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
                        padding: EdgeInsets.only(left: 24, right: 43),
                        child: Column(children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Terms",
                                  style: CustomTextStyles.titleMediumBold_1)),
                          SizedBox(height: 11),
                          Opacity(
                              opacity: 0.5,
                              child: SizedBox(
                                  width: 307,
                                  child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.",
                                      maxLines: 7,
                                      overflow: TextOverflow.ellipsis,
                                      style: CustomTextStyles
                                          .titleSmallBluegray400_1
                                          .copyWith(height: 1.57)))),
                          Opacity(
                              opacity: 0.5,
                              child: SizedBox(
                                  width: 307,
                                  child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.",
                                      maxLines: 7,
                                      overflow: TextOverflow.ellipsis,
                                      style: CustomTextStyles
                                          .titleSmallBluegray400_1
                                          .copyWith(height: 1.57)))),
                          SizedBox(height: 17),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Changes to the Service and/or Terms:",
                                  style: CustomTextStyles.titleMediumBold_1)),
                          SizedBox(height: 7),
                          _buildDescription(context)
                        ]))))));
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
        title: AppbarTitle(text: "Legel and Policies"));
  }

  /// Section Widget
  Widget _buildDescription(BuildContext context) {
    return SizedBox(
        height: 303,
        width: 307,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.topCenter,
              child: Opacity(
                  opacity: 0.5,
                  child: SizedBox(
                      width: 307,
                      child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.",
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleSmallBluegray400_1
                              .copyWith(height: 1.57))))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Opacity(
                  opacity: 0.5,
                  child: SizedBox(
                      width: 307,
                      child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.",
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleSmallBluegray400_1
                              .copyWith(height: 1.57)))))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowBack(BuildContext context) {
    Navigator.pop(context);
  }
}
