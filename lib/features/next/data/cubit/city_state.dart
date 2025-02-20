import 'package:alrahaala/features/next/data/model/city_model.dart';

sealed class CityState {}

final class CityInitial extends CityState {}

final class CityLoading extends CityState {}

final class Citysuccess extends CityState {
  List<DataCityModel> cityList; 

  Citysuccess({required this.cityList});
}


final class CityFaliures extends CityState {
  final String message;

  CityFaliures({required this.message});
}
