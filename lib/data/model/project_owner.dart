// uint owner_id;
//       bytes32 name;
//       bytes32 email;
//       uint phn;
//       address  wallet;
//       bytes32 licence_doc_ipfs;
//       bool verified;
//       bytes32 company;
//       bytes32 url;
//       CompanyType com_type;
//       bytes32 profile_photo_ipfs;

import 'dart:typed_data';

import 'package:web3_freelancer/utils.dart';

class ProjectOwner {
  final BigInt id;
  final String name;
  final String email;
  final BigInt phone;
  final String wallet;
  final String licenseDocIpfs;
  final bool verified;
  final String company;
  final String url;
  final int companyType;
  final String profilePhotoIpfs;

  factory ProjectOwner.fromBlockchain(dynamic m) {
    return ProjectOwner(
        id: BigInt.from(m[0]),
        name: Uint8List.fromList(m[1]).string,
        email: Uint8List.fromList(m[2]).string,
        phone: BigInt.from(m[3]),
        wallet: m[4].toString(),
        licenseDocIpfs: Uint8List.fromList(m[5]).string,
        verified: m[6],
        company: Uint8List.fromList(m[7]).string,
        url: Uint8List.fromList(m[8]).string,
        companyType: m[9],
        profilePhotoIpfs: Uint8List.fromList(m[10]).string);
  }
  ProjectOwner(
      {required this.id,
      required this.wallet,
      required this.name,
      required this.email,
      required this.phone,
      required this.licenseDocIpfs,
      required this.verified,
      required this.profilePhotoIpfs,
      required this.companyType,
      required this.url,
      required this.company});
}
