part of 'get_transfer_cubit.dart';

@immutable
sealed class GetTransferState {}

final class GetTransferInitial extends GetTransferState {}

final class GetTransferLoading extends GetTransferState {}

final class GetTransferSuccess extends GetTransferState {
  List<DataGetTransferModel> getTransfer = [];
  GetTransferSuccess(this.getTransfer);
}

final class GetTransferFaliures extends GetTransferState {
  final String message;

  GetTransferFaliures({required this.message});
}
