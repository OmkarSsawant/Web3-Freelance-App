class Bid {
  final String owner;
  final BigInt projectId;
  final BigInt amount;
  final String propsal;
  final List<String> attachments;

  Bid(
      {required this.owner,
      required this.projectId,
      required this.amount,
      required this.propsal,
      required this.attachments});

  factory Bid.fromValues(String owner, BigInt projectId, BigInt amount,
      String propsal, List<String> attachments) {
    return Bid(
        owner: owner,
        projectId: projectId,
        amount: amount,
        propsal: propsal,
        attachments: attachments);
  }

  Map<String, dynamic> toJson() => {
        "owner": owner,
        "projectId": projectId,
        "amount": amount,
        "propsal": propsal,
        "attachments": attachments
      };
}
