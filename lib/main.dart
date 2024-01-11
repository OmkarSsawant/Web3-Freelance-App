import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/data/model/project_details.dart';
import 'package:web3_freelancer/presentation/home_page/home_page.dart';
import 'package:web3_freelancer/presentation/project_details_page/job_details_tab_container_screen/job_details_tab_container_screen.dart';
import 'package:web3_freelancer/ui/dashboard.dart';
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
    return MaterialApp(
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

            return HomePage(contractClient: contract);
          }),
    );
  }
}
