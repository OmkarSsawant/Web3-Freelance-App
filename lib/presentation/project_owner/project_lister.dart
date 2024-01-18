import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3_freelancer/data/model/bid.dart';
import 'package:web3_freelancer/data/model/project.dart';
import 'package:web3_freelancer/firestore_data/FirestoreSaver.dart';
import 'package:web3_freelancer/presentation/common/empty_list.dart';
import 'package:web3_freelancer/presentation/common/project_status_screen.dart';
import 'package:web3_freelancer/presentation/developer/home_page/widgets/project_tile.dart';
import 'package:web3_freelancer/presentation/project_owner/bid_chooser.dart';
import 'package:web3_freelancer/presentation/project_owner/project_create.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';
import 'package:web3modal_flutter/services/w3m_service/w3m_service.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class OwnerProjectsScreen extends StatefulWidget {
  const OwnerProjectsScreen({super.key});

  @override
  State<OwnerProjectsScreen> createState() => _OwnerProjectsScreenState();
}

class _OwnerProjectsScreenState extends State<OwnerProjectsScreen>
    with SingleTickerProviderStateMixin {
  List<Project> _notBiddedProjects = [];
  List<Project> _approvedProjects = [];
  List<Project> _pendingProjects = [];
  List<Bid> _allPendingBid = [];
  List<Bid> _allApprovedBid = [];
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    loadProjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    W3MService web3Service = context.read();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Dashboard"),
        bottom: TabBar(
            controller: _tabController,
            onTap: (ti) {
              _tabController.animateTo(ti);
            },
            tabs: ["Approved", "Pending", "UnBided"]
                .map((e) => Tab(
                      text: e,
                    ))
                .toList()),
        actions: [
          W3MAccountButton(service: web3Service,avatar: web3Service.tokenImageUrl,),
          W3MConnectWalletButton(service: web3Service,),
        ],
      ),
      body: TabBarView(controller: _tabController, children: [
        ProjectsViewer(
            showChat: true,
            projects: _approvedProjects,
            onTap: (p) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProjectStatusScreen(
                      isOwner: context.read<W3MService>().address == p.owner,
                      projectId: p.id)));
            },
            btnText: "Update Status"),
        ProjectsViewer(
            projects: _pendingProjects,
            onTap: (project) {
              final store = context.read<FirestoreSaver>();

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BidChoosingScreen(
                        bidsFuture: store.getPendingBids(project),
                        onTap: _chooseBid,
                        btnText: "Confirm Bid",
                      )));
            },
            btnText: "Request Pending"),
        ProjectsViewer(
            projects: _notBiddedProjects, onTap: null, btnText: "Unbided"),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (c) => CreateProjectScree()));
          loadProjects();
        },
        icon: const Icon(Icons.create_rounded),
        label: const Text("Create Project"),
      ),
    );
  }

  _chooseBid(BuildContext context, FirestoreSaver store, Bid b) async {
    final w3Service = context.read<W3MService>();
    await store.approveBid(b, w3Service.address!);
    var agreement =
        "I agree to developer to give my project ${b.projectId} with a total amount of ${b.amount} payment";
    await context.read<FreelanceContractClient>().sign(w3Service, agreement);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Bid Approved for ${b.bidder}")));
    await Future.delayed(Durations.extralong4);
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void loadProjects() async {
    final contract = context.read<FreelanceContractClient>();
    final store = context.read<FirestoreSaver>();
    String address=context.read<W3MService>().address!;
    var ps = (await contract.getProjectsOfOwner(EthereumAddress.fromHex(address)))[0];
    var allProjects = List.from(ps).map(Project.fromBlockchain).toList();
    debugPrint(allProjects.toString());
    _allPendingBid =
        await store.getAllPendingBidsOfOwner(address);
    _allApprovedBid =
        await store.getAllApprovedBidsOfOwner(address);
    var apIds = _allApprovedBid.map((e) => e.projectId).toList();
    var ppIds = _allPendingBid.map((e) => e.projectId).toList();
    debugPrint(apIds.toString());
    debugPrint(ppIds.toString());
    setState(() {
      _pendingProjects =
          allProjects.where((p) => ppIds.contains(p.id)).toList();
      _approvedProjects =
          allProjects.where((p) => apIds.contains(p.id)).toList();
      _notBiddedProjects = allProjects
          .where((p) => ![...ppIds, ...apIds].contains(p.id))
          .toList();
    });
  }
}

class ProjectsViewer extends StatelessWidget {
  final List<Project> projects;
  final Function(Project)? onTap;
  final String btnText;
  final bool showChat;
  ProjectsViewer(
      {super.key,
      required this.projects,
      required this.onTap,
      required this.btnText,
      this.showChat = false});

  @override
  Widget build(BuildContext context) {
    return  projects.isNotEmpty ?  SizedBox(
      child: ListView.builder(
        itemBuilder: (context, i) {
          return ProjectTileWidget(
              project: projects[i],
              enableChat: showChat,
              onTap: () => onTap?.call(projects[i]),
              btnText: btnText);
        },
        itemCount: projects.length,
      ),
    ) : EmptyList(text: "No Projects in this Stage");

  }
}
