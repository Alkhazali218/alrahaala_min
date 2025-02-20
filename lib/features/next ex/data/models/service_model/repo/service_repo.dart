import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/next%20ex/data/models/service_model/service_model.dart';
import 'package:dartz/dartz.dart';

abstract class ServiceRepo {
  Future<Either<serverFailures, ServiceModel>> featchService(
      {required String countryId});
}