import 'package:provider/provider.dart';
import 'package:web3_freelancer/data/model/project.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';
import 'package:web3dart/web3dart.dart';

import 'fulltime1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ProjectRecommendationTileWidget extends StatelessWidget {
  final Project project;
  ProjectRecommendationTileWidget({Key? key, required this.project})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 273,
      child: Align(
        alignment: Alignment.centerRight,
        child: FutureBuilder<List<dynamic>>(
            future: context
                .read<FreelanceContractClient>()
                .getOngoingTaskAndPaymentTillNow(project.id),
            builder: (context, snap) {
              return Container(
                padding: EdgeInsets.all(16),
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 96),
                      child: CustomIconButton(
                        height: 48,
                        width: 48,
                        padding: EdgeInsets.all(8),
                        decoration:
                            IconButtonStyleHelper.fillOnPrimaryContainer,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgBag,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                        top: 4,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.title,
                            style: CustomTextStyles
                                .titleSmallOnPrimaryContainerBold,
                          ),
                          SizedBox(height: 7),
                          Opacity(
                            opacity: 0.8,
                            child: Text(
                              snap.data != null
                                  ? snap.data![0][0].toString()
                                  : ".",
                              style: CustomTextStyles
                                  .labelLargeOnPrimaryContainerSemiBold,
                            ),
                          ),
                          SizedBox(height: 11),
                          Opacity(
                            opacity: 0.64,
                            child: Text(
                              "paid : ${snap.data != null ? snap.data![0][2].toString() : "."}",
                              style: CustomTextStyles
                                  .labelLargeOnPrimaryContainer_1,
                            ),
                          ),
                          SizedBox(height: 9),
                          Text(
                            "${EtherAmount.fromBigInt(EtherUnit.wei, project.deposit).getValueInUnit(EtherUnit.ether)} \teth",
                            style:
                                CustomTextStyles.labelLargeOnPrimaryContainer_3,
                          ),
                          SizedBox(height: 17),
                          FilledButton(
                            onPressed: null,
                            child: Text(snap.data != null
                                ? snap.data![0][0].toString()
                                : ""),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
