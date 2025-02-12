import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/next%20ex/data/cubits/country/country_state.dart';
import 'package:alrahaala/features/next%20ex/data/models/country_model/repo/country_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit(this.countryRepo) : super(CountryInitial());

  CountryRepo countryRepo;

  Future<void> getCountry() async {
    String? countryId = CacheNetWork.getCacheDaTaInfo(key: 'Countires_ID');
    emit(CountryLoading());

    var result = await countryRepo.featchCountry(countryId: countryId);

    result.fold(
      (failures) {
        emit(CountryFaliures(message: failures.errorMessage));
      },
      (success) {
         // تمرير قائمة الدول هنا
        List<String> countries = success.data.map((d) => d.cName).toList();
        emit(CountrySuccess(countries: countries));
      },
    );
  }
}

