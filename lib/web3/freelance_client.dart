import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart'; //You can also import the browser version
import 'package:web3_freelancer/data/model/project_data.dart';
import 'package:web3_freelancer/freelance.g.dart';
import 'package:web3_freelancer/main.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3_freelancer/web3/lib_models/eth/ethereum_transaction.dart';
import 'package:web3_freelancer/web3/lib_utils/crypto/eip155.dart';
import 'package:web3dart/web3dart.dart';
import 'dart:io';
import 'package:convert/convert.dart' as c;
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import 'package:web_socket_channel/io.dart';

const IPFS_GATEWAY = "http://10.0.2.2:8188";
const IPFS_API = "http://10.0.2.2:8188/ip4/10.0.2.2/tcp/5001";
const String apiUrl = "http://10.0.2.2:8545/";
const String wsUrl = "ws://10.0.2.2:8545/";

class FreelanceContractClient {
  late Client _client;
  late Web3Client _ethClient;
  late DeployedContract _contract;
  late ContractFunction _getName,
      _registerProjectOwner,
      _finalizeProjectBid,
      _updateProjectStatus,
      _addReview,
      _createProject,
      _getProjectsOfOwner,
      _getProjectStatus,
      _registerDeveloper,
      _signAgreement,
      _getProjectsOfDev,
      _getCompletedProjectsCountOfDev,
      _getTotalDeposit,
      _getDevBidTokens,
      _devPlaceBids,
      _getProjects,
      _getProjectDetails,
      _addProjectDetails,
      _getOngoingTaskAndPaymentTillNow,
      _isDevRegistered,
      _isPORegistered,
      _getTaskAndPays;

  BigInt? lastAddedProjectId;
  Stream<FilterEvent>? _eventsStream;
  ContractAbi? abi;
  final Web3App _dapp;
  Credentials get _mCreds => EthPrivateKey.fromHex("0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80");

  FreelanceContractClient(this._dapp) {
    _client = Client();
    _ethClient = Web3Client(apiUrl, _client, socketConnector: () {
      return IOWebSocketChannel.connect(wsUrl).cast<String>();
    });
  }

  void dispose() {
    _eventsStream = null;
  }

  approveMethods() async {
    return await _dapp.connect(
      requiredNamespaces: {
        'eip155': RequiredNamespace(
          chains: ['eip155:31337'], // Ethereum chain
          methods: [
            'personal_sign',
            'eth_signTransaction',
            'eth_sendTransaction'
          ], // Requestable Methods, see MethodsConstants for reference
          events: [
            'chainChanged'
          ], // Requestable Events, see EventsConstants for reference
        ),
      },
    );
  }

  Future initContractAndFunctions() async {
    // print(
    //     "On ChainId : ${await _ethClient.getChainId()} and on networkId : ${await _ethClient.getNetworkId()}");
    abi = await loadContractAbi();
    _contract = DeployedContract(abi!,
        EthereumAddress.fromHex("0x8464135c8f25da09e49bc8782676a84730c318bc"));
    _getName = _contract.function("getName");
    _registerProjectOwner = _contract.function("registerProjectOwner");
    _finalizeProjectBid = _contract.function("finalizeProjectBid");
    _updateProjectStatus = _contract.function("updateProjectStatus");
    _addReview = _contract.function("addReview");
    _createProject = _contract.function("createProject");
    _getProjectsOfOwner = _contract.function("getProjectsOfOwner");
    _getProjectStatus = _contract.function("getProjectStatus");
    _registerDeveloper = _contract.function("registerDeveloper");
    _signAgreement = _contract.function("signAgreement");
    _getProjectsOfDev = _contract.function("getProjectsOfDev");
    _getCompletedProjectsCountOfDev =
        _contract.function("getCompletedProjectsCountOfDev");
    _getTotalDeposit = _contract.function("getTotalDeposit");
    _getDevBidTokens = _contract.function("getDevBidTokens");
    _devPlaceBids = _contract.function("devPlaceBids");
    _getProjects = _contract.function("getProjects");
    _addProjectDetails = _contract.function("addProjectDetails");
    _getProjectDetails = _contract.function("getProjectDetails");
    _getOngoingTaskAndPaymentTillNow =
        _contract.function("getOngoingTaskAndPaymentTillNow");
    _getTaskAndPays = _contract.function("getTasksAndPays");
    _isDevRegistered = _contract.function("isDevRegistered");
    _isPORegistered = _contract.function("isOwnerRegisered");

    // _eventsStream = _ethClient.events(FilterOptions.events(
    //     contract: _contract, event: _contract.event("ProjectCreated")));

    // _eventsStream?.listen((event) {
    //   if (abi != null && event.topics != null && event.data != null) {
    //     var results = abi!.events[0].decodeResults(event.topics!, event.data!);
    //     lastAddedProjectId = BigInt.from(results[1]);
    //   }
    // });
    return true;
  }

