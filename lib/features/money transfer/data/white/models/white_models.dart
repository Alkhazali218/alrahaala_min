class WhiteModels {
  final String accId;
  final String accIdTo;

  WhiteModels({required this.accId, required this.accIdTo});

  factory WhiteModels.fromJson(dataJson) {
    return WhiteModels(
      accId: dataJson['acc_id'] ?? '',
      accIdTo: dataJson['acc_to'] ?? '',
    );
  }
}