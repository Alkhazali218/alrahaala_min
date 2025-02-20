class CityModel {
  final String countryId;
  final String cityId;
  final List<DataCityModel> data;

  CityModel({
    required this.countryId,
    required this.cityId,
    required this.data,
  });


  factory CityModel.fromJson( jsonData) {
    var dataList = (jsonData['data'] as List)
        .map((item) => DataCityModel.fromJson(item))
        .toList();

    return CityModel(
      countryId: jsonData['country_id'] ?? '',
      cityId: jsonData['exclude_city_id'] ?? '',
      data: dataList,
    );
  }
}


class DataCityModel {
  final String cityName;
  final String id;

  DataCityModel({
    required this.cityName,
    required this.id,
  });

  // دالة لتحويل JSON إلى CountryModel
  factory DataCityModel.fromJson(Map<String, dynamic> json) {
    return DataCityModel(
      cityName: json['CityName'] ?? '',
      id: json['ID'] ?? '',
    );
  }
}



