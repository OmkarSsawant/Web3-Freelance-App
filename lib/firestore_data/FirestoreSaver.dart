import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web3_freelancer/data/model/bid.dart';

class FirestoreSaver {
  FirebaseFirestore get store => FirebaseFirestore.instance;

  Future placeBid(Bid b) async {
    return await store
        .collection("owners")
        .doc(b.owner)
        .collection("projects")
        .doc(b.projectId.toString())
        .collection("bids")
        .add(b.toJson());
  }
}
