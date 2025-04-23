class TransferAccountListModels {
   final List<DataTransferAccountListModels> data;

  TransferAccountListModels({required this.data});

factory TransferAccountListModels.fromJson(Map<String, dynamic> json) {
    var dataList = (json['data'] as List)
        .map((item) => DataTransferAccountListModels.fromJson(item))
        .toList();

    return TransferAccountListModels(
    data: dataList,
    );
  }
}

class DataTransferAccountListModels {
  final String accName;
  final String accCode;
  final String id;

  DataTransferAccountListModels({required this.accName, required this.accCode, required this.id});
  

  factory DataTransferAccountListModels.fromJson(Map<String, dynamic> json) {
    return DataTransferAccountListModels(
      accName: json['AccName'] ?? '',
      accCode: json['AccCode'] ?? '',
      id: json['ID'] ?? '',
    );
  }
}