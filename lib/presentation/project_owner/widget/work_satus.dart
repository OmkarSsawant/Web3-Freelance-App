import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web3_freelancer/utils.dart';

class WorkStatusWidget extends StatefulWidget {
  const WorkStatusWidget({super.key, required this.onAddTaskAndPays});

  @override
  State<WorkStatusWidget> createState() => _WorkStatusWidgetState();

  final Function(List<String>, List<String>) onAddTaskAndPays;
}

class _WorkStatusWidgetState extends State<WorkStatusWidget> {
  List<TextEditingController> _workEcs = [
    TextEditingController(text: "Sample Work")
  ];
  List<TextEditingController> _payEcs = [TextEditingController(text: "0.01")];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.screenHeight * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: ListView.builder(
                  itemCount: _workEcs.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: Dismissible(
                        key: ValueKey("$_payEcs$index"),
                        background: Container(
                          color: Colors.red[400],
                        ),
                        onDismissed: (d) {
                          if (d == DismissDirection.endToStart) {
                            setState(() {
                              _workEcs.removeAt(index);
                              _payEcs.removeAt(index);
                            });
                          }
                        },
                        child: _insertionTile(
                            _workEcs[index], _payEcs[index], index, true),
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                  onPressed: () {
                    _payEcs.removeLast();
                    _workEcs.removeLast();
                    widget.onAddTaskAndPays(
                        _workEcs.map((e) => e.text).toList(),
                        _payEcs.map((e) => e.text).toList());
                    Navigator.of(context).pop();
                  },
                  child: const Text("Done")),
            )
          ],
        ));
  }

  Card _insertionTile(TextEditingController _workEC,
      TextEditingController _payEC, int index, bool editable) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                enabled: editable,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)),
                    hintText: "Complete UI/UX Prototype",
                    labelText: "Task",
                    prefixIcon: const Icon(Icons.workspace_premium)),
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
                    prefixIcon:
                        SvgPicture.asset("assets/images/eth.svg", width: 20)),
                autocorrect: false,
                controller: _payEC,
              ),
            ),
          ),
          if (index == _workEcs.length - 1)
            Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      _workEcs.add(TextEditingController());
                      _payEcs.add(TextEditingController());
                    });
                  },
                  child: const Text("create")),
            )
        ],
      ),
    );
  }
}
