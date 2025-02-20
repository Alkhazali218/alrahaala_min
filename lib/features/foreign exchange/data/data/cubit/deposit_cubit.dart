import 'package:alrahaala/features/foreign%20exchange/data/data/cubit/deposit_state.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/model/deposit_model.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/model/repo/deposit_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepositCubit extends Cubit<DepositState> {
  DepositCubit(this.depositRepo) : super(DepositInitial());
  DepositRepo depositRepo;

  Future<void> getDeposit({required String currencyId}) async {
    emit(DepositLoading());
    var result = await depositRepo.featchDeposit(currencyId: currencyId);

    result.fold(
      (faliures) {
        emit(DepositFaliures(message: faliures.errorMessage));
      },
      (success) {
        List<DataDepositModel> deposit = success.data;
        emit(DepositSuccess(deposit));
      },
    );
  }
}
