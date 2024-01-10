import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

extension EthBytes32 on String {
  Uint8List get bytes32 =>
      Uint8List.fromList(utf8.encode(padRight(32).substring(0, 32)));
}

extension StrFromBytes on Uint8List {
  String get string => utf8.decode(this);
}

extension EthBig on int {
  BigInt get big => BigInt.from(this);
}

extension MediaSize on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}
