import 'package:alrahaala/features/foreign%20exchange/data/model/forgien_model.dart';
import 'package:alrahaala/features/foreign%20exchange/data/model/repo/forgien_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forgien_state.dart';

class ForgienCubit extends Cubit<ForgienState> {
  ForgienCubit(this.forgienRepo) : super(ForgienInitial());

  ForgienRepo forgienRepo;

  Future<void> getForgien() async {
    emit(ForgienLoading());

    var result = await forgienRepo.featchForgien();

    result.fold(
      (failures) {
        emit(ForgienFaliures(message: failures.errorMessage));
      },
      (success) {
        emit(ForgienSuccess(forgien: success.data)); // تمرير البيانات الأصلية
      },
    );
  }
}

