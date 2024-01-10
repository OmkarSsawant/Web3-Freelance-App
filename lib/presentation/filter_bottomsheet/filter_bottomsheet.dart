import '../filter_bottomsheet/widgets/fiftyfive_item_widget.dart';
import '../filter_bottomsheet/widgets/jobs_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';

class FilterBottomsheet extends StatelessWidget {
  const FilterBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 25),
        decoration: AppDecoration.background
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL24),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          _buildClose(context),
          SizedBox(height: 29),
          _buildDesignCreative(context),
          SizedBox(height: 26),
          _buildSalaries(context),
          SizedBox(height: 28),
          _buildJobs(context),
          SizedBox(height: 30),
          CustomElevatedButton(
              text: "Apply Filter",
              onPressed: () {
                onTapApplyFilter(context);
              }),
          SizedBox(height: 15)
        ]));
  }

  /// Section Widget
  Widget _buildClose(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(
          imagePath: ImageConstant.imgComponent1Primary,
          height: 24,
          width: 24,
          onTap: () {
            onTapImgClose(context);
          }),
      Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text("Filter", style: CustomTextStyles.titleMedium18)),
      Spacer(),
      Padding(
          padding: EdgeInsets.only(top: 3, bottom: 2),
          child: Text("Reset Filters",
              style: CustomTextStyles.titleSmallDeeporangeA200))
    ]);
  }

  /// Section Widget
  Widget _buildDesignCreative(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 1),
              child: Text("Categories",
                  style: CustomTextStyles.titleMediumBold_1)),
          SizedBox(height: 14),
          Wrap(
              runSpacing: 16,
              spacing: 16,
              children:
                  List<Widget>.generate(6, (index) => FiftyfiveItemWidget()))
        ]));
  }

  /// Section Widget
  Widget _buildSalaries(BuildContext context) {
    return Column(children: [
      _buildPrice(context, price: "Salaries", price1: "6.000/Month"),
      SizedBox(height: 16),
      SliderTheme(
          data: SliderThemeData(
              trackShape: RoundedRectSliderTrackShape(),
              activeTrackColor: appTheme.deepOrangeA200,
              inactiveTrackColor: appTheme.gray100,
              thumbColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
              thumbShape: RoundSliderThumbShape()),
          child: Slider(
              value: 52.91, min: 0.0, max: 100.0, onChanged: (value) {})),
      SizedBox(height: 2),
      _buildPrice(context, price: "560", price1: "12.000")
    ]);
  }

  /// Section Widget
  Widget _buildJobs(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Jobs", style: CustomTextStyles.titleMediumBold_1),
          SizedBox(height: 16),
          Wrap(
              runSpacing: 16,
              spacing: 16,
              children: List<Widget>.generate(2, (index) => JobsItemWidget()))
        ]));
  }

  /// Common widget
  Widget _buildPrice(
    BuildContext context, {
    required String price,
    required String price1,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(price,
          style: CustomTextStyles.labelLargeSemiBold
              .copyWith(color: appTheme.blueGray400)),
      Text(price1,
          style: CustomTextStyles.labelLargeSemiBold
              .copyWith(color: appTheme.blueGray400))
    ]);
  }

  /// Navigates back to the previous screen.
  onTapImgClose(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapApplyFilter(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeContainerScreen);
  }
}
