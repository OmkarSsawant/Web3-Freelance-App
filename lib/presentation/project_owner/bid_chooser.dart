import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3_freelancer/data/model/bid.dart';
import 'package:web3_freelancer/data/model/project.dart';
import 'package:web3_freelancer/firestore_data/FirestoreSaver.dart';
import 'package:web3_freelancer/web3/freelance_client.dart';

class BidChoosingScreen extends StatefulWidget {
  final String btnText;
  final Future<List<Bid>> bidsFuture;
  final Function(BuildContext, FirestoreSaver, Bid)? onTap;
  const BidChoosingScreen(
      {super.key, required this.btnText, this.onTap, required this.bidsFuture});

  @override
  State<BidChoosingScreen> createState() => _BidChoosingScreenState();
}

class _BidChoosingScreenState extends State<BidChoosingScreen> {
  @override
  Widget build(BuildContext context) {
    final store = context.read<FirestoreSaver>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bids"),
      ),
      body: FutureBuilder<List<Bid>>(
          future: widget.bidsFuture,
          builder: (context, snap) {
            if (!snap.hasData || snap.hasError || snap.data == null) {
              return const Center(
                child: Text("No Bids Yet"),
              );
            }
            final bids =
                snap.data!.where((element) => !element.signed).toList();
            return ListView.builder(
                itemCount: bids.length,
                itemBuilder: (context, index) => ExpansionTile(
                      title: Text(bids[index].bidder ?? "Unknown"),
                      subtitle: Text("${bids[index].amount}\teth"),
                      trailing: FilledButton.icon(
                          onPressed: () =>
                              widget.onTap?.call(context, store, bids[index]),
                          icon: const Icon(Icons.confirmation_num),
                          label: const Text("Confirm Bid")),
                      children: [
                        const Text("Proposal:"),
                        Text(bids[index].proposal),
                        const SizedBox(
                          height: 6,
                        ),
                        TextButton.icon(
                            onPressed: () => _openAttachmentFile(
                                context, bids[index].attachments.firstOrNull),
                            icon: const Icon(Icons.file_open_rounded),
                            label: const Text("Open Attachment"))
                      ],
                    ));
          }),
    );
  }

  _openAttachmentFile(BuildContext context, String? docUrl) async {
    if (docUrl != null) {
      var url = await FirebaseStorage.instance.ref(docUrl).getDownloadURL();
      //TODO:Use File Downloader to download
    }
  }
}
