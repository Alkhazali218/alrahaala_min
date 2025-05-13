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
  final String accName;
  final String typeTrns;
  final String code;
  final String commint;
  final String statesSpinng;
  


  DataGetTransferModel({
    required this.accCode,
    required this.transValue,
    required this.transDate,
    required this.accName,
    required this.typeTrns,
    required this.code,
    required this.commint,
    required this.statesSpinng,
  });

  // دالة لتحويل JSON إلى CountryModel
  factory DataGetTransferModel.fromJson(Map<String, dynamic> json) {
    return DataGetTransferModel(
      accCode: json['AccCode'],
      transValue: json['TransValue'],
      transDate: json['TransDate'],
      accName: json['AccName'],
      typeTrns: json['Type_trns'],
      code: json['Code'],
      commint: json['commint'],
      statesSpinng: json['STates_spinng'],
    );
  }
}
