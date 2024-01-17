import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ipfs_client_flutter/ipfs_client_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as ul;
import 'package:web3_freelancer/firestore_data/FirestoreSaver.dart';
import 'package:web3_freelancer/presentation/common/chat_screen.dart';
import 'package:web3_freelancer/presentation/common/project_status_screen.dart';
import 'package:web3_freelancer/presentation/developer/developer_registration/registration_screen.dart';
import 'package:web3_freelancer/presentation/developer/home_page/home_page.dart';
import 'package:web3_freelancer/presentation/project_owner/owner_profile.dart';
import 'package:web3_freelancer/presentation/project_owner/project_lister.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3modal_flutter/services/w3m_service/w3m_service.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import 'package:web3modal_flutter/widgets/web3modal.dart';

import 'firebase_options.dart';

const projectId = "369940517e9ba400824f09472c6c15e6";
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
  late FreelanceContractClient contract;
  late W3MService _web3Service;

  Future<bool> initWeb3WalletConnect() async {
    const meta = const PairingMetadata(
      name: 'Web3Freelancer',
      description: 'Web3Modal Flutter SignIn',
      url: 'https://www.walletconnect.com/',
      icons: ['https://walletconnect.com/walletconnect-logo.png'],
      redirect: Redirect(
        native: 'web3freelancer://',
        universal: 'https://www.walletconnect.com',
      ),
    );
    final dapp = await Web3App.createInstance(
      projectId: projectId,
      metadata: meta,
    );

    _web3Service = W3MService(
      projectId: projectId,
      web3App: dapp,
      metadata: meta,
    );
    W3MChainPresets.chains.putIfAbsent(
        "31337",
        () => W3MChainInfo(
              chainName: 'Hardhat',
              namespace: 'eip155:1',
              chainId: '31337',
              tokenName: 'ETH',
              rpcUrl: apiUrl,
            ));

    await _web3Service.init();

    contract = FreelanceContractClient(dapp);
//     var resp = await contract.approveMethods();
//     Uri? uri = resp.uri;
//     if(uri!=null){
//       await ul.launchUrl(uri);
//
// // Once you've display the URI, you can wait for the future, and hide the QR code once you've received session data
//       final SessionData session = await resp.session.future;
//       debugPrint("session:${session}");
//     }

    await contract.initContractAndFunctions();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (ctx) => contract),
          Provider(create: (ctx) => FirestoreSaver()),
          Provider(create: (ctx) => IpfsClient()),
          ListenableProvider(create: (ctx) => _web3Service),
        ],
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Web3 Freelancer',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
                useMaterial3: true,
              ),
              home: FutureBuilder(
                  future: initWeb3WalletConnect(),
                  builder: (c, s) {
                    if (!s.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return TempGateway(_web3Service);
                  }),
            ));
  }
}

class TempGateway extends StatelessWidget {
  final W3MService web3service;
  TempGateway(this.web3service, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Role"),
        actions: [W3MConnectWalletButton(service: web3service)],
      ),
      body: SizedBox(
        width: context.screenWidth,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FilledButton(
                  onPressed: () async {
                    final dev = await context
                        .read<FreelanceContractClient>()
                        .isDevRegistered();
                    debugPrint("${web3service.address!} : $dev");

                    if (web3service.isConnected) {
                      if (!dev)
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DevRegistrationScreen()));
                      else
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                    }
                  },
                  child: const Text("Find Work")),
              FilledButton(
                  onPressed: () async {
                    final po = await context
                        .read<FreelanceContractClient>()
                        .isPORegistered();
                    debugPrint("${web3service.address!} : $po");

                    if (web3service.isConnected) {
                      if (!po)
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OwnerRegistrationScreen()));
                      else
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OwnerProjectsScreen()));
                    }
                  },
                  child: const Text("Upload Project")),
            ]),
      ),
    );
  }
}
