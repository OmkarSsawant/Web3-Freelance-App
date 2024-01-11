import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3_freelancer/data/model/project_details.dart';
import 'package:web3_freelancer/firestore_data/FirestoreSaver.dart';
import 'package:web3_freelancer/presentation/developer/developer_registration/registration_screen.dart';
import 'package:web3_freelancer/presentation/project_owner/dashboard.dart';
import 'package:web3_freelancer/presentation/project_owner/owner_profile.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';
import 'package:web3dart/web3dart.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FreelanceContractClient contract;
  @override
  void initState() {
    super.initState();
    contract = FreelanceContractClient();
    // testConnections();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (ctx) => contract),
          Provider(create: (ctx) => FirestoreSaver())
        ],
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: FutureBuilder(
                  future: contract.initContractAndFunctions(),
                  builder: (c, s) {
                    if (!s.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return OwnerDashboard();
                  }),
            ));
  }
}
