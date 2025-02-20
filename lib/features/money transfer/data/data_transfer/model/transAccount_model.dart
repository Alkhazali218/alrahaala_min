class TransaccountModel {
  final String accId;
  final String accIdTo;
  final String currencyId;
  final String amount;
  final String branchId;

  TransaccountModel(
      {required this.accId,
      required this.accIdTo,
      required this.currencyId,
      required this.amount,
      required this.branchId});

  factory TransaccountModel.fromJson(dataJson) {
    return TransaccountModel(
      accId: dataJson['acc_id'] ?? '',
      accIdTo: dataJson['acc_id_to'] ?? '',
      currencyId: dataJson['currency_id'] ?? '',
      amount: dataJson['amount'] ?? '',
      branchId: dataJson['branch_id'] ?? '',
    );
  }
}
