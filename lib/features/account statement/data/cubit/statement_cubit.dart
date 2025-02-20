import 'package:alrahaala/features/account%20statement/data/model/repo/statement_repo.dart';
import 'package:alrahaala/features/account%20statement/data/model/statement_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'statement_state.dart';

class StatementCubit extends Cubit<StatementState> {
  StatementCubit(this.statementRepo) : super(StatementInitial());
  StatementRepo statementRepo;

  Future<void> getStatment() async {
    emit(StatementLoading());
    var result = await statementRepo.featchStatement();

    result.fold((faliures){
      emit(StatementFaliures(message: faliures.errorMessage));
    }, (success){
      emit(StatementSuccess(success.data));
    });

  }
}
