import 'package:alrahaala/features/next%20ex/data/cubits/service/service_state.dart';
import 'package:alrahaala/features/next%20ex/data/models/service_model/repo/service_repo.dart';
import 'package:alrahaala/features/next%20ex/data/models/service_model/service_model.dart';
import 'package:bloc/bloc.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit(this.serviceRepo) : super(ServiceInitial());
  ServiceRepo serviceRepo;

  Future<void> getService({required String countryId}) async {
    emit(ServiceLoading());
    var result = await serviceRepo.featchService(countryId: countryId);

    result.fold(
      (failures) {
        emit(ServiceFaliures(message: failures.errorMessage));
      },
      (success) {
        List<DataServiceModel> services = success.data;
        emit(ServiceSuccess(services: services));
      },
    );
  }
}

