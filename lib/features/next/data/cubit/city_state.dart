

sealed class CityState {}

final class CityInitial extends CityState {}

final class CityLoading extends CityState {}

final class Citysuccess extends CityState {
  List<String> cityList;
  Citysuccess({required this.cityList});
}

final class CityFaliures extends CityState {
  final String message;

  CityFaliures({required this.message});
}
