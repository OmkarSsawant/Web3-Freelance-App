import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:web3_freelancer/data/model/bid.dart';
import 'package:web3_freelancer/data/model/project.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';

class FirestoreSaver {
  FirebaseFirestore get store => FirebaseFirestore.instance;
  FirebaseStorage get fileStore => FirebaseStorage.instance;
  Future placeBid(Bid b) async {
    return await store
        .collection("owners")
        .doc(b.owner)
        .collection("projects")
        .doc(b.projectId.toString())
        .collection("bids")
        .doc(creds.address.hex)
        .set(b.toJson());
  }

  Future uploadProposal(Uint8List f, BigInt projectId, String user) {
    return fileStore.ref(projectId.toString()).child(user).putData(f);
  }

  Future<bool> isBiddedBy(Project p, String s) async {
    return (await store
            .collection("owners")
            .doc(p.owner)
            .collection("projects")
            .doc(p.id.toString())
            .collection("bids")
            .doc(s)
            .get())
        .exists;
  }

  Future<int> biddersCount(Project p) async {
    return (await (store
                    .collection("owners")
                    .doc(p.owner)
                    .collection("projects")
                    .doc(p.id.toString())
                    .collection("bids"))
                .count()
                .get())
            .count ??
        0;
  }

  Future<List<Bid>> getPendingBids(Project p) async {
    return (await (store
                .collection("owners")
                .doc(p.owner)
                .collection("projects")
                .doc(p.id.toString())
                .collection("bids"))
            .get())
        .docs
        .map<Bid>((doc) {
      Map<String, dynamic> data = doc.data();
      return Bid.fromFS(data, doc.id);
    }).toList();
  }

  Future<List<BigInt>> getPendingProjectIdsOfOwner(String owner) async {
    var ref = (store.collection("owners").doc(owner).collection("projects"));
    ref.path.printInDebug;
    return (await ref.get())
        .docs
        .map<BigInt>((e) => BigInt.parse(e.id))
        .toList();
  }

  Future<List<BigInt>> getApprovedProjectIdsOfOwner(String owner) async {
    return (await store
            .collection("owners")
            .doc(owner)
            .collection("projects-approved")
            .get())
        .docs
        .map<BigInt>((e) => BigInt.parse(e.id))
        .toList();
  }

  approveBid(Bid b, String owner) async {
    await store
        .collection("owners")
        .doc(owner)
        .collection("projects")
        .doc(b.projectId.toString())
        .delete();
    await store
        .collection("owners")
        .doc(owner)
        .collection("projects-approved")
        .doc(b.projectId.toString())
        .set(b.toJson());
  }
}
