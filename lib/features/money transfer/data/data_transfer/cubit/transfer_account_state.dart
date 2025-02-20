part of 'transfer_account_cubit.dart';

@immutable
sealed class TransferAccountState {}

final class TransferAccountInitial extends TransferAccountState {}

final class TransferAccountLoading extends TransferAccountState {}

final class TransferAccountSuccess extends TransferAccountState {}

final class TransferAccountFaliures extends TransferAccountState {
  final String message;

  TransferAccountFaliures({required this.message});
}
