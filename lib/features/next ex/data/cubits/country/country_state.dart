abstract class CountryState {}

final class CountryInitial extends CountryState {}

final class CountryLoading extends CountryState {}

final class CountrySuccess extends CountryState {
  final List<String> countries; // أو List<CountryModel> حسب الحاجة

  CountrySuccess({required this.countries});
}

final class CountryFaliures extends CountryState {
  final String message;

  CountryFaliures({required this.message});
}
