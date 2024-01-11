import 'package:flutter/material.dart';

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
        onPressed: () {},
        icon: const Icon(Icons.create_rounded),
        label: const Text("Create Project"),
      ),
    );
  }
}
