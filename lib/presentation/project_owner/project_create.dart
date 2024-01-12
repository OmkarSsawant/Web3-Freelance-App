import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

class CreateProjectScree extends StatefulWidget {
  const CreateProjectScree({super.key});

  @override
  State<CreateProjectScree> createState() => _CreateProjectScreeState();
}

class _CreateProjectScreeState extends State<CreateProjectScree> {
  //  bytes32 title;
  //       bytes32 project_type;
  //       uint deadline;
  //       uint deposit_budget;
  //       string short_description;
  bool fileReqUploaded = true;

  TextEditingController _titleEC = TextEditingController(),
      _depoBudEC = TextEditingController(),
      _sDescEC = TextEditingController(),
      _longDescEC = TextEditingController(),
      _techstackEC = TextEditingController(),
      _rolesEC = TextEditingController(),
      _eliCriEC = TextEditingController();
  DateTime? deadline;
  String projectType = "web";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        hintText: "Web3 Freelancer",
                        labelText: "Project Title",
                        prefixIcon: const Icon(Icons.title)),
                    controller: _titleEC,
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
                        hintText: "A short description of your app",
                        labelText: "Short Description",
                        prefixIcon: const Icon(Icons.description)),
                    controller: _sDescEC,
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
                      hintText: "0.3",
                      labelText: "Budget",
                      helperText: "Note: It should be in ethers",
                      prefixIcon:
                          SvgPicture.asset("assets/images/eth.svg", width: 20),
                    ),
                    controller: _depoBudEC,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FilledButton.icon(
                    onPressed: () async {
                      deadline = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2090));
                    },
                    icon: const Icon(Icons.calendar_month),
                    label: const Text("Choose Deadline ")),
                DropdownButton(
                    value: projectType,
                    items: [
                      "web",
                      "android",
                      'ios',
                      'mac',
                      'windows',
                      'linux',
                      'backend',
                      'hybrid'
                    ]
                        .map((e) =>
                            DropdownMenuItem(value: e, child: Text("$e")))
                        .toList(),
                    onChanged: (t) {
                      if (t != null) projectType = t;
                      setState(() {});
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        hintText: "Write a Detailed Description of Project",
                        labelText: "Detailed Description",
                        prefixIcon: const Icon(Icons.details)),
                    controller: _longDescEC,
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
                        hintText: "Write Techs used in project",
                        labelText: "Techstack",
                        prefixIcon: const Icon(Icons.computer)),
                    controller: _techstackEC,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FilledButton.icon(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        allowMultiple: false,
                        type: FileType.image,
                      );
                      if (result != null && result.files.first.bytes != null) {
                        fileReqUploaded = false;
                        //Upload Profile Image to IPFS
                      }
                    },
                    icon: const Icon(Icons.approval),
                    label: const Text(" Upload License  ")),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        hintText:
                            "What criteria should candidate have to apply ",
                        labelText: "Eligibility Criteria",
                        prefixIcon: const Icon(Icons.details)),
                    controller: _eliCriEC,
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
                        hintText:
                            "What Roles/Responsibilities  should developer handle",
                        labelText: "Roles[Comma Seperated]",
                        helperText:
                            "Eg:Creation of UI/UX, Backend Development Creation and Deployment",
                        prefixIcon: const Icon(Icons.details)),
                    controller: _rolesEC,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                    onPressed: () => _createProject(context),
                    icon: const Icon(Icons.app_registration_outlined),
                    label: const Text("Register"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _createProject(BuildContext context) async {
    if (fileReqUploaded) {
      final contract = context.read<FreelanceContractClient>();
      var txn = await contract.createProject(
        projectOwnerCred.address,
        _titleEC.text,
        _sDescEC.text,
        projectType,
        deadline!.millisecondsSinceEpoch.big,
        BigInt.from(double.parse(_depoBudEC.text.trim()) * (pow(10, 18))),
      );

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Create Prject by txn $txn")));
      await Future.delayed(Durations.extralong4 * 3);
      Navigator.of(context).pop();
    }
  }
}
