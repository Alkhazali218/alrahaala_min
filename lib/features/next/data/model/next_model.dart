class NextModel {
  final List<CityModel> data; // قائمة المدن

  NextModel({required this.data});

  factory NextModel.fromJson(Map<String, dynamic> json) {
    var dataList =
        (json['data'] as List).map((item) => CityModel.fromJson(item)).toList();

    print("Cities data: $dataList"); // تحقق من البيانات في الـ console

    return NextModel(data: dataList);
  }

  // دالة لتحويل NextModel إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'data':
          data.map((city) => city.toJson()).toList(), // تحويل كل مدينة إلى JSON
    };
  }
}

class CityModel {
  final String cityName;

  CityModel({required this.cityName});

  // دالة لتحويل JSON إلى CityModel
  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      cityName: json['CityName'] ?? '',
    );
  }

  // دالة لتحويل CityModel إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'CityName': cityName,
    };
  }
}
