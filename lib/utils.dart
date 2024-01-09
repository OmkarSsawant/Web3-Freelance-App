import 'dart:convert';
import 'dart:typed_data';

extension EthBytes32 on String {
  Uint8List get bytes32 =>
      Uint8List.fromList(utf8.encode(padRight(32).substring(0, 32)));
}

extension EthBig on int {
  BigInt get big => BigInt.from(this);
}
