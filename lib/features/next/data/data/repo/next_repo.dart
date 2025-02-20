import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/next/data/data/model/next_model/next_model.dart';
import 'package:dartz/dartz.dart';

abstract class NextRepo {
  Future<Either<serverFailures, NextModel>> featchNext({
    required String countryId,
    required String revicedPhone,
    required String revicedName,
    required String accID,
    required String branchId,
    required String amount,
    required String cityId,
    required String currencyId,
  });
}
