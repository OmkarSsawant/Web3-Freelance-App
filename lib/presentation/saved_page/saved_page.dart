import '../saved_page/widgets/saved_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_trailing_image.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 24, top: 30, right: 24),
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 12);
                    },
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return SavedItemWidget(onTapBag: () {
                        onTapBag(context);
                      });
                    }))));
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
        title: AppbarTitle(text: "Saved"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgComponent3,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 13))
        ]);
  }

  /// Navigates to the jobDetailsTabContainerScreen when the action is triggered.
  onTapBag(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.jobDetailsTabContainerScreen);
  }

  /// Navigates back to the previous screen.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }
}
