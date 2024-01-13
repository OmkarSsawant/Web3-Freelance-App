import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WorkStatusWidget extends StatefulWidget {
  const WorkStatusWidget({super.key, required this.onAddTaskAndPays});

  @override
  State<WorkStatusWidget> createState() => _WorkStatusWidgetState();

  final Function(Map<String, String>) onAddTaskAndPays;
}

class _WorkStatusWidgetState extends State<WorkStatusWidget> {
  Map<String, String> workAndPays = {};
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListView.builder(
            itemCount: workAndPays.keys.length,
            itemBuilder: (context, index) {
              TextEditingController _workEC = TextEditingController(),
                  _payEC = TextEditingController();
              return SizedBox(
                child: Dismissible(
                  key: ValueKey(_payEC),
                  background: Container(
                    color: Colors.red[400],
                  ),
                  onDismissed: (d) {
                    if (d == DismissDirection.endToStart) {
                      setState(() {
                        workAndPays.remove(workAndPays.keys.toList()[index]);
                      });
                    }
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                  hintText: "Complete UI/UX Prototype",
                                  labelText: "Task",
                                  prefixIcon:
                                      const Icon(Icons.workspace_premium)),
                              autocorrect: false,
                              controller: _workEC,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                  hintText: "0.01",
                                  labelText: "Pay",
                                  prefixIcon: SvgPicture.asset(
                                      "assets/images/eth.svg",
                                      width: 20)),
                              autocorrect: false,
                              controller: _payEC,
                            ),
                          ),
                        ),
                        if (index == workAndPays.keys.length - 1)
                          Expanded(
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    workAndPays[_workEC.text] = _payEC.text;
                                  });
                                },
                                child: const Text("create")),
                          )
                      ],
                    ),
                  ),
                ),
              );
            }),
        FilledButton(
            onPressed: () {
              widget.onAddTaskAndPays(workAndPays);
            },
            child: const Text("Done"))
      ],
    ));
  }
}
