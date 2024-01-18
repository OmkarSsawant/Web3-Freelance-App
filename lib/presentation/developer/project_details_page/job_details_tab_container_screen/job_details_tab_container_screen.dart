import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3_freelancer/data/model/bid.dart';
import 'package:web3_freelancer/data/model/project.dart';
import 'package:web3_freelancer/data/model/project_details.dart';
import 'package:web3_freelancer/firestore_data/FirestoreSaver.dart';
import 'package:web3_freelancer/presentation/developer/job_details_page/job_details_page.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3modal_flutter/services/w3m_service/w3m_service.dart';

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
  Future<bool> hasBidded(BuildContext context) async {
    final sp = await SharedPreferences.getInstance();

    final pk = "web3freelancer.onetime.${widget.project.id}.bidded";
    if (!sp.containsKey(pk)) {
      //have not checked bid status even one's
      var read = context.read<FirestoreSaver>();
      bool isBidded = await read.isBiddedBy(widget.project, "0xcurrentuerdev");
      await sp.setBool(pk, isBidded);
      return isBidded;
    }
    return sp.getBool(pk) ?? false;
  }

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
    loadProjectDetails(widget.project.id);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.read<FreelanceContractClient>();
    debugPrint(c.toString());
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
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FutureBuilder(
            future: hasBidded(context),
            builder: (context, snap) {
              final disabled =
                  (!snap.hasData || (snap.data != null && snap.data!));

              return FloatingActionButton.extended(
                  icon: const Icon(Icons.how_to_vote_sharp),
                  onPressed: disabled
                      ? null
                      : () => showPlaceBid(context, widget.project),
                  label: const Text("Place Bid"));
            }),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 48,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back)),
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
          image: "assets/images/eth.svg",
        ),
        JobdetailstabcontainerItemWidget(
            s: "Deadline",
            v: DateTime.fromMillisecondsSinceEpoch(
                    widget.project.deadline.toInt())
                .format("dd-MM-yy")
                .toString(),
            image: null,
        icon:const Icon(Icons.calendar_month)),
        FutureBuilder(
            future: context.read<FirestoreSaver>().biddersCount(widget.project),
            builder: (context, snap) {
              return JobdetailstabcontainerItemWidget(
                s: "Applied",
                v: !snap.hasData ? "0" : snap.data!.toString(),
                image: null,
                  icon:const Icon(Icons.how_to_vote));
            })
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

Future<bool?> showPlaceBid(BuildContext context, Project project) async {
  final store = context.read<FirestoreSaver>();
  final _editTextCtlr = TextEditingController();
  final _editTextPropsal = TextEditingController();
  bool fileReqUploaded = true;
  final attachments = <String>[];
  return await showModalBottomSheet<bool?>(
      context: context,
      builder: (context) {
        return SizedBox(
          height: context.screenHeight * .57,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)),
                      hintText: "0.01",
                      labelText: "Amount",
                      helperText: "Amount should be in eth",
                      prefixIcon:  SvgPicture.asset("assets/images/eth.svg",width: 20,)),
                  autocorrect: false,
                  controller: _editTextCtlr,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)),
                    hintText: "Write why you are a good fit for this project",
                    labelText: "Proposal",
                  ),
                  autocorrect: false,
                  controller: _editTextPropsal,
                  minLines: 4,
                  maxLines: 10,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton.icon(
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(
                            allowMultiple: false,
                            type: FileType.custom,
                            allowedExtensions: ['.pdf', '.doc', 'docx']);
                    if (result != null && result.files.first.bytes != null) {
                      fileReqUploaded = false;
                      store
                          .uploadProposal(result.files.first.bytes!, project.id,
                              "0xmyaddressofdev999")
                          .whenComplete(() => fileReqUploaded = true);
                    }
                  },
                  icon: const Icon(Icons.file_upload),
                  label: const Text(" Upload Proposal  ")),
              ElevatedButton(
                  onPressed: () async {
                    if (fileReqUploaded) {
                      final p = project;
                      final amt = _editTextCtlr.value.text.trim();

                      final bid = Bid(
                          owner: p.owner,
                          projectId: p.id,
                          amount: amt,
                          proposal: _editTextPropsal.text,
                          attachments: attachments);
                      try {
                        debugPrint("Placing Bid");
                        await store.placeBid(bid,context.read<W3MService>().address!);
                        Navigator.of(context).pop(true);
                        await showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                child: Center(
                                  child: Text("Successfully Placed Bid"),
                                ),
                              );
                            });
                      } catch (e) {
                        await showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                child: Center(
                                  child: Text(e.toString()),
                                ),
                              );
                            });
                      }
                    } else {}
                  },
                  child: const Text("Confirm Bid"))
            ],
          ),
        );
      });
}
