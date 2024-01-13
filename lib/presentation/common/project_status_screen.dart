import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web3_freelancer/utils.dart';

class ProjectStatusScreen extends StatefulWidget {
  const ProjectStatusScreen({super.key});

  @override
  State<ProjectStatusScreen> createState() => _ProjectStatusScreenState();
}

class _ProjectStatusScreenState extends State<ProjectStatusScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Status"),
      ),
      body: SizedBox(
        width: context.screenWidth,
        child: Padding(
          padding: EdgeInsets.only(left: context.screenWidth * 0.05),
          child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return TrackingStepWidget(
                    i: index,
                    isLast: index == 6,
                    title: "title$index",
                    date: "0.$index eth",
                    isNextCompleted: index < 3,
                    completed: index < 4);
              }),
        ),
      ),
    );
  }
}

class TrackingStepWidget extends StatelessWidget {
  final String title;
  final String date;
  final bool completed;
  final int i;
  final bool isLast;
  final bool isNextCompleted;
  const TrackingStepWidget(
      {required this.title,
      required this.date,
      required this.completed,
      required this.i,
      required this.isLast,
      required this.isNextCompleted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TweenAnimationBuilder(
              duration: Duration(milliseconds: 2000 * i),
              tween: ColorTween(
                  begin: Color.fromARGB(75, 150, 150, 150),
                  end: !completed
                      ? Color(0xff969696)
                      : Color.fromARGB(255, 255, 143, 5)),
              builder: (context, anim, child) {
                return Column(
                  children: [
                    Container(
                      width: 57.0,
                      height: 57.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: anim,
                      ),
                    ),
                    if (!isLast)
                      Stack(
                        children: [
                          Container(
                            width: 4,
                            height: 37,
                            color: Colors.grey,
                          ),
                          if (isNextCompleted)
                            TweenAnimationBuilder<double>(
                                duration: Duration(milliseconds: 2000 * i),
                                tween: Tween(begin: 0, end: 47),
                                builder: (context, animh, child) {
                                  return Container(
                                    width: 4,
                                    height: animh,
                                    color: anim,
                                  );
                                }),
                        ],
                      )
                  ],
                );
              }),
          SizedBox(width: 36.0),
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
