class DepositModel {
  final String countryId;
  final List<DataDepositModel> data; // قائمة الدول

  DepositModel({
    required this.countryId,
    required this.data,
  });

  factory DepositModel.fromJson(Map<String, dynamic> json) {
    var dataList = (json['data'] as List)
        .map((item) => DataDepositModel.fromJson(item))
        .toList();

    return DepositModel(
      countryId: json['country_id'] ?? '',
      data: dataList,
    );
  }
}

class DataDepositModel {
  final String typeFrom;
  final String valueTo;
  final String insertDate;

  DataDepositModel({
    required this.typeFrom,
    required this.valueTo,
    required this.insertDate,
  });

  // دالة لتحويل JSON إلى CountryModel
  factory DataDepositModel.fromJson(Map<String, dynamic> json) {
    return DataDepositModel(
      typeFrom: json['Type_from'],
     valueTo: json['Values_to'],
      insertDate: json['InsertDate'],
      );
  }
}