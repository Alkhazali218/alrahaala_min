class ServiceModel {
  final String countryId;
  final List<DataServiceModel> data;

  ServiceModel({
    required this.countryId,
    required this.data,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    var dataList = (json['data'] as List)
        .map((item) => DataServiceModel.fromJson(item))
        .toList();

    return ServiceModel(
      countryId: json['country_id'] ?? '',
      data: dataList,
    );
  }
}

class DataServiceModel {
  final String srName;
  final String type;
  final String srId;

  DataServiceModel({
    required this.srName,
    required this.type,
    required this.srId,
  });


  factory DataServiceModel.fromJson(Map<String, dynamic> json) {
    return DataServiceModel(
      srName: json['SRNAME'] ?? '',
      type: json['Type_String'] ?? '',
      srId: json['SRID'] ?? '',
    );
  }
}