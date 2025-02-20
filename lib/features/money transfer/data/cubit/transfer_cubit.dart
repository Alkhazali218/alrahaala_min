import 'package:alrahaala/features/money%20transfer/data/cubit/transfer_state.dart';
import 'package:alrahaala/features/money%20transfer/data/models/repo/transfer_repo.dart';
import 'package:alrahaala/features/money%20transfer/data/models/transfer_model.dart';
import 'package:bloc/bloc.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit(this.transferRepo) : super(TransferInitial());
  TransferRepo transferRepo;

  Future<void> featchTransfer({required String accCode}) async {
    emit(TransferLoading());
    var result = await transferRepo.featchTransfer(accCode: accCode);

    result.fold(
      (faliures) {
        emit(TransferFaliures(message: faliures.errorMessage));
      },
      (success) {
        List<DataTransferModel> transfer = success.data;
        emit(TransferSucces(transfer));
      },
    );
  }
}
