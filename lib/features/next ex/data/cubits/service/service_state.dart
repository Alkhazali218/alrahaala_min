import 'package:alrahaala/features/next%20ex/data/models/service_model/service_model.dart';

abstract class ServiceState {}

final class ServiceInitial extends ServiceState {}

final class ServiceLoading extends ServiceState {}

final class ServiceSuccess extends ServiceState {
   List<DataServiceModel> services = [];

  ServiceSuccess({required this.services});
}

final class ServiceFaliures extends ServiceState {
  final String message;

  ServiceFaliures({required this.message});
}
