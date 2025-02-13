class ForgienModel {
  final String countryId;
  final List<DataForgienModel> data; // قائمة الدول

  ForgienModel({
    required this.countryId,
    required this.data,
  });

  // دالة لتحويل JSON إلى NextExModel
  factory ForgienModel.fromJson(Map<String, dynamic> json) {
    var dataList = (json['data'] as List)
        .map((item) => DataForgienModel.fromJson(item))
        .toList();

    return ForgienModel(
      countryId: json['country_id'] ?? '',
      data: dataList,
    );
  }
}


class DataForgienModel {
  final String walet;
  final String cuName;
  final String curCode;

  DataForgienModel({
    required this.walet,
    required this.cuName,
    required this.curCode,
  });

  // دالة لتحويل JSON إلى CountryModel
  factory DataForgienModel.fromJson(Map<String, dynamic> json) {
    return DataForgienModel(
      walet: json['Walet'] ?? '',
      cuName: json['CuName'] ?? '',
      curCode: json['CurCode'] ?? '',
    );
  }
}