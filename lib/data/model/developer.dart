/*
  struct Developer{
        uint dev_id;
        address dev_address;
        bytes32 name;
        bytes32 profile_photo_ipfs;
        bytes32[] techstack;
        bytes32 profession;
    } */

import 'dart:typed_data';

import 'package:web3_freelancer/utils.dart';

class Developer {
  final BigInt id;
  final String address;
  final String name;
  final String profilePhotoIpfs;
  final List<String> techstack;
  final String profession;

  factory Developer.fromBlockchain(dynamic m) {
    return Developer(
        id: BigInt.from(m[0]),
        address: m[1].toString(),
        name: Uint8List.fromList(m[2]).string,
        profilePhotoIpfs: Uint8List.fromList(m[3]).string,
        techstack: List.from(m[4])
            .map<String>((e) => Uint8List.fromList(e).string)
            .toList(),
        profession: Uint8List.fromList(m[5]).string);
  }
  Developer(
      {required this.id,
      required this.address,
      required this.name,
      required this.profilePhotoIpfs,
      required this.techstack,
      required this.profession});
}
