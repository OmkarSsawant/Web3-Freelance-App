import 'dart:async';
import 'dart:math';

import 'package:provider/provider.dart';
import 'package:web3_freelancer/data/model/bid.dart';
import 'package:web3_freelancer/data/model/project.dart';
import 'package:web3_freelancer/data/model/project_details.dart';
import 'package:web3_freelancer/firestore_data/FirestoreSaver.dart';
import 'package:web3_freelancer/presentation/developer/project_details_page/job_details_tab_container_screen/job_details_tab_container_screen.dart';
import 'package:web3_freelancer/presentation/project_owner/bid_chooser.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3modal_flutter/services/w3m_service/w3m_service.dart';

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

// Future createDumpProjects(FreelanceContractClient contract) async {
//   for (var i = 0; i < 7; i++) {
//     await contract.createProject(
//         projectOwnerCred.address,
//         "Project Web$i",
//         "A best Project",
//         "flutter$i",
//         DateTime.now().add(const Duration(days: 2)).millisecondsSinceEpoch.big,
//         BigInt.from(100000000000000000));
//     await contract.addProjectDetails(i.big, "description$i", ["techStack"],
//         "ssrdocIPFS$i", "eligibilityCriteria$i", ["roles"]);
//   }
// }

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key? key})
      : super(
          key: key,
        );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<Project> projects = [], onGoing = [];
  final _sc = StreamController<List<Project>>();
  StreamSink<List<Project>>? get  _projectSink => _sc.sink;
  Stream<List<Project>> get _projectStream => _sc.stream;
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
                    onChanged: (q){
                      var reg = RegExp(".*$q.*");

                      _projectSink?.add(projects.where((element) =>
                          reg.hasMatch(element.title)).toList());
                      },
                    onClear: (){
                      _projectSink?.add(projects);
                    },

                  ),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  "Ongoing Projects",
                  style: CustomTextStyles.titleMedium18,
                ),
              ),
              SizedBox(height: 7),
              _buildFrame(context),
              SizedBox(height: 7),
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
        IconButton(
          icon: const Icon(Icons.notification_important_rounded),
          onPressed: () {
            _showApprovedBids(context);
          },

        ),
      ],
    );
  }

  void _showApprovedBids(BuildContext context) {
     final store = context.read<FirestoreSaver>();
    final contract = context.read<FreelanceContractClient>();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BidChoosingScreen(
            onTap: (context, FirestoreSaver store, Bid bid) async {
              var dev = EthereumAddress.fromHex(bid.bidder!);
              debugPrint("dev: $dev");
              final w3service  = context.read<W3MService>();
              var txn = await contract.finalizeProjectBid(
                  w3service,
                  BigInt.from(double.parse(bid.amount) * pow(10, 18)),
                  bid.projectId,
                  bid.proposal,
                  bid.attachments,
                  dev);
              var agreement = "I agree to develop project ${bid.projectId} with a total amount of ${bid.amount} ";
              await contract.sign(w3service, agreement);
              //Update Bid From Firestore
              await store.signBid(bid);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      "Project Contract Finalized $txn .Kindly check the chat screen")));
              debugPrint(txn);
              await Future.delayed(Durations.extralong4);
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            bidsFuture: store.getApprovedBidsOfDev(
                context.read<W3MService>().address!),
            btnText: "Agree & Confirm")));
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    debugPrint(onGoing.toString());
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: context.screenHeight * 0.3,
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
          itemCount: onGoing.length,
          itemBuilder: (context, index) {
            return ProjectRecommendationTileWidget(
              project: onGoing[index],
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEightyEight(BuildContext context) {
    final contract = context.read<FreelanceContractClient>();
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
                      project: projects[index],
                      contract: contract,
                    ),
                  ));
                },
                child: ProjectTileWidget(
                  project: projects[index],
                  onTap: projects[index].finalizedBid?.amount == "0"
                      ? () async {
                          var success =
                              await showPlaceBid(context, projects[index]);
                          if (success != null && success) {
                            load();
                          }
                        }
                      : null,
                  btnText: projects[index].finalizedBid?.amount == "0"
                      ? "Bid"
                      : "Assigned",
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void load() async {
    final contract = context.read<FreelanceContractClient>();

    // await Future.delayed(Duration(seconds: 5)); //time to intialize contract
    // await createDumpProjects(contract);
    // debugPrint("Added Projects.");
    // await Future.delayed(Duration(seconds: 5)); //time to intialize contract
    try {
      contract.getProjects().then((value) {
        if (value[0].isEmpty) return;
        debugPrint(value[0][0].toString());
        projects = value[0].map<Project>(Project.fromBlockchain).toList();
        onGoing = projects
            .where((it) =>
                it.finalizedBid != null &&
                it.finalizedBid?.bidder == context.read<W3MService>().address!)
            .toList();
        setState(() {});

        for (var e in projects) {
          debugPrint("test${e.finalizedBid?.toJson().toString()}");
        }
        var pds = projects
            .map((p) async => ProjectDetails.fromBlockchain(
                (await contract.getProjectDetails(p.id))[0]))
            .toList();
        debugPrint(pds.toString());
      });
    } catch (e) {
      debugPrint("No Projects Yet");
    }
  }

  @override
  void dispose() {
    _sc.close();
    super.dispose();
  }
}
