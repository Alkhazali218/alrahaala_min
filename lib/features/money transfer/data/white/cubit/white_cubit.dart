import 'package:alrahaala/features/money%20transfer/data/white/models/repo/white_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'white_state.dart';

class WhiteCubit extends Cubit<WhiteState> {
  WhiteCubit(this.whiteRepo) : super(WhiteInitial());
  WhiteRepo whiteRepo;

  Future<void> feachWhite({required String accId, required String accIdTo}) async {
    emit(WhiteLoading());
    var result = await whiteRepo.featchTransfer(accId: accId, accIdTo: accIdTo);
    result.fold(
      (failures) => emit(WhiteFaliures(message: failures.errorMessage)),
      (success) => emit(WhiteSuccess()),
    );
  }
}