  Future<String> getName() async {
    return (await _ethClient
            .call(contract: _contract, function: _getName, params: []))[0]
        .toString();
  }

  Future<double> checkBalance() async {
    var balance = await _ethClient.getBalance(_mCreds.address);
    return balance.getValueInUnit(EtherUnit.ether);
  }

  Future<ContractAbi> loadContractAbi() async {
    var json = await rootBundle.loadString("assets/abis/freelance.abi.json");
    return ContractAbi.fromJson(json, "Freelance");
  }

  /*
        bytes32 _name,
        bytes32 _email,
        uint _phn,
        bytes32 _licence_doc_ipfs,
        bool _verified,
        bytes32 _company,
        bytes32 _url,
        CompanyType _com_type,
        bytes32 _profile_photo_ipfs
 */
  registerProjectOwner(
      String name,
      String email,
      BigInt phone,
      String licenseDocIpfs,
      String company,
      String url,
      int comType,
      String profilePhotoIpfs) async {
    final transaction = Transaction.callContract(
        contract: _contract,
        function: _registerProjectOwner,
        // from: projectOwnerCred.address,
        parameters: [
          name.bytes32,
          email.bytes32,
          phone,
          licenseDocIpfs.bytes32,
          false,
          company.bytes32,
          url.bytes32,
          BigInt.from(comType),
          profilePhotoIpfs.bytes32
        ]);

    return (await _ethClient.getTransactionByHash(await _ethClient
        .sendTransaction(_mCreds, transaction, chainId: 31337)));
  }

/*
function finalizeProjectBid(uint amount,uint project_id,string memory proposal,bytes32[] memory attachments,address developer)
    /*isProjectOwner(project_id)*/
    public returns (bool _finalized) */
  finalizeProjectBid(BigInt amount, BigInt projectId, String proposal,
      List<String> attachments, EthereumAddress developer) async {
    return await _ethClient.sendTransaction(
        _mCreds,
        Transaction.callContract(
            contract: _contract,
            function: _finalizeProjectBid,
            parameters: [
              amount,
              projectId,
              proposal,
              attachments.map((e) => e.bytes32).toList(),
              developer
            ]),
        chainId: 31337);
  }

  /*
  
        function createProject(
        address _owner,
        bytes32 _title,
        bytes32 _ssrdoc_ipfs,
        bytes32 _project_type,
        uint _deadline,
        uint _deposit_budget
    ) 
   */
  /*
  
        function createProject(
        address _owner,
        bytes32 _title,
        bytes32 _ssrdoc_ipfs,
        bytes32 _project_type,
        uint _deadline,
        uint _deposit_budget
    ) 
   */
  createProject(String title, String shortDesc, String projectType,
      BigInt deadline, BigInt depositBudget) async {
    return await _ethClient.sendTransaction(
        _mCreds,
        Transaction.callContract(
            contract: _contract,
            function: _createProject,
            parameters: [
              title.bytes32,
              projectType.bytes32,
              deadline,
              depositBudget,
              shortDesc
            ],
            value: EtherAmount.inWei(depositBudget)),
        chainId: 31337);
  }

  /*
  function updateProjectStatus(
    uint project_id
)  */
  updateProjectStaus(BigInt s) async {
    return await _ethClient.sendTransaction(
        _mCreds,
        Transaction.callContract(
            contract: _contract,
            function: _updateProjectStatus,
            parameters: [s]),
        chainId: 31337);
  }

  /*
function addReview(uint _project_id,string memory _r)
  
   */
  addReview(BigInt projectId, String rev) async {
    return await _ethClient.sendTransaction(
        _mCreds,
        Transaction.callContract(
            contract: _contract,
            function: _addReview,
            parameters: [projectId, rev]),
        chainId: 31337);
  }

  Future<List> getProjects() async {
    return await _ethClient
        .call(contract: _contract, function: _getProjects, params: []);
  }

  Future getProjectDetails(BigInt projectId) async {
    return await _ethClient.call(
        contract: _contract, function: _getProjectDetails, params: [projectId]);
  }

/*

    function addProjectDetails(
        uint project_id,
           string memory _description,
        bytes32[] memory  _techstack,
        bytes32 _ssrdoc_ipfs,
        string memory _eligiblity_criteria,
        string[] memory _roles
    )public returns (bool) */
  Future addProjectDetailsToRecent(
      String description,
      List<String> techStack,
      String ssrdocIPFS,
      String eligibilityCriteria,
      List<String> roles,
      List<String> works,
      List<BigInt> pays) async {
    return await _ethClient.sendTransaction(
        _mCreds,
        Transaction.callContract(
            contract: _contract,
            function: _addProjectDetails,
            parameters: [
              description,
              techStack.map((e) => e.bytes32).toList(),
              ssrdocIPFS.bytes32,
              eligibilityCriteria,
              roles,
              works,
              pays
            ]),
        chainId: 31337);
  }

