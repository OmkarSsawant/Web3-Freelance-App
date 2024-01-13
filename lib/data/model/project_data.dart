class ProjectData {
  String title;
  String projectType;
  BigInt deadline;
  BigInt depositBudget;
  String shortDesc;
  String description;
  List<String> techStack;
  String ssrdocIpfs;
  String eligibilityCriteria;
  List<String> roles;
  List<String> works;
  List<BigInt> pays;

  ProjectData({
    required this.title,
    required this.projectType,
    required this.deadline,
    required this.depositBudget,
    required this.shortDesc,
    required this.description,
    required this.techStack,
    required this.ssrdocIpfs,
    required this.eligibilityCriteria,
    required this.roles,
    required this.works,
    required this.pays,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'project_type': projectType,
      'deadline': deadline,
      'deposit_budget': depositBudget,
      'short_desc': shortDesc,
      'description': description,
      'techstack': techStack,
      'ssrdoc_ipfs': ssrdocIpfs,
      'eligibility_criteria': eligibilityCriteria,
      'roles': roles,
      'works': works,
      'pays': pays,
    };
  }
}
