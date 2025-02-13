class UserModel {
  final String countryId;
  final List<DataUserModel> data;

  UserModel({
    required this.countryId,
    required this.data,
  });

  // دالة لتحويل JSON إلى NextExModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    var dataList = (json['data'] as List)
        .map((item) => DataUserModel.fromJson(item))
        .toList();

    return UserModel(
      countryId: json['country_id'] ?? '',
      data: dataList,
    );
  }
}


class DataUserModel {
  final String walet;

  DataUserModel({
    required this.walet,
  });

  // دالة لتحويل JSON إلى CountryModel
  factory DataUserModel.fromJson(Map<String, dynamic> json) {
    return DataUserModel(
      walet: json['Walet'] ?? '',
    );
  }
}