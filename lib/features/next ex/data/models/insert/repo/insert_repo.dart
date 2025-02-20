import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/next%20ex/data/models/insert/insert_model.dart';
import 'package:dartz/dartz.dart';

abstract class InsertRepo {
  Future<Either<serverFailures,InsertModel>> featchInsert({
        required String recievedCurrencyId,
        required String countryIdFrom,
        required String recievedBranchId,
        required String recievedName,
        required String rPhone1,
        required String cityIdTo,
        required String deliveredCurrencyId,
        required String countryIdTo,
        required String serviceType,
        required String currRecievedVal,
        required String accFrom,
        required String ownAccNo,
    });
}