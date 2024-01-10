import 'fulltime3_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ProjectTileWidget extends StatelessWidget {
  const ProjectTileWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: AppDecoration.outlineGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 1,
                bottom: 67,
              ),
              child: CustomIconButton(
                height: 48,
                width: 48,
                padding: EdgeInsets.all(8),
                child: CustomImageView(
                  imagePath: ImageConstant.imgSettings,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Digital Marketing",
                                style: CustomTextStyles.titleMediumBold_1,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Motorola",
                                style: CustomTextStyles.labelLargeGray500,
                              ),
                            ],
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgComponent3,
                          height: 24,
                          width: 24,
                          margin: EdgeInsets.only(bottom: 22),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      "560 - 12.000/Month",
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(height: 13),
                    Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      children: List<Widget>.generate(
                          2, (index) => Fulltime3ItemWidget()),
                    ),
                    SizedBox(height: 13),
                    Container(
                      width: double.infinity,
                      child: Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: FilledButton.icon(
                            label: const Text("Bid"),
                            onPressed: () {},
                            icon: const Icon(Icons.money_outlined)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
