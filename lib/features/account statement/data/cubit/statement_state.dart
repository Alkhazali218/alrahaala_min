part of 'statement_cubit.dart';

@immutable
sealed class StatementState {}

final class StatementInitial extends StatementState {}

final class StatementLoading extends StatementState {}

final class StatementSuccess extends StatementState {
  List<DataStatementModel> statement = [];
  StatementSuccess(this.statement);
}

final class StatementFaliures extends StatementState {
  final String message;

  StatementFaliures({required this.message});
}