import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/get_transfer_model.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/repo/get_transfer_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_transfer_state.dart';

class GetTransferCubit extends Cubit<GetTransferState> {
  GetTransferCubit(this.getTransferRepo) : super(GetTransferInitial());
  GetTransferRepo getTransferRepo;

  Future<void> getTransfer() async {
    emit(GetTransferLoading());
    var result = await getTransferRepo.featchGetTransfer();

    result.fold(
      (faliures) {
        emit(GetTransferFaliures(message: faliures.errorMessage));
      },
      (succes) {
        emit(GetTransferSuccess(succes.data));
      },
    );
  }
}
