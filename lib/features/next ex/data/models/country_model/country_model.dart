class CountryModel {
  final String countryId;
  final List<DataCountryModel> data;

  CountryModel({
    required this.countryId,
    required this.data,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    var dataList = (json['data'] as List)
        .map((item) => DataCountryModel.fromJson(item))
        .toList();

    return CountryModel(
      countryId: json['country_id'] ?? '',
      data: dataList,
    );
  }
}

class DataCountryModel {
  final String id;
  final String cName;
  final String defualtCurrency;

  DataCountryModel({
    required this.id,
    required this.cName,
    required this.defualtCurrency,
  });

  // دالة لتحويل JSON إلى CountryModel
  factory DataCountryModel.fromJson(Map<String, dynamic> json) {
    return DataCountryModel(
      id: json['ID'] ?? '',
      cName: json['CName'] ?? '',
      defualtCurrency: json['DefualtCurrency'] ?? '',
    );
  }
}

