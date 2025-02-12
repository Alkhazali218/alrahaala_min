import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/next/data/model/next_model.dart';
import 'package:dartz/dartz.dart';

abstract class NextRepo {
  Future<Either<serverFailures,NextModel>> featchCity();
}