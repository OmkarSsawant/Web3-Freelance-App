import 'dart:typed_data';

import 'package:web3_freelancer/data/model/project.dart';
import 'package:web3_freelancer/utils.dart';

class Bid {
  final String owner;
  final BigInt projectId;
  final String amount;
  final String proposal;
  final List<String> attachments;
  final String? bidder;
  bool signed;
  Bid(
      {required this.owner,
      required this.projectId,
      required this.amount,
      required this.proposal,
      this.bidder,
      this.signed = false,
      required this.attachments});

  factory Bid.fromValues(String owner, String projectId, String amount,
      String propsal, List<String> attachments,
      {bool signed = false}) {
    return Bid(
        owner: owner,
        projectId: BigInt.parse(projectId),
        amount: amount,
        proposal: propsal,
        signed: signed,
        attachments: attachments);
  }

  Map<String, dynamic> toJson() => {
        "owner": owner,
        "projectId": projectId.toString(),
        "amount": amount,
        "propsal": proposal,
        "attachments": attachments,
        "bidder": bidder,
        "signed": signed
      };

  factory Bid.fromFS(Map<String, dynamic> data, String bidder) {
    return Bid(
        owner: data["owner"].toString(),
        projectId: BigInt.parse(data["projectId"]),
        amount: data["amount"].toString(),
        proposal: data["propsal"].toString(),
        bidder: bidder,
        signed: data["signed"],
        attachments:
            data["attachments"].map<String>((e) => e as String).toList());
  }

  static Bid? fromBlockchain(m, String projectOwner, BigInt projectId) {
    if (m[1] == null || m[1].toString().isEmpty) return null;
    return Bid(
        owner: projectOwner,
        projectId: projectId,
        amount: m[0].toString(),
        proposal: m[2].toString(),
        bidder: m[1].toString().isEmpty ? null : m[1].toString(),
        attachments: m[3]
            .map<String>((bytes32) => Uint8List.fromList(bytes32).string)
            .toList());
  }
}
