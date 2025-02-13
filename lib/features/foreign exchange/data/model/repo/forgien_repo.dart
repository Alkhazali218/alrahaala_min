import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/foreign%20exchange/data/model/forgien_model.dart';
import 'package:dartz/dartz.dart';

abstract class ForgienRepo {
  Future<Either<serverFailures,ForgienModel>> featchForgien();
}