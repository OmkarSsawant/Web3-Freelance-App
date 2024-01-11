import 'package:flutter/foundation.dart';
import 'package:web3_freelancer/utils.dart';

class ProjectDetails {
  final String description;
  final List<String> techstack;
  final String eligiblityCriteria;
  final List<String> roles;
  final String ssrDocIpfs;

  factory ProjectDetails.fromBlockchain(dynamic m) {
    return ProjectDetails(
        description: m[0].toString(),
        techstack: (m[1] as List)
            .map<String>((e) => Uint8List.fromList(e).string)
            .toList(),
        eligiblityCriteria: m[2],
        roles: (m[3] as List).map<String>((e) => e).toList(),
        ssrDocIpfs: Uint8List.fromList(m[4]).string);
  }

  ProjectDetails(
      {required this.description,
      required this.techstack,
      required this.eligiblityCriteria,
      required this.roles,
      required this.ssrDocIpfs});
}
