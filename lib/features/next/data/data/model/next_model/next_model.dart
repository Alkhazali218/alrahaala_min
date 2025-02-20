class NextModel {
  final String countryId;
  final String revicedPhone;
  final String revicedName;
  final String accID;
  final String branchId;
  final String amount;
  final String cityId;
  final String currencyId;

  NextModel(
      {required this.countryId,
      required this.revicedPhone,
      required this.revicedName,
      required this.accID,
      required this.branchId,
      required this.amount,
      required this.cityId,
      required this.currencyId});

  factory NextModel.fromJson(dataJson) {
    return NextModel(
      countryId: dataJson['country_id'] ?? '',
      revicedPhone: dataJson['reviced_phone'] ?? '',
      revicedName: dataJson['reviced_name'] ?? '',
      accID: dataJson['AccID'] ?? '',
      branchId: dataJson['branch_id'] ?? '',
      amount: dataJson['amount'] ?? '',
      cityId: dataJson['city_id'] ?? '',
      currencyId: dataJson['currency_id'] ?? '',
    );
  }
}