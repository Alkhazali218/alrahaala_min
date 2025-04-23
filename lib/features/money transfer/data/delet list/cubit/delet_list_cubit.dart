import 'package:alrahaala/features/money%20transfer/data/delet%20list/repo/delet_list_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delet_list_state.dart';

class DeletListCubit extends Cubit<DeletListState> {
  DeletListCubit(this.deletListRepo) : super(DeletListInitial());
  DeletListRepo deletListRepo;
  Future<void> deletList({required String id}) async {
    emit(DeletListLoading());
    var result = await deletListRepo.deletList(id: id);
    result.fold(
      (failures) => emit(DeletListFaliures(message: failures.errorMessage)),
      (success) => emit(DeletListSuccess()),
    );
  }
}