  Future<List<dynamic>> getTasksAndPays(BigInt projectId) async {
    return await _ethClient.call(
        contract: _contract, function: _getTaskAndPays, params: [projectId]);
  }

  /*
   function getProjectsOfOwner(
        address _owner
    ) 
   */
  getProjectsOfOwner(EthereumAddress owner) async {
    return await _ethClient.call(
        contract: _contract, function: _getProjectsOfOwner, params: [owner]);
  }

/*
    function getProjectStatus(uint project_id) public view returns (WorkStatus) {

  */

  getProjectStatus(BigInt projectId) async {
    return await _ethClient.call(
        contract: _contract, function: _getProjectStatus, params: [projectId]);
  }

  Future<bool> isDevRegistered() async {
    return (await _ethClient.call(
        contract: _contract,
        function: _isDevRegistered,
        params: []))[0] as bool;
  }

  Future<bool> isPORegistered() async {
    return (await _ethClient.call(
        contract: _contract, function: _isPORegistered, params: []))[0] as bool;
  }

/*
    function registerDeveloper(
        bytes32 _name,
        bytes32 _profile_photo_ipfs,
        bytes32[] memory _techstack,
        bytes32 _profession
    )
    public returns (bool )
 */

  registerDeveloper(
      String from,
      String topic,
      String chainId,
      String name,
      String profilePhotoIpfs,
      List<String> techstack,
      String profession) async {

    final Transaction t = Transaction.callContract(  contract: _contract,
        function: _registerDeveloper,
        parameters: [
          name.bytes32,
          profilePhotoIpfs.bytes32,
          techstack.map((e) => e.bytes32).toList(),
          profession.bytes32
        ]);

debugPrint("---------------------------------------------------------------------------------");
    var s =  await  EIP155.ethSendTransaction(
        w3mService: _dapp,
        topic: topic,
        chainId: chainId,
        transaction: EthereumTransaction(
            from: from,
            to: _contract.address.hex,
          data: c.hex.encode(List<int>.from(t.data!))
          , value: "0x"),
        method: EIP155UIMethods.ethSendTransaction.name);
    debugPrint(s);
    return s;
    // debugPrint("---------------------------------------------------------------------------------");
    // return   (await _ethClient.call(
    //     contract: _contract, function: _registerDeveloper, params: [
    //   name.bytes32,
    //   profilePhotoIpfs.bytes32,
    //   techstack.map((e) => e.bytes32).toList(),
    //   profession.bytes32
    // ]));
//     return await _ethClient.sendTransaction(
//         _mCreds,
//         Transaction.callContract(
//             contract: _contract,
//             function: _registerDeveloper,
//             parameters: [
//               name.bytes32,
//               profilePhotoIpfs.bytes32,
//               techstack.map((e) => e.bytes32).toList(),
//               profession.bytes32
//             ]),
//         chainId: 31337);
  }

  /*
    function signAgreement(uint project_id) public onlyDev returns (bool _success) {
   */
  signAgreement(BigInt projectId) async {
    return await _ethClient.sendTransaction(
        _mCreds,
        Transaction.callContract(
            contract: _contract,
            function: _signAgreement,
            parameters: [projectId]),
        chainId: 31337);
  }

  /*function getProjectsOfDev(
        address _dev
    ) */
  getProjectsOfDev(EthereumAddress dev) async {
    return await _ethClient
        .call(contract: _contract, function: _getProjectsOfDev, params: [dev]);
  }

  /*
    function getCompletedProjectsCountOfDev(
        address _dev
    ) 
   */
  getCompletedProjectsCountOfDev(EthereumAddress dev) async {
    return await _ethClient.call(
        contract: _contract,
        function: _getCompletedProjectsCountOfDev,
        params: [dev]);
  }

  /*function getDevBidTokens(
        address dev
    )*/
  getDevBidTokens(EthereumAddress dev) async {
    return await _ethClient
        .call(contract: _contract, function: _getDevBidTokens, params: [dev]);
  }

/*   function devPlaceBids(
        address dev,
        uint count
    ) */
  devPlaceBids(EthereumAddress dev, BigInt count) async {
    return await _ethClient.sendTransaction(
        _mCreds,
        Transaction.callContract(
            contract: _contract,
            function: _devPlaceBids,
            parameters: [dev, count]),
        chainId: 31337);
  }

  Future<List<dynamic>> getOngoingTaskAndPaymentTillNow(
      BigInt projectId) async {
    return await _ethClient.call(
        contract: _contract,
        function: _getOngoingTaskAndPaymentTillNow,
        params: [projectId]);
  }
}
