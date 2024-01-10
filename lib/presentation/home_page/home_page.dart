import 'package:web3_freelancer/data/model/project.dart';
import 'package:web3_freelancer/data/model/project_details.dart';
import 'package:web3_freelancer/presentation/project_details_page/job_details_tab_container_screen/job_details_tab_container_screen.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';

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

Future createDumpProjects(FreelanceContractClient contract) async {
  await contract.createProject(
      projectOwnerCred.address,
      "Project Web3",
      "ipfs://ssrdocIpfs",
      "flutter",
      DateTime.now().add(const Duration(days: 2)).millisecondsSinceEpoch.big,
      BigInt.from(100000000000000000));
  await contract.createProject(
      projectOwnerCred.address,
      "2Project Web3",
      "ipfs://ssrdocIpfs",
      "web",
      DateTime.now().add(const Duration(days: 2)).millisecondsSinceEpoch.big,
      BigInt.from(100000000000000000));
  return await contract.createProject(
      projectOwnerCred.address,
      "3Project Web3",
      "ipfs://ssrdocIpfs",
      "android",
      DateTime.now().add(const Duration(days: 2)).millisecondsSinceEpoch.big,
      BigInt.from(100000000000000000));
}

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  final FreelanceContractClient contractClient;
  HomePage({required this.contractClient, Key? key})
      : super(
          key: key,
        );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<Project> projects = [];

  @override
  void initState() {
    super.initState();

    load();
  }

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
              _buildAppBar(context),
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
              //TODO:Integrate recommendation server           // Padding(
              //   padding: EdgeInsets.only(left: 24),
              //   child: Text(
              //     "Recommendation",
              //     style: CustomTextStyles.titleMedium18,
              //   ),
              // ),
              // SizedBox(height: 17),
              // _buildFrame(context),
              SizedBox(height: 22),
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  "Recent Projects",
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
            return ProjectRecommendationTileWidget(
              project: Project.sample,
            );
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
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ProjectDetailsScreen(
                          projectDetails: ProjectDetails(
                              description: "description",
                              techstack: ["techstack"],
                              eligiblityCriteria: "eligiblityCriteria",
                              roles: ["roles"],
                              ssrDocIpfs: "ssrDocIpfs"))));
                },
                child: ProjectTileWidget(
                  project: projects[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void load() async {
    final contract = widget.contractClient;

    await Future.delayed(Duration(seconds: 5)); //time to intialize contract
    await createDumpProjects(contract);
    debugPrint("Added Projects.");
    // await Future.delayed(Duration(seconds: 5)); //time to intialize contract
    contract.getProjects().then((value) {
      debugPrint(value[0][0].toString());
      projects = value[0].map<Project>(Project.fromBlockchain).toList();
      setState(() {});
    });
  }
}
