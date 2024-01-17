import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3_freelancer/firestore_data/FirestoreSaver.dart';
import 'package:web3_freelancer/presentation/developer/home_page/home_page.dart';
import 'package:web3_freelancer/presentation/project_owner/project_lister.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';

class OwnerRegistrationScreen extends StatefulWidget {
  const OwnerRegistrationScreen({super.key});

  @override
  State<OwnerRegistrationScreen> createState() =>
      _OwnerRegistrationScreenState();
}

class _OwnerRegistrationScreenState extends State<OwnerRegistrationScreen> {
  bool fileReqUploaded = true;

  final TextEditingController _nameEC = TextEditingController(),
      _comEC = TextEditingController(),
      _phnEC = TextEditingController(),
      _emailEC = TextEditingController(),
      _comTypeEC = TextEditingController(),
      _urlEC = TextEditingController();
  final ScaffoldMessengerState _messengerState = ScaffoldMessengerState();
  String? profilePhotoIPFS, licenseDocIPFS;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Owner"),
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
                      hintText: "CoinDCX",
                      labelText: "Company Name",
                      prefixIcon: const Icon(Icons.workspace_premium)),
                  autocorrect: false,
                  controller: _comEC,
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
                    }
                  },
                  icon: const Icon(Icons.approval),
                  label: const Text(" Upload License  ")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)),
                      hintText: "john@coindcx.com",
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.mail)),
                  controller: _emailEC,
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
                      hintText: "9188929290",
                      labelText: "Phone",
                      prefixIcon: const Icon(Icons.phone)),
                  controller: _phnEC,
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
                      hintText: "Startup,Multi-Com,Com,Unicorn",
                      labelText: "Company Type",
                      prefixIcon: const Icon(Icons.stairs)),
                  controller: _comTypeEC,
                ),
              ),
              const SizedBox(
                height: 20,
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
                      hintText: "https://www.google.com",
                      labelText: "Company Url",
                      prefixIcon: const Icon(Icons.web)),
                  controller: _urlEC,
                ),
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
      var txn = contract.registerProjectOwner(
          _nameEC.text,
          _emailEC.text,
          BigInt.parse(_phnEC.text),
          licenseDocIPFS ?? "TODO",
          _comEC.text,
          _urlEC.text,
          0, //TODO
          profilePhotoIPFS ?? "TODO");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registered at Txn $txn")));
      await Future.delayed(Durations.short2);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (c) => OwnerProjectsScreen()));
    }
  }
}
