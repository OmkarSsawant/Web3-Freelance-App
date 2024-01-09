import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:web3_freelancer/ui/dashboard.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProjectsScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var _fcontract = ProjectOwnerClient();
//   // double _balance = -1;
//   String _name = "";
//   void _incrementCounter() async {
//     // double b = await _fcontract.checkBalance();
//     // var name = await _fcontract.registerProjectOwner(
//     //     "Sultan",
//     //     "sultan@bolly.com",
//     //     9876543210,
//     //     "ipfs://licence_doc",
//     //     "visionDev",
//     //     "visionDev.com",
//     //     1,
//     //     "ipfs://profile_photo");
//     // print(name);
//     await _fcontract.createProject(
//         projectOwnerCred.address,
//         "Project Web3",
//         "ipfs://ssrdocIpfs",
//         "web",
//         DateTime.now().add(const Duration(days: 2)).millisecond.big,
//         BigInt.from(100000000000000000));
//     // var name = await _fcontract.finalizeProjectBid(
//     //     BigInt.from(10000000000000000),
//     //     BigInt.zero,
//     //     "I gaurantee you ",
//     //     [],
//     //     creds.address);
//     var name = await _fcontract.updateProjectStaus(1);

//     setState(() {
//       // _balance = b;
//       _name = name.toString();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_name',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
