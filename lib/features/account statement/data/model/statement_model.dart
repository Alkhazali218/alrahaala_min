class StatementModel {
  final List<DataStatementModel> data; // قائمة الدول

  StatementModel({
    required this.data,
  });

  factory StatementModel.fromJson(Map<String, dynamic> json) {
    var dataList = (json['data'] as List)
        .map((item) => DataStatementModel.fromJson(item))
        .toList();

    return StatementModel(
      data: dataList,
    );
  }
}

class DataStatementModel {
  final String valuesTo;
  final String typeFrom;
  final String insertDate;
  

  DataStatementModel({
    required this.valuesTo,
    required this.typeFrom,
    required this.insertDate,

  });

  // دالة لتحويل JSON إلى CountryModel
  factory DataStatementModel.fromJson(Map<String, dynamic> json) {
    return DataStatementModel(
      valuesTo: json['Values_to'],
      typeFrom: json['Type_from'],
      insertDate: json['InsertDate'],
    );
  }
}