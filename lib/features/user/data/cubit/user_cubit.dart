import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/user/data/model/repo/user_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepo) : super(UserInitial());

  UserRepo userRepo;
  Future<void> getUser() async {
    String? countryId = CacheNetWork.getCacheDaTaInfo(key: 'Countires_ID');
    emit(UserLoading());
    var reslut = await userRepo.featchUser(countryID: countryId);

    reslut.fold(
      (faliures) {
        emit(UserFaliures(message: faliures.errorMessage));
      },
      (success) {
        List<String> user = success.data.map((d) => d.walet).toList();
        emit(UserSuccess(user: user));
      },
    );
  }
}
