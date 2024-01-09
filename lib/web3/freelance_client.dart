import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart'; //You can also import the browser version
import 'package:web3dart/web3dart.dart';
import 'dart:io';

import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

const String apiUrl = "http://127.0.0.1:8545/";
var creds = EthPrivateKey.fromHex(
    "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80");
const String wsUrl = "ws://127.0.0.1:8545/";

class FreelanceContractClient extends ChangeNotifier {
  late Client _client;
  late Web3Client _ethClient;
  late DeployedContract _contract;
  late ContractFunction _getName;
  FreelanceContractClient() {
    _client = Client();
    _ethClient = Web3Client(apiUrl, _client, socketConnector: () {
      return IOWebSocketChannel.connect(wsUrl).cast<String>();
    });
    _initContractAndFunctions();
  }

  void _initContractAndFunctions() async {
    var abi = await loadContractAbi();
    _contract = DeployedContract(abi,
        EthereumAddress.fromHex("0x5FbDB2315678afecb367f032d93F642f64180aa3"));
    _getName = _contract.function("getName");
  }

  Future<double> checkBalance() async {
    var balance = await _ethClient.getBalance(creds.address);
    return balance.getValueInUnit(EtherUnit.ether);
  }

  Future<String> getName() async {
    return (await _ethClient
            .call(contract: _contract, function: _getName, params: []))[0]
        .toString();
  }

  Future<ContractAbi> loadContractAbi() async {
    var json = await rootBundle.loadString("assets/abis/freelance.abi.json");
    return ContractAbi.fromJson(json, "Freelance");
  }
}
