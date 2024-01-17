// ignore: implementation_imports
import 'package:web3dart/crypto.dart';
import 'package:web3dart/src/crypto/secp256k1.dart';
import 'dart:typed_data';

import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';
import 'package:web3dart/web3dart.dart';

class WalletConnectEthereumCredentials extends CustomTransactionSender {
  WalletConnectEthereumCredentials(
      {required this.wcClient, required this.session});

  final Web3App wcClient;
  final SessionData session;

  @override
  Future<String> sendTransaction(Transaction transaction) async {
    final from = await extractAddress();
    final signResponse = await wcClient.request(
      topic: session.topic,
      chainId: 'eip155:31337',
      request: SessionRequestParams(
        method: 'eth_sendTransaction',
        params: [
          {
            'from': from.hex,
            'to': transaction.to?.hex,
            'gas': '0x${transaction.maxGas!.toRadixString(16)}',
            'gasPrice':
                '0x${transaction.gasPrice?.getInWei.toRadixString(16) ?? '0'}',
            'value':
                '0x${transaction.value?.getInWei.toRadixString(16) ?? '0'}',
            'data':
                transaction.data != null ? bytesToHex(transaction.data!) : null,
            'nonce': transaction.nonce,
          }
        ],
      ),
    );

    return signResponse.toString();
  }

  @override
  EthereumAddress get address => EthereumAddress.fromHex(
      session.namespaces.values.first.accounts.first.split(':').last);

  @override
  Future<EthereumAddress> extractAddress() =>
      Future(() => EthereumAddress.fromHex(
          session.namespaces.values.first.accounts.first.split(':').last));

  @override
  MsgSignature signToEcSignature(Uint8List payload,
      {int? chainId, bool isEIP1559 = false}) {
    // TODO: implement signToEcSignature
    throw UnimplementedError();
  }

  @override
  Future<MsgSignature> signToSignature(Uint8List payload,
      {int? chainId, bool isEIP1559 = false}) {
    // TODO: implement signToSignature
    throw UnimplementedError();
  }
}
