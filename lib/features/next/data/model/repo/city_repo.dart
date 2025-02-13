import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/next/data/model/city_model.dart';
import 'package:dartz/dartz.dart';

abstract class CityRepo {
  Future<Either<serverFailures,CityModel>> featchCity();
}