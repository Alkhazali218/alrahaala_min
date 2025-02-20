import 'package:alrahaala/features/next/data/cubit/city_state.dart';
import 'package:alrahaala/features/next/data/model/repo/city_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit(this.cityRepo) : super(CityInitial());

  CityRepo cityRepo;

  Future<void> getCity({
    required String countryId,
    required String cityId,
  }) async {
    emit(CityLoading());
    var result = await cityRepo.featchCity(
      countryId: countryId,
      cityId: cityId,
    );

    result.fold(
      (failure) {
        emit(CityFaliures(message: failure.errorMessage));
      },
      (success) {
        emit(Citysuccess(cityList: success.data));
      },
    );
  }
}
