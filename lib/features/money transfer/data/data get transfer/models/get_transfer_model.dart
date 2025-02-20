class GetTransferModel {
  final List<DataGetTransferModel> data; // قائمة الدول

  GetTransferModel({
    required this.data,
  });

  factory GetTransferModel.fromJson(Map<String, dynamic> json) {
    var dataList = (json['data'] as List)
        .map((item) => DataGetTransferModel.fromJson(item))
        .toList();

    return GetTransferModel(
      data: dataList,
    );
  }
}

class DataGetTransferModel {
  final String accCode;
  final String transValue;
  final String transDate;

  DataGetTransferModel({
    required this.accCode,
    required this.transValue,
    required this.transDate,
  });

  // دالة لتحويل JSON إلى CountryModel
  factory DataGetTransferModel.fromJson(Map<String, dynamic> json) {
    return DataGetTransferModel(
      accCode: json['AccCode'],
      transValue: json['TransValue'],
      transDate: json['TransDate'],
    );
  }
}
