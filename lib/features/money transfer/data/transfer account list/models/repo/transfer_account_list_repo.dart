import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/money%20transfer/data/transfer%20account%20list/models/transfer_account_list_models.dart';
import 'package:dartz/dartz.dart';

abstract class TransferAccountListRepo {
  Future<Either<serverFailures,TransferAccountListModels>> fetchTransferAccountList();
}