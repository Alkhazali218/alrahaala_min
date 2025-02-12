import 'package:alrahaala/features/next/data/model/repo/next_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'next_state.dart';

class NextCubit extends Cubit<NextState> {
  NextCubit(this.nextRepo) : super(NextInitial());

  NextRepo nextRepo;

  Future<void> getCity() async {
    emit(NextLoading());

    var result = await nextRepo.featchCity();

    result.fold(
      (failure) {
        emit(NextFaliures(message: failure.errorMessage));
      },
      (success) {
        List<String> cityNames = success.data
            .map((city) => city.cityName) // تحويل كل عنصر إلى cityName
            .toList();

        emit(NextSuccess(cityNames: cityNames)); // إرسال القائمة إلى الـ Bloc
      },
    );
  }
}
