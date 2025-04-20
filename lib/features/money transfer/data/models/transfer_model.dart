class TransferModel {
  final String accCode;
  final List<DataTransferModel> data;

  TransferModel({
    required this.accCode,
    required this.data,
  });

  factory TransferModel.fromJson(Map<String, dynamic> json) {
    var dataList = (json['data'] as List)
        .map((item) => DataTransferModel.fromJson(item))
        .toList();

    return TransferModel(
      accCode: json['AccCode'] ?? '',
      data: dataList,
    );
  }
}

class DataTransferModel {
  final String accName;
  final String accPhone;
  final String accCode;
  final String bName;
  final String accId;

  DataTransferModel({
    required this.accName,
    required this.accPhone,
    required this.accCode,
    required this.bName,
    required this.accId
  });

  // دالة لتحويل JSON إلى CountryModel
  factory DataTransferModel.fromJson(Map<String, dynamic> json) {
    return DataTransferModel(
      accName: json['AccName'],
      accPhone: json['AccPhone'],
      accCode: json['AccCode'],
      bName: json['BName'],
      accId: json['AccID']
    );
  }
}
