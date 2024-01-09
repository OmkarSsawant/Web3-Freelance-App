import 'package:flutter/material.dart';
import 'package:web3_freelancer/ui/components/project_tile.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opportunities"),
        leading: const Icon(Icons.star),
      ),
      body: Column(children: [
        Container(
          color: Colors.yellow,
          height: MediaQuery.of(context).size.height * 0.1,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (c, i) => Padding(
              padding: EdgeInsets.all(5),
              child: Chip(label: Text("Chip:$i")),
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 15,
          itemBuilder: (c, i) => Padding(
            padding: EdgeInsets.all(5),
            child: ProjectTile(
              deadline: "2-3 weeks",
              domains: ["web", "android"],
              postDate: "Posted 2 days ago",
              priceRange: "5000-10000",
              projectTitle: "Web3 Freelance",
              subtext: "change the way you perceive world",
            ),
          ),
        ))
      ]),
    );
  }
}
