import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/money%20transfer/data/delet%20list/model/delet_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class DeletListRepo {
  Future<Either<serverFailures,DeletListModel>> deletList({required String id});
}