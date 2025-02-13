class LoginModel {
  final String phone;
  final String password;
  final String deviceId;
  final InfoModel info;
  final DataLoginModel data;

  LoginModel(
      {required this.phone,
      required this.password,
      required this.deviceId,
      required this.info,
      required this.data});

  factory LoginModel.fromJson(dataJson) {
    var infoData = dataJson['data'] != null && dataJson['data']['info'] != null
        ? dataJson['data']['info']
        : {};

    var data = dataJson['data'] != null && dataJson['data'] != null
        ? dataJson['data']
        : {};

    return LoginModel(
      phone: dataJson['phone'] ?? '',
      password: dataJson['password'] ?? '',
      deviceId: dataJson['device_id'] ?? '',
      info: infoData.isNotEmpty
          ? InfoModel.fromJson(infoData)
          : InfoModel(
              accName: '',
              branchID: '',
              phone: '',
              bName: '',
              cName: '',
              accCode: '',
              countiresId: '',
              curCode: '',
              defualtCurrency: '',
              ),
      data: data.isNotEmpty
          ? DataLoginModel.fromJson(data)
          : DataLoginModel(token: ''),
    );
  }
}

class InfoModel {
  final String accName;
  final String branchID;
  final String phone;
  final String accCode;
  final String bName;
  final String cName;
  final String countiresId;
  final String defualtCurrency;
  final String curCode;

  InfoModel({
    required this.accName,
    required this.branchID,
    required this.phone,
    required this.bName,
    required this.cName,
    required this.accCode,
    required this.countiresId,
    required this.defualtCurrency,
    required this.curCode,
  });

  factory InfoModel.fromJson(dataJson) {
    return InfoModel(
      curCode: dataJson['CurCode'],
      defualtCurrency: dataJson['DefualtCurrency'],
      countiresId: dataJson['Countires_ID'] ?? '',
        accName: dataJson['AccName'] ?? '',
        branchID: dataJson['BranchID'] ?? '',
        phone: dataJson['phone'] ?? '',
        bName: dataJson['BName'] ?? '',
        cName: dataJson['CName'] ?? '',
        accCode: dataJson['AccCode'] ?? '');
        
  }
}

class DataLoginModel {
  final String token;

  DataLoginModel({required this.token});
  factory DataLoginModel.fromJson(dataJson) {
    return DataLoginModel(token: dataJson['token'] ?? '');
  }
}
