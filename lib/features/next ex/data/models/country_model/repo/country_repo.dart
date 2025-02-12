import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/next%20ex/data/models/country_model/country_model.dart';
import 'package:dartz/dartz.dart';

abstract class CountryRepo {
  Future<Either<serverFailures,CountryModel>> featchCountry({required String countryId});
}