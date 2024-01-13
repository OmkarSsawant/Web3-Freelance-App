import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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

  Future<List<Bid>> getAllPendingBidsOfOwner(String owner) async {
    return (await store
            .collectionGroup("bids")
            .where("owner", isEqualTo: owner)
            .where("bidder", isEqualTo: null)
            .get())
        .docs
        .map<Bid>((d) => Bid.fromFS(d.data(), d.id))
        .toList();
  }

  Future<List<Bid>> getAllApprovedBidsOfOwner(String owner) async {
    return (await store
            .collectionGroup("bids")
            .where("owner", isEqualTo: owner)
            .where("bidder", isNotEqualTo: null)
            .get())
        .docs
        .map<Bid>((d) => Bid.fromFS(d.data(), d.id))
        .toList();
  }

  Future<List<Bid>> getApprovedBidsOfDev(String dev) async {
    return (await store
            .collectionGroup("bids")
            .where("bidder", isEqualTo: dev)
            .get())
        .docs
        .map<Bid>((d) => Bid.fromFS(d.data(), d.id))
        .toList();
  }

  Future removeFinalizedBid(Bid bid) async {
    return (await store
            .collectionGroup("bids")
            .where("projectId", isEqualTo: bid.projectId)
            .get())
        .docs
        .forEach((d) => d.reference.delete());
  }

  Future approveBid(Bid b, String owner) async {
    final WriteBatch batch = store.batch();
    final docsToDelete = await store
        .collection("owners")
        .doc(owner)
        .collection("projects")
        .doc(b.projectId.toString())
        .collection("bids")
        .get();
    docsToDelete.docs.forEach((doc) {
      batch.delete(doc.reference);
    });
    batch.set(
        store
            .collection("owners")
            .doc(owner)
            .collection("projects-approved")
            .doc(b.projectId.toString())
            .collection("bids")
            .doc(b.bidder),
        b.toJson());

    return await batch.commit();
  }
}
