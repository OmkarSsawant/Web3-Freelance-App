class Bid {
  final String owner;
  final BigInt projectId;
  final String amount;
  final String proposal;
  final List<String> attachments;
  final String? bidder;
  Bid(
      {required this.owner,
      required this.projectId,
      required this.amount,
      required this.proposal,
      this.bidder,
      required this.attachments});

  factory Bid.fromValues(String owner, String projectId, String amount,
      String propsal, List<String> attachments) {
    return Bid(
        owner: owner,
        projectId: BigInt.parse(projectId),
        amount: amount,
        proposal: propsal,
        attachments: attachments);
  }

  Map<String, dynamic> toJson() => {
        "owner": owner,
        "projectId": projectId.toString(),
        "amount": amount,
        "propsal": proposal,
        "attachments": attachments,
        "bidder": bidder
      };

  factory Bid.fromFS(Map<String, dynamic> data, String bidder) {
    return Bid(
        owner: data["owner"].toString(),
        projectId: BigInt.parse(data["projectId"]),
        amount: data["amount"].toString(),
        proposal: data["propsal"].toString(),
        bidder: bidder,
        attachments: data["attachments"]);
  }
}
