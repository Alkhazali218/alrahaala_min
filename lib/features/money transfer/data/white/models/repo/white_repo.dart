import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/money%20transfer/data/white/models/white_models.dart';
import 'package:dartz/dartz.dart';

abstract class WhiteRepo {
  Future<Either<serverFailures,WhiteModels>> featchTransfer({required String accId,required String accIdTo});
}