class CityModel {
  final List<DataModel> data;

  CityModel({
    required this.data,
  });


  factory CityModel.fromJson( jsonData) {
    var dataList = (jsonData['data'] as List)
        .map((item) => DataModel.fromJson(item))
        .toList();

    return CityModel(
      data: dataList,
    );
  }
}


class DataModel {
  final String cityName;

  DataModel({
    required this.cityName,
  });

  // دالة لتحويل JSON إلى CountryModel
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      cityName: json['CityName'] ?? '',
    );
  }
}



