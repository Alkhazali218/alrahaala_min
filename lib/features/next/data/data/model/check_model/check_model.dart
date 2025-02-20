class CheckModel {
  final String accId;
  final String amount;
  final List<DataCheckModel> data; // قائمة الدول

  CheckModel({
    required this.accId,
    required this.amount,
    required this.data,
  });

  factory CheckModel.fromJson(Map<String, dynamic> json) {
    var dataList = (json['data'] as List)
        .map((item) => DataCheckModel.fromJson(item))
        .toList();

    return CheckModel(
      accId: json['acc_id'],
      amount: json['amount'],
      data: dataList,
    );
  }
}

class DataCheckModel {
  final String typeFrom;

  DataCheckModel({
    required this.typeFrom,
  });

  // دالة لتحويل JSON إلى CountryModel
  factory DataCheckModel.fromJson(Map<String, dynamic> json) {
    return DataCheckModel(
      typeFrom: json['type_from'],
    );
  }
}
