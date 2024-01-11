import 'dart:typed_data';

import 'package:web3_freelancer/utils.dart';

class Project {
  final BigInt id;
  final String owner;
  final String title;
  final String projectType;
  final BigInt deadline;
  final BigInt deposit;
  final String shortDescription;
  factory Project.fromBlockchain(dynamic m) {
    return Project(
        id: m[0],
        owner: m[1].toString(),
        title: Uint8List.fromList(m[2]).string,
        projectType: Uint8List.fromList(m[4]).string,
        deadline: m[5],
        deposit: m[6],
        shortDescription: m[7]);
  }

  Project(
      {required this.id,
      required this.owner,
      required this.title,
      required this.projectType,
      required this.deadline,
      required this.deposit,
      required this.shortDescription});

  static Project get sample => Project(
      id: 99.big,
      deadline: DateTime.now().millisecond.big,
      owner: "0xsdfdfdvdvffvfvb555dd",
      deposit: 1.big,
      projectType: "web",
      title: "Web3 Freelance App",
      shortDescription: "A Decentralized Freelance Platform");
}
