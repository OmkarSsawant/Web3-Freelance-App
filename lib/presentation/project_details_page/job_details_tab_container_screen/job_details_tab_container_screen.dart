import 'package:web3_freelancer/data/model/project.dart';
import 'package:web3_freelancer/data/model/project_details.dart';
import 'package:web3_freelancer/presentation/job_details_page/job_details_page.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';
import 'package:web3dart/web3dart.dart';

import '../job_details_tab_container_screen/widgets/framefive_item_widget.dart';
import '../job_details_tab_container_screen/widgets/jobdetailstabcontainer_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_leading_image.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_title.dart';
import 'package:web3_freelancer/widgets/app_bar/appbar_trailing_image.dart';
import 'package:web3_freelancer/widgets/app_bar/custom_app_bar.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final Project project;
  final FreelanceContractClient contract;
  ProjectDetailsScreen(
      {Key? key, required this.project, required this.contract})
      : super(
          key: key,
        );

  @override
  ProjectDetailsScreenState createState() => ProjectDetailsScreenState();
}

class ProjectDetailsScreenState extends State<ProjectDetailsScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;
  ProjectDetails pd = ProjectDetails(
      description: "Loading ...",
      techstack: ['"Loading ..."'],
      eligiblityCriteria: "Loading ...",
      roles: ["Loading ..."],
      ssrDocIpfs: "Loading ...");
  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
    loadProjectDetails(widget.project.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: context.screenWidth,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 30),
            child: SizedBox(
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildCardanoOne(context),
                        SizedBox(height: 26),
                        _buildJobDetailsTabContainer(context),

                        SizedBox(height: 26),
                        _buildTabview(context),
                        SizedBox(height: 24),
                        _buildTabBarView(context, pd),

                        // ProjectDetailsScreen(
                        //     projectDetails: ProjectDetails(
                        //         description: "description",
                        //         techstack: ["techstack"],
                        //         eligiblityCriteria: "eligiblityCriteria",
                        //         roles: ["roles"],
                        //         ssrDocIpfs: "ssrDocIpfs")),
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
        text: " Details",
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
  Widget _buildTabBarView(BuildContext context, ProjectDetails details) {
    return Container(
        // margin: EdgeInsets.only(top: 419),
        height: 269,
        child: TabBarView(
          controller: tabviewController,
          children: [
            JobDetailsPage("Project Description", details.description),
            JobDetailsPage(
                "Candidate Requirements", details.eligiblityCriteria),
            JobDetailsPage("Roles", details.roles.join("\n")),
          ],
        ));
  }

  /// Section Widget
  Widget _buildCardanoOne(BuildContext context) {
    final techs = widget.project.projectType.split(",");
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
            widget.project.title,
            style: CustomTextStyles.titleSmallBold,
          ),
          SizedBox(height: 7),
          Text(
            widget.project.shortDescription,
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 12),
          Container(
            height: context.screenHeight * 0.07,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: techs.length,
                itemBuilder: (c, i) => FramefiveItemWidget(techs[i])),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildJobDetailsTabContainer(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        JobdetailstabcontainerItemWidget(
          s: "Budget",
          v: "${EtherAmount.inWei(widget.project.deposit).getValueInUnit(EtherUnit.ether)}\t eth",
          image: ImageConstant.imgBag,
        ),
        JobdetailstabcontainerItemWidget(
            s: "Dealine",
            v: DateTime.fromMillisecondsSinceEpoch(
                    widget.project.deadline.toInt())
                .format("dd-MM-yy")
                .toString(),
            image: ImageConstant.imgCalendar),
        JobdetailstabcontainerItemWidget(
          s: "Applied",
          v: 5.toString(),
          image: ImageConstant.imgPlus,
        )
      ],
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

  void loadProjectDetails(BigInt id) async {
    var rd = await widget.contract.getProjectDetails(id);
    debugPrint("rd:" + rd.toString());
    setState(() {
      pd = ProjectDetails.fromBlockchain(rd[0]);
    });
  }
}
