import '../job_details_tab_container_screen/widgets/framefive_item_widget.dart';
import '../job_details_tab_container_screen/widgets/jobdetailstabcontainer_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_trailing_image.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';

class JobDetailsTabContainerScreen extends StatefulWidget {
  const JobDetailsTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  JobDetailsTabContainerScreenState createState() =>
      JobDetailsTabContainerScreenState();
}

class JobDetailsTabContainerScreenState
    extends State<JobDetailsTabContainerScreen> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 30),
            child: SizedBox(
              height: 688,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  _buildTabBarView(context),
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCardanoOne(context),
                        SizedBox(height: 24),
                        _buildJobDetailsTabContainer(context),
                        SizedBox(height: 26),
                        _buildTabview(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 48,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgComponent1,
        margin: EdgeInsets.only(
          left: 24,
          top: 13,
          bottom: 13,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Job Details",
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgComponent3,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 13,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTabBarView(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 419),
      height: 269,
      child: TabBarView(
        controller: tabviewController,
        children: [],
      ),
    );
  }

  /// Section Widget
  Widget _buildCardanoOne(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24),
      padding: EdgeInsets.symmetric(
        horizontal: 71,
        vertical: 23,
      ),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 79,
            width: 79,
            padding: EdgeInsets.all(19),
            decoration: AppDecoration.fillGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder39,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgCardano1,
              height: 40,
              width: 40,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Senior UI/UX Designer",
            style: CustomTextStyles.titleSmallBold,
          ),
          SizedBox(height: 7),
          Text(
            "Shopee Sg",
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 12),
          Wrap(
            runSpacing: 9,
            spacing: 9,
            children:
                List<Widget>.generate(2, (index) => FramefiveItemWidget()),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildJobDetailsTabContainer(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 15,
          right: 49,
        ),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 54,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return JobdetailstabcontainerItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 44,
      width: 351,
      child: TabBar(
        controller: tabviewController,
        isScrollable: true,
        labelColor: theme.colorScheme.primary,
        labelStyle: TextStyle(
          fontSize: 12,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: appTheme.gray500,
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
        ),
        indicator: BoxDecoration(
          color: appTheme.gray100,
          borderRadius: BorderRadius.circular(
            22,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "Description",
            ),
          ),
          Tab(
            child: Text(
              "Requirement",
            ),
          ),
          Tab(
            child: Text(
              "Responsibilities",
            ),
          ),
        ],
      ),
    );
  }
}
