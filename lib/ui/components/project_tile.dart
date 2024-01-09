import 'package:flutter/material.dart';
import 'package:web3_freelancer/utils.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile(
      {super.key,
      required this.postDate,
      required this.subtext,
      required this.projectTitle,
      required this.domains,
      required this.deadline,
      required this.priceRange});
  final String postDate;
  final String subtext;
  final String projectTitle;
  final List<String> domains;
  final String deadline;
  final String priceRange;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.screenWidth * .9,
        height: context.screenHeight * .35,
        child: Card(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                      onPressed: null,
                      child: Text(
                        postDate,
                        textAlign: TextAlign.center,
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    foregroundImage: AssetImage("assets/images/rideven.jpg"),
                    backgroundColor: Colors.purple,
                  ),
                  SizedBox(
                    width: 23,
                  ),
                  Column(
                    children: [
                      Text(
                        subtext,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        projectTitle,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: context.screenHeight * 0.05,
              child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade400)),
                      child: Text(
                        domains[i],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54),
                      )),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Chip(
                  label: Text(deadline),
                  avatar: const Icon(Icons.timer),
                ),
                Chip(
                  label: Text(priceRange),
                  avatar: const Icon(Icons.currency_rupee_rounded),
                  backgroundColor: Colors.lightBlue.shade100,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey,
                height: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {}, child: const Text("Open Details"))),
                Expanded(
                  child: FilledButton.icon(
                      label: const Text("Bid"),
                      onPressed: () {},
                      icon: const Icon(Icons.money_outlined)),
                ),
              ],
            ),
          ],
        )));
  }
}
