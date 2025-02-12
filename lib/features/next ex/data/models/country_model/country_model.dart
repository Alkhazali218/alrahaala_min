class CountryModel {
  final String countryId;
  final List<DataModel> data; // قائمة الدول

  CountryModel({
    required this.countryId,
    required this.data,
  });

  // دالة لتحويل JSON إلى NextExModel
  factory CountryModel.fromJson(Map<String, dynamic> json) {
    var dataList = (json['data'] as List)
        .map((item) => DataModel.fromJson(item))
        .toList();

    return CountryModel(
      countryId: json['country_id'] ?? '',  // تعيين قيمة country_id من الـ JSON
      data: dataList,
    );
  }
}


class DataModel {
  final String id;
  final String cName;

  DataModel({
    required this.id,
    required this.cName,
  });

  // دالة لتحويل JSON إلى CountryModel
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['ID'] ?? '',  // تعيين القيمة الفارغة إذا كانت غير موجودة
      cName: json['CName'] ?? '',
    );
  }
}

