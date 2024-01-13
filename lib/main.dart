import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3_freelancer/data/model/project_details.dart';
import 'package:web3_freelancer/firestore_data/FirestoreSaver.dart';
import 'package:web3_freelancer/presentation/common/project_status_screen.dart';
import 'package:web3_freelancer/presentation/developer/developer_registration/registration_screen.dart';
import 'package:web3_freelancer/presentation/developer/home_page/home_page.dart';
import 'package:web3_freelancer/presentation/project_owner/owner_profile.dart';
import 'package:web3_freelancer/presentation/project_owner/project_lister.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';
import 'package:web3dart/web3dart.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseFirestore.instance.settings = Settings(
  //   persistenceEnabled: false, // Set to true if you want offline persistence
  //   cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  // );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late FreelanceContractClient contract;
  @override
  void initState() {
    super.initState();
    // contract = FreelanceContractClient();
    // testConnections();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // Provider(create: (ctx) => contract),
          Provider(create: (ctx) => FirestoreSaver())
        ],
        builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Web3 Freelancer',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
              useMaterial3: true,
            ),
            home:
                // FutureBuilder(
                //     future: contract.initContractAndFunctions(),
                //     builder: (c, s) {
                //       if (!s.hasData) {
                //         return const Center(
                //           child: CircularProgressIndicator(),
                //         );
                //       }

                ProjectStatusScreen(
              isOwner: false,
            )
            // }),
            ));
  }
}

class TempGateway extends StatelessWidget {
  const TempGateway({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Role"),
      ),
      body: SizedBox(
        width: context.screenWidth,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: const Text("Find Work")),
              FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OwnerProjectsScreen()));
                  },
                  child: const Text("Upload Project")),
            ]),
      ),
    );
  }
}
