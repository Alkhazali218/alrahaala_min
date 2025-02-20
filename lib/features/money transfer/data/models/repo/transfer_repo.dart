import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/money%20transfer/data/models/transfer_model.dart';
import 'package:dartz/dartz.dart';

abstract class TransferRepo {
  Future<Either<serverFailures,TransferModel>> featchTransfer({required String accCode});
}