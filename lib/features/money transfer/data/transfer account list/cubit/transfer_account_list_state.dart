part of 'transfer_account_list_cubit.dart';

@immutable
sealed class TransferAccountListState {}

final class TransferAccountListInitial extends TransferAccountListState {}
final class TransferAccountListLoading extends TransferAccountListState {}
final class TransferAccountListSucces extends TransferAccountListState {
  final List<DataTransferAccountListModels> data;

  TransferAccountListSucces(this.data);
}
final class TransferAccountListFialures extends TransferAccountListState {
  final String message;
  TransferAccountListFialures({required this.message});
}
