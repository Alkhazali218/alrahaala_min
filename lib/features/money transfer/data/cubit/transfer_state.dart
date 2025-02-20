
import 'package:alrahaala/features/money%20transfer/data/models/transfer_model.dart';

abstract class TransferState {}

final class TransferInitial extends TransferState {}

final class TransferLoading extends TransferState {}

final class TransferSucces extends TransferState {
  List<DataTransferModel> transfer = [];
  TransferSucces(this.transfer);
}

final class TransferFaliures extends TransferState {
  final String message;

  TransferFaliures({required this.message});
}

