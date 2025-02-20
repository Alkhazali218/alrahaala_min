import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/account%20statement/data/model/statement_model.dart';
import 'package:dartz/dartz.dart';

abstract class StatementRepo {
  Future<Either<serverFailures,StatementModel>> featchStatement();
}