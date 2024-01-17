import 'package:provider/provider.dart';
import 'package:web3_freelancer/data/model/project.dart';
import 'package:web3_freelancer/presentation/common/chat_screen.dart';
import 'package:web3_freelancer/presentation/developer/project_details_page/job_details_tab_container_screen/job_details_tab_container_screen.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';
import 'package:web3modal_flutter/services/w3m_service/w3m_service.dart';

import 'fulltime3_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ProjectTileWidget extends StatelessWidget {
  final Project project;
  final Function? onTap;
  final String btnText;
  final bool enableChat;
  ProjectTileWidget(
      {Key? key,
      required this.project,
      required this.onTap,
      required this.btnText,
      this.enableChat = false})
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
                                project.title,
                                style: CustomTextStyles.titleMediumBold_1,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "${project.owner.substring(0,7)}...${project.owner.substring(project.owner.length-7,project.owner.length)}",
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
                      "${project.deposit}\t eth",
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(height: 13),
                    // Wrap(
                    //   runSpacing: 8,
                    //   spacing: 8,
                    //   children: List<Widget>.generate(
                    //       2, (index) => Fulltime3ItemWidget()),
                    // ),
                    Text(
                      project.projectType,
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(height: 13),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: FilledButton.icon(
                                label: Text(btnText),
                                onPressed: () {
                                  if (onTap != null) {
                                    onTap!();
                                  }
                                },
                                icon: const Icon(Icons.money_outlined)),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          if (enableChat)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => ChatPage(
                                                projectId: project.id,
                                                other: context.read<W3MService>().address!,
                                                me: project.owner)));
                                  },
                                  icon: const Icon(Icons.chat_bubble_rounded)),
                            )
                        ],
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
