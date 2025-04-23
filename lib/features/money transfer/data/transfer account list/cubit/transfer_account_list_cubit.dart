import 'package:alrahaala/features/money%20transfer/data/transfer%20account%20list/models/repo/transfer_account_list_repo.dart';
import 'package:alrahaala/features/money%20transfer/data/transfer%20account%20list/models/transfer_account_list_models.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'transfer_account_list_state.dart';

class TransferAccountListCubit extends Cubit<TransferAccountListState> {
  TransferAccountListCubit(this.transferAccountListRepo) : super(TransferAccountListInitial());
  TransferAccountListRepo transferAccountListRepo;
  Future<void> fetchTransferAccountList() async {
    emit(TransferAccountListLoading());
    var result = await transferAccountListRepo.fetchTransferAccountList();
    result.fold(
      (failure) => emit(TransferAccountListFialures(message: failure.errorMessage)),
      (suucess) => emit(TransferAccountListSucces(suucess.data)),
    );
  }
}
