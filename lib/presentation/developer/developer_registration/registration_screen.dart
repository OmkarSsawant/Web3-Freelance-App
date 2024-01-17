import 'dart:io' as io;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ipfs_client_flutter/ipfs_client_flutter.dart';
import 'package:provider/provider.dart';
import 'package:web3_freelancer/firestore_data/FirestoreSaver.dart';
import 'package:web3_freelancer/presentation/developer/home_page/home_page.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';
import 'package:web3modal_flutter/services/w3m_service/w3m_service.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class DevRegistrationScreen extends StatefulWidget {
  const DevRegistrationScreen({super.key});

  @override
  State<DevRegistrationScreen> createState() => _DevRegistrationScreenState();
}

class _DevRegistrationScreenState extends State<DevRegistrationScreen> {
  String devID = "0xcurrent_user999";
  bool fileReqUploaded = true;
  final TextEditingController _nameEC = TextEditingController(),
      _techStacksEC = TextEditingController(),
      _professionEC = TextEditingController();
  final ScaffoldMessengerState _messengerState = ScaffoldMessengerState();
  String? profilePhotoIPFS;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Developer"),
      ),
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Name,Photo,Techstacks,Profession
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)),
                      hintText: "Ram",
                      labelText: "Name",
                      prefixIcon: const Icon(Icons.person)),
                  autocorrect: false,
                  controller: _nameEC,
                  keyboardType: TextInputType.name,
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
                      hintText: "Blockchain Developer @CoinDCX",
                      labelText: "Profession",
                      helperText: "It's Ideal to keep the format same",
                      prefixIcon: const Icon(Icons.work)),
                  autocorrect: false,
                  controller: _professionEC,
                ),
              ),
              const SizedBox(
                height: 20,
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
                      // var r = await context.read<IpfsClient>().write(
                      //     dir:
                      //         "dev-profile_pics/${creds.address.hex}-${result.files.first.name}",
                      //     filePath: path,
                      //     fileName:
                      //         "${creds.address.hex}-${result.files.first.name}");
                    }
                  },
                  icon: const Icon(Icons.file_upload),
                  label: const Text(" Upload Profile Pic  ")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)),
                      hintText: "react,nodejs,aws",
                      labelText: "Techstack",
                      helperText: "Stacks should be seperated by comma (max:4)",
                      prefixIcon: const Icon(Icons.code)),
                  controller: _techStacksEC,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () => _register(context),
                  icon: const Icon(Icons.app_registration_outlined),
                  label: const Text("Register"))
            ],
          ),
        ),
      ),
    );
  }

  void _register(BuildContext context) async {
    if (fileReqUploaded) {
      final contract = context.read<FreelanceContractClient>();
      final s = context.read<W3MService>();

      var txn = await contract.registerDeveloper(
          s.web3App as Web3App,
          s.session!,
          _nameEC.text,
          profilePhotoIPFS ?? "TODO",
          _techStacksEC.text.trim().split(','),
          _professionEC.text);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registered at Txn $txn")));
      await Future.delayed(Durations.short2);
      Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomePage()));
    }
  }
}
