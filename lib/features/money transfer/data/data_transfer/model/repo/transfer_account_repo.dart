import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/money%20transfer/data/data_transfer/model/transAccount_model.dart';
import 'package:dartz/dartz.dart';

abstract class TransferAccountRepo {
  Future<Either<serverFailures,TransaccountModel>> featchTransferAccount({required String accId,
    required String currencyId,
    required String accIdTo,
    required String amount,
    required String branchId});
}