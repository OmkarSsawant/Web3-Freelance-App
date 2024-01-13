import 'package:flutter/material.dart';

class TaskAndPays {
  final BigInt ongoingIndex;
  final List<String> tasks;
  final List<BigInt> pays;

  TaskAndPays(
      {required this.ongoingIndex, required this.tasks, required this.pays});

  factory TaskAndPays.fromBlockchain(dynamic m) {
    debugPrint("m:$m");
    return TaskAndPays(
        ongoingIndex: m[2],
        tasks: List<String>.from(m[0]),
        pays: List<BigInt>.from(m[1]));
  }
}
