import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/model/deposit_model.dart';
import 'package:dartz/dartz.dart';

abstract class DepositRepo {
  Future<Either<serverFailures,DepositModel>> featchDeposit({required String currencyId});
}