import 'package:alrahaala/features/next/data/cubit/city_state.dart';
import 'package:alrahaala/features/next/data/model/repo/city_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit(this.cityRepo) : super(CityInitial());

  CityRepo cityRepo;

  Future<void> getCity() async {
    emit(CityLoading());
    var result = await cityRepo.featchCity();

    result.fold(
      (failure) {
        emit(CityFaliures(message: failure.errorMessage));
      },
      (success) {
        // تحويل DataModel إلى قائمة من أسماء المدن
        List<String> cityNames =
            success.data.map((city) => city.cityName).toList();
        emit(Citysuccess(cityList: cityNames));
      },
    );
  }
}
