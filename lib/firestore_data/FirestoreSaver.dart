import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:web3_freelancer/data/model/bid.dart';
import 'package:web3_freelancer/data/model/project.dart';

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
        .doc("0xcurrentuerdev")
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
}
