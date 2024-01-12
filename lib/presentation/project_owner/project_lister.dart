import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3_freelancer/data/model/project.dart';
import 'package:web3_freelancer/firestore_data/FirestoreSaver.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';

class OwnerProjectsScreen extends StatefulWidget {
  const OwnerProjectsScreen({super.key});

  @override
  State<OwnerProjectsScreen> createState() => _OwnerProjectsScreenState();
}

class _OwnerProjectsScreenState extends State<OwnerProjectsScreen> {
  List<Project> _allProjects = [];
  List<Project> _approvedProjects = [];
  List<Project> _pendingProjects = [];

  @override
  void initState() {
    loadProjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void loadProjects() async {
    final contract = context.read<FreelanceContractClient>();
    final store = context.read<FirestoreSaver>();
    var ps = (await contract.getProjectsOfOwner(projectOwnerCred.address))[0];
    setState(() {
      _allProjects = List.from(ps).map(Project.fromBlockchain).toList();
    });
    var ppIds =
        await store.getPendingProjectIdsOfOwner(projectOwnerCred.address.hex);
    var apIds =
        await store.getApprovedProjectIdsOfOwner(projectOwnerCred.address.hex);
    setState(() {
      _pendingProjects =
          _allProjects.where((p) => ppIds.contains(p.id)).toList();
      _approvedProjects =
          _allProjects.where((p) => apIds.contains(p.id)).toList();
    });
  }
}
