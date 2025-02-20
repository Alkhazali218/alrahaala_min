import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/get_transfer_model.dart';
import 'package:dartz/dartz.dart';

abstract class GetTransferRepo {
  Future<Either<serverFailures,GetTransferModel>> featchGetTransfer();
}