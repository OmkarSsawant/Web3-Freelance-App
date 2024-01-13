// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:web3dart/web3dart.dart' as _i1;
import 'dart:typed_data' as _i2;

final _contractAbi = _i1.ContractAbi.fromJson(
  '[{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"owner","type":"address"},{"indexed":false,"internalType":"address","name":"developer","type":"address"},{"indexed":false,"internalType":"uint256","name":"project_id","type":"uint256"}],"name":"EnableProjectChat","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"assigned_dev","type":"address"},{"indexed":false,"internalType":"uint256","name":"project_id","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"amount","type":"uint256"}],"name":"ProjectBidFinalized","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"owner","type":"address"},{"indexed":false,"internalType":"uint256","name":"project_id","type":"uint256"}],"name":"ProjectCreated","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"owner","type":"address"}],"name":"ProjectOwnerRegistered","type":"event"},{"inputs":[{"internalType":"uint256","name":"_project_id","type":"uint256"},{"internalType":"string","name":"_r","type":"string"}],"name":"addReview","outputs":[{"internalType":"bool","name":"_process_completed","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_project_id","type":"uint256"},{"internalType":"string[]","name":"_works","type":"string[]"},{"internalType":"uint256[]","name":"_pays","type":"uint256[]"}],"name":"addWorksAndPays","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"components":[{"internalType":"bytes32","name":"title","type":"bytes32"},{"internalType":"bytes32","name":"project_type","type":"bytes32"},{"internalType":"uint256","name":"deadline","type":"uint256"},{"internalType":"uint256","name":"deposit_budget","type":"uint256"},{"internalType":"string","name":"short_desc","type":"string"},{"internalType":"string","name":"description","type":"string"},{"internalType":"bytes32[]","name":"techstack","type":"bytes32[]"},{"internalType":"bytes32","name":"ssrdoc_ipfs","type":"bytes32"},{"internalType":"string","name":"eligibility_criteria","type":"string"},{"internalType":"string[]","name":"roles","type":"string[]"},{"internalType":"string[]","name":"works","type":"string[]"},{"internalType":"uint256[]","name":"pays","type":"uint256[]"}],"internalType":"struct Freelance.ProjectData","name":"pd","type":"tuple"}],"name":"createProject","outputs":[{"internalType":"bool","name":"_created","type":"bool"}],"stateMutability":"payable","type":"function"},{"inputs":[{"internalType":"address","name":"dev","type":"address"},{"internalType":"uint256","name":"count","type":"uint256"}],"name":"devPlaceBids","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"uint256","name":"project_id","type":"uint256"},{"internalType":"string","name":"proposal","type":"string"},{"internalType":"bytes32[]","name":"attachments","type":"bytes32[]"},{"internalType":"address","name":"developer","type":"address"}],"name":"finalizeProjectBid","outputs":[{"internalType":"bool","name":"_finalized","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_dev","type":"address"}],"name":"getCompletedProjectsCountOfDev","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"dev","type":"address"}],"name":"getDevBidTokens","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getName","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"pure","type":"function"},{"inputs":[{"internalType":"uint256","name":"project_id","type":"uint256"}],"name":"getOngoingTaskAndPaymentTillNow","outputs":[{"internalType":"string","name":"","type":"string"},{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"project_id","type":"uint256"}],"name":"getProjectDetails","outputs":[{"components":[{"internalType":"string","name":"description","type":"string"},{"internalType":"bytes32[]","name":"techstack","type":"bytes32[]"},{"internalType":"string","name":"eligiblity_criteria","type":"string"},{"internalType":"string[]","name":"roles","type":"string[]"},{"internalType":"bytes32","name":"ssr_doc_ipfs","type":"bytes32"}],"internalType":"struct Freelance.ProjectDetails","name":"","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"project_id","type":"uint256"}],"name":"getProjectStatus","outputs":[{"internalType":"enum Freelance.WorkStatus","name":"","type":"uint8"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getProjects","outputs":[{"components":[{"internalType":"uint256","name":"project_id","type":"uint256"},{"internalType":"address","name":"owner","type":"address"},{"internalType":"bytes32","name":"title","type":"bytes32"},{"components":[{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"address","name":"bidder","type":"address"},{"internalType":"string","name":"proposal","type":"string"},{"internalType":"bytes32[]","name":"attachments","type":"bytes32[]"}],"internalType":"struct Freelance.Bid","name":"finalized_bid","type":"tuple"},{"internalType":"bytes32","name":"project_type","type":"bytes32"},{"internalType":"uint256","name":"deadline","type":"uint256"},{"internalType":"uint256","name":"deposit_budget","type":"uint256"},{"internalType":"string","name":"short_description","type":"string"},{"internalType":"enum Freelance.WorkStatus","name":"status","type":"uint8"}],"internalType":"struct Freelance.Project[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_dev","type":"address"}],"name":"getProjectsOfDev","outputs":[{"components":[{"internalType":"uint256","name":"project_id","type":"uint256"},{"internalType":"address","name":"owner","type":"address"},{"internalType":"bytes32","name":"title","type":"bytes32"},{"components":[{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"address","name":"bidder","type":"address"},{"internalType":"string","name":"proposal","type":"string"},{"internalType":"bytes32[]","name":"attachments","type":"bytes32[]"}],"internalType":"struct Freelance.Bid","name":"finalized_bid","type":"tuple"},{"internalType":"bytes32","name":"project_type","type":"bytes32"},{"internalType":"uint256","name":"deadline","type":"uint256"},{"internalType":"uint256","name":"deposit_budget","type":"uint256"},{"internalType":"string","name":"short_description","type":"string"},{"internalType":"enum Freelance.WorkStatus","name":"status","type":"uint8"}],"internalType":"struct Freelance.Project[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_owner","type":"address"}],"name":"getProjectsOfOwner","outputs":[{"components":[{"internalType":"uint256","name":"project_id","type":"uint256"},{"internalType":"address","name":"owner","type":"address"},{"internalType":"bytes32","name":"title","type":"bytes32"},{"components":[{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"address","name":"bidder","type":"address"},{"internalType":"string","name":"proposal","type":"string"},{"internalType":"bytes32[]","name":"attachments","type":"bytes32[]"}],"internalType":"struct Freelance.Bid","name":"finalized_bid","type":"tuple"},{"internalType":"bytes32","name":"project_type","type":"bytes32"},{"internalType":"uint256","name":"deadline","type":"uint256"},{"internalType":"uint256","name":"deposit_budget","type":"uint256"},{"internalType":"string","name":"short_description","type":"string"},{"internalType":"enum Freelance.WorkStatus","name":"status","type":"uint8"}],"internalType":"struct Freelance.Project[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"_project_id","type":"uint256"}],"name":"getTasksAndPays","outputs":[{"internalType":"string[]","name":"","type":"string[]"},{"internalType":"uint256[]","name":"","type":"uint256[]"},{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getTotalDeposit","outputs":[{"internalType":"uint256","name":"_totalDeposit","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"_name","type":"bytes32"},{"internalType":"bytes32","name":"_profile_photo_ipfs","type":"bytes32"},{"internalType":"bytes32[]","name":"_techstack","type":"bytes32[]"},{"internalType":"bytes32","name":"_profession","type":"bytes32"}],"name":"registerDeveloper","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"_name","type":"bytes32"},{"internalType":"bytes32","name":"_email","type":"bytes32"},{"internalType":"uint256","name":"_phn","type":"uint256"},{"internalType":"bytes32","name":"_licence_doc_ipfs","type":"bytes32"},{"internalType":"bool","name":"_verified","type":"bool"},{"internalType":"bytes32","name":"_company","type":"bytes32"},{"internalType":"bytes32","name":"_url","type":"bytes32"},{"internalType":"enum Freelance.CompanyType","name":"_com_type","type":"uint8"},{"internalType":"bytes32","name":"_profile_photo_ipfs","type":"bytes32"}],"name":"registerProjectOwner","outputs":[{"internalType":"bool","name":"_registered","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"project_id","type":"uint256"}],"name":"signAgreement","outputs":[{"internalType":"bool","name":"_success","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"project_id","type":"uint256"}],"name":"updateProjectStatus","outputs":[{"internalType":"bool","name":"_updated","type":"bool"}],"stateMutability":"payable","type":"function"},{"stateMutability":"payable","type":"receive"}]',
  'Freelance',
);

