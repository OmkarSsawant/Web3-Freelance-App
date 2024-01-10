import 'package:web3_freelancer/utils.dart';

import '../home_page/widgets/eightyeight_item_widget.dart';
import '../home_page/widgets/frame_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_circleimage.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_subtitle.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_trailing_image.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';
import 'package:web3_freelancer/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: CustomSearchView(
                    controller: searchController,
                    hintText: "Search...",
                    alignment: Alignment.center,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  "Recommendation",
                  style: CustomTextStyles.titleMedium18,
                ),
              ),
              SizedBox(height: 17),
              _buildFrame(context),
              SizedBox(height: 22),
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  "Recent Jobs",
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 15),
              Expanded(child: _buildEightyEight(context)),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 74,
      leading: AppbarLeadingCircleimage(
        imagePath: ImageConstant.imgImage50x50,
        margin: EdgeInsets.only(left: 24),
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            AppbarSubtitle(
              text: "Hi, Welcome Back! 👋",
            ),
            SizedBox(height: 9),
            AppbarSubtitleOne(
              text: "Find your dream job",
              margin: EdgeInsets.only(right: 33),
            ),
          ],
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotification,
          margin: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 13,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: context.screenHeight * 0.25,
        child: ListView.separated(
          padding: EdgeInsets.only(left: 24),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 16,
            );
          },
          itemCount: 2,
          itemBuilder: (context, index) {
            return ProjectRecommendationTileWidget();
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEightyEight(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return ProjectTileWidget();
          },
        ),
      ),
    );
  }
}
