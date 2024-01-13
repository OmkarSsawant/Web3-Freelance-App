import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:web3_freelancer/data/model/task_pays.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';
import 'package:web3dart/web3dart.dart';

class ProjectStatusScreen extends StatefulWidget {
  bool isOwner;
  final BigInt projectId;
  ProjectStatusScreen(
      {super.key, required this.isOwner, required this.projectId});

  @override
  State<ProjectStatusScreen> createState() => _ProjectStatusScreenState();
}

class _ProjectStatusScreenState extends State<ProjectStatusScreen> {
  @override
  void initState() {
    load();
    super.initState();
  }

  TaskAndPays? taskAndPays;
  @override
  Widget build(BuildContext context) {
    final _contract = context.read<FreelanceContractClient>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Status"),
      ),
      body: SizedBox(
        width: context.screenWidth,
        child: Padding(
          padding: EdgeInsets.only(left: context.screenWidth * 0.05),
          child: ListView.builder(
              itemCount: taskAndPays?.tasks.length ?? 0,
              itemBuilder: (context, index) {
                return TrackingStepWidget(
                    i: index,
                    lastIndex: taskAndPays!.pays.length - 1,
                    title: taskAndPays!.tasks[index],
                    date:
                        "${EtherAmount.inWei(taskAndPays!.pays[index]).getValueInUnit(EtherUnit.ether)} eth",
                    isNextCompleted: index < taskAndPays!.ongoingIndex.toInt(),
                    completed: index <= taskAndPays!.ongoingIndex.toInt());
              }),
        ),
      ),
      floatingActionButton: (widget.isOwner)
          ? FloatingActionButton.extended(
              icon: const Icon(Icons.verified),
              onPressed: () async {
                if (taskAndPays == null) return;

                var txn = await _contract.updateProjectStaus(widget.projectId);
                debugPrint("Updated : $txn");
                load();

                if ((taskAndPays!.tasks.length - 1).big ==
                    taskAndPays!.ongoingIndex) {
                  //Approve
                  //mark bc status completed
                  //gen. bill
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: context.screenHeight * .3,
                          child: Column(
                            children: [
                              Text("Please Rate the Developer"),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7)),
                                    labelText: "Review",
                                    prefixIcon: const Icon(Icons.rate_review)),
                                minLines: 2,
                                maxLines: 10,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FilledButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.isOwner = false;
                                      //to now make stages read only
                                    });
                                  },
                                  child: const Text("Done"))
                            ],
                          ),
                        );
                      });
                }
              },
              label: const Text("Approve and Move Forward"))
          : null,
    );
  }

  void load() async {
    final _contract = context.read<FreelanceContractClient>();
    taskAndPays = TaskAndPays.fromBlockchain(
        (await _contract.getTasksAndPays(widget.projectId)));
    setState(() {});
  }
}

class TrackingStepWidget extends StatelessWidget {
  final String title;
  final String date;
  final bool completed;
  final int i;
  final int lastIndex;
  final bool isNextCompleted;
  const TrackingStepWidget(
      {required this.title,
      required this.date,
      required this.completed,
      required this.i,
      required this.lastIndex,
      required this.isNextCompleted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TweenAnimationBuilder(
              duration: Duration(milliseconds: 1000 * i),
              tween: ColorTween(
                  begin: Color.fromARGB(75, 150, 150, 150),
                  end: !completed
                      ? Color(0xff969696)
                      : Color.fromARGB(255, 255, 143, 5)),
              builder: (context, anim, child) {
                return TweenAnimationBuilder<double>(
                    duration: Duration(milliseconds: 1000 * i),
                    tween: Tween(begin: 0, end: 47),
                    builder: (context, animh, child) {
                      return Column(
                        children: [
                          Container(
                            width: 57.0,
                            height: 57.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: anim,
                            ),
                            child: completed
                                ? AnimatedOpacity(
                                    duration: Duration(milliseconds: 1000 * i),
                                    opacity: animh / 47.0,
                                    child: const Center(
                                      child: Text(
                                        "✅",
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          if (i != lastIndex)
                            Stack(
                              children: [
                                Container(
                                  width: 4,
                                  height: 37,
                                  color: Colors.grey,
                                ),
                                if (isNextCompleted)
                                  Container(
                                    width: 4,
                                    height: animh,
                                    color: anim,
                                  ),
                              ],
                            )
                        ],
                      );
                    });
              }),
          SizedBox(width: 26.0),
          Padding(
            padding: const EdgeInsets.only(bottom: 57),
            child: Text(title,
                style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.w500)),
          ),
          SizedBox(width: 16.0),
          Padding(
            padding: const EdgeInsets.only(bottom: 57.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/eth.svg",
                  width: 15,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(date, style: TextStyle(fontSize: 12.0, color: Colors.grey))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
