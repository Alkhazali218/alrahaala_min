import 'package:alrahaala/features/next%20ex/data/models/country_model/country_model.dart';

abstract class CountryState {}

final class CountryInitial extends CountryState {}

final class CountryLoading extends CountryState {}

final class CountrySuccess extends CountryState {
  final List<DataCountryModel> countries;

  CountrySuccess({required this.countries});
}

final class CountryFaliures extends CountryState {
  final String message;

  CountryFaliures({required this.message});
}
