import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart'; //You can also import the browser version
import 'package:web3_freelancer/main.dart';
import 'package:web3_freelancer/utils.dart';
import 'package:web3dart/web3dart.dart';
import 'dart:io';

import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

const String apiUrl = "http://127.0.0.1:8545/";
Credentials creds = EthPrivateKey.fromHex(
    "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80");
var projectOwnerCred = EthPrivateKey.fromHex(
    "0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d");
const String wsUrl = "ws://127.0.0.1:8545/";

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
      _addWorksAndPays,
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
      _getOngoingTaskAndPaymentTillNow;

  BigInt? lastAddedProjectId;
  Stream<FilterEvent>? _eventsStream;
  ContractAbi? abi;

  //,Credentials get _creds =>
  FreelanceContractClient() {
    _client = Client();
    _ethClient = Web3Client(apiUrl, _client, socketConnector: () {
      return IOWebSocketChannel.connect(wsUrl).cast<String>();
    });
    initContractAndFunctions();
    _eventsStream = _ethClient.events(FilterOptions.events(
        contract: _contract, event: _contract.event("ProjectCreated")));

    _eventsStream?.listen((event) {
      if (abi != null && event.topics != null && event.data != null) {
        var results = abi!.events[0].decodeResults(event.topics!, event.data!);
        lastAddedProjectId = BigInt.from(results[1]);
      }
    });
  }

  void dispose() {
    _eventsStream = null;
  }

  Future initContractAndFunctions() async {
    print(
        "On ChainId : ${await _ethClient.getChainId()} and on networkId : ${await _ethClient.getNetworkId()}");
    abi = await loadContractAbi();
    _contract = DeployedContract(abi!,
        EthereumAddress.fromHex("0x5FbDB2315678afecb367f032d93F642f64180aa3"));
    _getName = _contract.function("getName");
    _registerProjectOwner = _contract.function("registerProjectOwner");
    _finalizeProjectBid = _contract.function("finalizeProjectBid");
    _updateProjectStatus = _contract.function("updateProjectStatus");
    _addReview = _contract.function("addReview");
    _createProject = _contract.function("createProject");
    _addWorksAndPays = _contract.function("addWorksAndPays");
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
    _getProjectDetails = _contract.function("getProjectDetails");
    _addProjectDetails = _contract.function("addProjectDetails");
    _getOngoingTaskAndPaymentTillNow =
        _contract.function("getOngoingTaskAndPaymentTillNow");
    return true;
  }

  Future<String> getName() async {
    return (await _ethClient
            .call(contract: _contract, function: _getName, params: []))[0]
        .toString();
  }

  Future<double> checkBalance() async {
    var balance = await _ethClient.getBalance(creds.address);
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

    return (await _ethClient.getTransactionByHash(
        await _ethClient.sendTransaction(creds, transaction, chainId: 31337)));
  }

/*
function finalizeProjectBid(uint amount,uint project_id,string memory proposal,bytes32[] memory attachments,address developer)
    /*isProjectOwner(project_id)*/
    public returns (bool _finalized) */
  finalizeProjectBid(BigInt amount, BigInt projectId, String proposal,
      List<String> attachments, EthereumAddress developer) async {
    return await _ethClient.sendTransaction(
        projectOwnerCred,
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
  createProject(EthereumAddress owner, String title, String shortDesc,
      String projectType, BigInt deadline, BigInt depositBudget) async {
    return await _ethClient.sendTransaction(
        creds,
        Transaction.callContract(
            contract: _contract,
            function: _createProject,
            parameters: [
              owner,
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
  updateProjectStaus(int s) async {
    return await _ethClient.sendTransaction(
        creds,
        Transaction.callContract(
            contract: _contract,
            function: _updateProjectStatus,
            parameters: [s.big]),
        chainId: 31337);
  }

  /*
function addReview(uint _project_id,string memory _r)
  
   */
  addReview(BigInt projectId, String rev) async {
    return await _ethClient.sendTransaction(
        creds,
        Transaction.callContract(
            contract: _contract,
            function: _addReview,
            parameters: [projectId, rev]),
        chainId: 31337);
  }

  addWorkAndPays(
      BigInt projectId, List<String> works, List<BigInt> pays) async {
    return await _ethClient.sendTransaction(
        creds,
        Transaction.callContract(
            contract: _contract,
            function: _addWorksAndPays,
            parameters: [projectId, works, pays]));
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
  Future addProjectDetails(
      BigInt projectId,
      String description,
      List<String> techStack,
      String ssrdocIPFS,
      String eligibilityCriteria,
      List<String> roles) async {
    return await _ethClient.sendTransaction(
        creds,
        Transaction.callContract(
            contract: _contract,
            function: _addProjectDetails,
            parameters: [
              projectId,
              description,
              techStack.map((e) => e.bytes32).toList(),
              ssrdocIPFS.bytes32,
              eligibilityCriteria,
              roles
            ]),
        chainId: 31337);
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

/*
    function registerDeveloper(
        bytes32 _name,
        bytes32 _profile_photo_ipfs,
        bytes32[] memory _techstack,
        bytes32 _profession
    )
    public returns (bool )
 */

  registerDeveloper(String name, String profilePhotoIpfs,
      List<String> techstack, String profession) async {
    return await _ethClient.sendTransaction(
        creds,
        Transaction.callContract(
            contract: _contract,
            function: _registerDeveloper,
            parameters: [
              name.bytes32,
              profilePhotoIpfs.bytes32,
              techstack.map((e) => e.bytes32).toList(),
              profession.bytes32
            ]),
        chainId: 31337);
  }

  /*
    function signAgreement(uint project_id) public onlyDev returns (bool _success) {
   */
  signAgreement(BigInt projectId) async {
    return await _ethClient.sendTransaction(
        creds,
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
        creds,
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