class Freelance extends _i1.GeneratedContract {
  Freelance({
    required _i1.EthereumAddress address,
    required _i1.Web3Client client,
    int? chainId,
  }) : super(
          _i1.DeployedContract(
            _contractAbi,
            address,
          ),
          client,
          chainId,
        );

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addReview(
    BigInt _project_id,
    String _r, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, '5bb0c5d6'));
    final params = [
      _project_id,
      _r,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addWorksAndPays(
    BigInt _project_id,
    List<String> _works,
    List<BigInt> _pays, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '9d2e4a20'));
    final params = [
      _project_id,
      _works,
      _pays,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> createProject(
    dynamic pd, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, 'f3cbf229'));
    final params = [pd];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> devPlaceBids(
    _i1.EthereumAddress dev,
    BigInt count, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, '8a636e3b'));
    final params = [
      dev,
      count,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> finalizeProjectBid(
    BigInt amount,
    BigInt project_id,
    String proposal,
    List<_i2.Uint8List> attachments,
    _i1.EthereumAddress developer, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, '5d91281c'));
    final params = [
      amount,
      project_id,
      proposal,
      attachments,
      developer,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> getCompletedProjectsCountOfDev(
    _i1.EthereumAddress _dev, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, '22d0a3d0'));
    final params = [_dev];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> getDevBidTokens(
    _i1.EthereumAddress dev, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[7];
    assert(checkSignature(function, '0ef0a239'));
    final params = [dev];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<String> getName({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[8];
    assert(checkSignature(function, '17d7de7c'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as String);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<GetOngoingTaskAndPaymentTillNow> getOngoingTaskAndPaymentTillNow(
    BigInt project_id, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[9];
    assert(checkSignature(function, '74d60749'));
    final params = [project_id];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return GetOngoingTaskAndPaymentTillNow(response);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<dynamic> getProjectDetails(
    BigInt project_id, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[10];
    assert(checkSignature(function, '5f8439e3'));
    final params = [project_id];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as dynamic);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> getProjectStatus(
    BigInt project_id, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[11];
    assert(checkSignature(function, '9675c009'));
    final params = [project_id];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<dynamic>> getProjects({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[12];
    assert(checkSignature(function, 'dcc60128'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as List<dynamic>).cast<dynamic>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<dynamic>> getProjectsOfDev(
    _i1.EthereumAddress _dev, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[13];
    assert(checkSignature(function, '06c5673c'));
    final params = [_dev];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as List<dynamic>).cast<dynamic>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<dynamic>> getProjectsOfOwner(
    _i1.EthereumAddress _owner, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[14];
    assert(checkSignature(function, 'ad2b3e34'));
    final params = [_owner];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as List<dynamic>).cast<dynamic>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<GetTasksAndPays> getTasksAndPays(
    BigInt _project_id, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[15];
    assert(checkSignature(function, 'ff9054c4'));
    final params = [_project_id];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return GetTasksAndPays(response);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> getTotalDeposit({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[16];
    assert(checkSignature(function, 'c022215c'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> registerDeveloper(
    _i2.Uint8List _name,
    _i2.Uint8List _profile_photo_ipfs,
    List<_i2.Uint8List> _techstack,
    _i2.Uint8List _profession, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[17];
    assert(checkSignature(function, '007c96f4'));
    final params = [
      _name,
      _profile_photo_ipfs,
      _techstack,
      _profession,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> registerProjectOwner(
    _i2.Uint8List _name,
    _i2.Uint8List _email,
    BigInt _phn,
    _i2.Uint8List _licence_doc_ipfs,
    bool _verified,
    _i2.Uint8List _company,
    _i2.Uint8List _url,
    BigInt _com_type,
    _i2.Uint8List _profile_photo_ipfs, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[18];
    assert(checkSignature(function, '3b50a728'));
    final params = [
      _name,
      _email,
      _phn,
      _licence_doc_ipfs,
      _verified,
      _company,
      _url,
      _com_type,
      _profile_photo_ipfs,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> signAgreement(
    BigInt project_id, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[19];
    assert(checkSignature(function, '03742de0'));
    final params = [project_id];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> updateProjectStatus(
    BigInt project_id, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[20];
    assert(checkSignature(function, 'f7ce1206'));
    final params = [project_id];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// Returns a live stream of all EnableProjectChat events emitted by this contract.
  Stream<EnableProjectChat> enableProjectChatEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('EnableProjectChat');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return EnableProjectChat(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all ProjectBidFinalized events emitted by this contract.
  Stream<ProjectBidFinalized> projectBidFinalizedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ProjectBidFinalized');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return ProjectBidFinalized(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all ProjectCreated events emitted by this contract.
  Stream<ProjectCreated> projectCreatedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ProjectCreated');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return ProjectCreated(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all ProjectOwnerRegistered events emitted by this contract.
  Stream<ProjectOwnerRegistered> projectOwnerRegisteredEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ProjectOwnerRegistered');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return ProjectOwnerRegistered(
        decoded,
        result,
      );
    });
  }
}

class GetOngoingTaskAndPaymentTillNow {
  GetOngoingTaskAndPaymentTillNow(List<dynamic> response)
      : var1 = (response[0] as String),
        var2 = (response[1] as BigInt),
        var3 = (response[2] as BigInt);

  final String var1;

  final BigInt var2;

  final BigInt var3;
}

class GetTasksAndPays {
  GetTasksAndPays(List<dynamic> response)
      : var1 = (response[0] as List<dynamic>).cast<String>(),
        var2 = (response[1] as List<dynamic>).cast<BigInt>(),
        var3 = (response[2] as BigInt);

  final List<String> var1;

  final List<BigInt> var2;

  final BigInt var3;
}

class EnableProjectChat {
  EnableProjectChat(
    List<dynamic> response,
    this.event,
  )   : owner = (response[0] as _i1.EthereumAddress),
        developer = (response[1] as _i1.EthereumAddress),
        projectid = (response[2] as BigInt);

  final _i1.EthereumAddress owner;

  final _i1.EthereumAddress developer;

  final BigInt projectid;

  final _i1.FilterEvent event;
}

class ProjectBidFinalized {
  ProjectBidFinalized(
    List<dynamic> response,
    this.event,
  )   : assigneddev = (response[0] as _i1.EthereumAddress),
        projectid = (response[1] as BigInt),
        amount = (response[2] as BigInt);

  final _i1.EthereumAddress assigneddev;

  final BigInt projectid;

  final BigInt amount;

  final _i1.FilterEvent event;
}

class ProjectCreated {
  ProjectCreated(
    List<dynamic> response,
    this.event,
  )   : owner = (response[0] as _i1.EthereumAddress),
        projectid = (response[1] as BigInt);

  final _i1.EthereumAddress owner;

  final BigInt projectid;

  final _i1.FilterEvent event;
}

class ProjectOwnerRegistered {
  ProjectOwnerRegistered(
    List<dynamic> response,
    this.event,
  ) : owner = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress owner;

  final _i1.FilterEvent event;
}
