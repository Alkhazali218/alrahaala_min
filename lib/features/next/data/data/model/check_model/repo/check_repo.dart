import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/next/data/data/model/check_model/check_model.dart';
import 'package:dartz/dartz.dart';

abstract class CheckRepo {
  Future<Either<serverFailures,CheckModel>> featchCheck({required String accId,required String amount,required String period});
}