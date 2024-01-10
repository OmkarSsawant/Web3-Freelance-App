import '../search_screen/widgets/search_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_trailing_image.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';
import 'package:web3_freelancer/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 30),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Column(children: [
                          CustomSearchView(
                              controller: searchController,
                              hintText: "Search..."),
                          SizedBox(height: 24),
                          _buildSearch(context)
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
        title: AppbarTitle(text: "Find Jobs"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgComponent3,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 13))
        ]);
  }

  /// Section Widget
  Widget _buildSearch(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 12);
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return SearchItemWidget(onTapSettings: () {
            onTapSettings(context);
          });
        });
  }

  /// Navigates to the jobDetailsTabContainerScreen when the action is triggered.
  onTapSettings(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.jobDetailsTabContainerScreen);
  }

  /// Navigates back to the previous screen.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }
}
