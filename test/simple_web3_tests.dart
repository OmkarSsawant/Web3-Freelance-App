import 'package:test/test.dart';
import 'package:web3_freelancer/data/model/project.dart';
import 'package:web3_freelancer/data/model/project_details.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';

Future createDumpProjects(FreelanceContractClient contract) async {
  for (var i = 0; i < 7; i++) {
    await contract.createProject(
        projectOwnerCred.address,
        "Project Web$i",
        "ipfs://ssrdocIpfs",
        "flutter$i",
        DateTime.now().add(const Duration(days: 2)).millisecondsSinceEpoch.big,
        BigInt.from(100000000000000000));
    await contract.addProjectDetails(i.big, "description$i", ["techStack"],
        "ssrdocIPFS$i", "eligibilityCriteria$i", ["roles"]);
  }
}

void main() async {
  final FreelanceContractClient contract = FreelanceContractClient();

  var txn = await createDumpProjects(contract);
  print(txn);
  var ps = (await contract.getProjects()).map(Project.fromBlockchain).toList();
  var pds = ps.map((p) async =>
      ProjectDetails.fromBlockchain(await contract.getProjectDetails(p.id)));

  print(ps);
  print(pds);
}
