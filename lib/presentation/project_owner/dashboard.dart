import 'package:flutter/material.dart';
import 'package:web3_freelancer/presentation/project_owner/project_create.dart';

class OwnerDashboard extends StatefulWidget {
  const OwnerDashboard({super.key});

  @override
  State<OwnerDashboard> createState() => _OwnerDashboardState();
}

class _OwnerDashboardState extends State<OwnerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: const Text("Dashboard of Owner")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (c) => CreateProjectScree()));
        },
        icon: const Icon(Icons.create_rounded),
        label: const Text("Create Project"),
      ),
    );
  }
}
