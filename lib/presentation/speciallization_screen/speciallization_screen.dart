import '../speciallization_screen/widgets/speciallization_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_trailing_image.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';
import 'package:web3_freelancer/presentation/confirmation_dialog/confirmation_dialog.dart';

class SpeciallizationScreen extends StatelessWidget {
  const SpeciallizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 23, vertical: 31),
                child: Column(children: [
                  SizedBox(
                      width: 177,
                      child: Text("What is your specialization?",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall!
                              .copyWith(height: 1.33))),
                  SizedBox(height: 7),
                  Text("Lorem ipsum dolor sit amet, consectetur",
                      style: CustomTextStyles.titleSmallBluegray400),
                  SizedBox(height: 31),
                  _buildSpeciallization(context)
                ])),
            bottomNavigationBar: _buildContinue(context)));
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
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgComponent3,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 13))
        ]);
  }

  /// Section Widget
  Widget _buildSpeciallization(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 16);
            },
            itemCount: 6,
            itemBuilder: (context, index) {
              return SpeciallizationItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return CustomElevatedButton(
        text: "Continue",
        margin: EdgeInsets.only(left: 24, right: 24, bottom: 39),
        onPressed: () {
          onTapContinue(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

  /// Displays a dialog with the [ConfirmationDialog] content.
  onTapContinue(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: ConfirmationDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
