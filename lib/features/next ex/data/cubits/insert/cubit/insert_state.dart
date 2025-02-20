part of 'insert_cubit.dart';

@immutable
sealed class InsertState {}

final class InsertInitial extends InsertState {}

final class InsertLoading extends InsertState {}

final class InsertSuccess extends InsertState {}

final class InsertFaliures extends InsertState {
  final String message;

  InsertFaliures({required this.message});
}
