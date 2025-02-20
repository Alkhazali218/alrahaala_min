import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/next%20ex/data/models/insert/repo/insert_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'insert_state.dart';

class InsertCubit extends Cubit<InsertState> {
  InsertCubit(this.insertRepo) : super(InsertInitial());
  InsertRepo insertRepo;

  String? recievedCurrencyId = CacheNetWork.getCacheDaTaInfo(key: 'Countires_ID');
    String? recievedBranchId = CacheNetWork.getCacheDaTaInfo(key: 'branchID');
    String? countryIdFrom = CacheNetWork.getCacheDaTaInfo(key: 'defualtCurrency');
    String? accFrom = CacheNetWork.getCacheDaTaInfo(key: 'AccID');

  Future<void> featchInsert({
    required String recievedName,
    required String rPhone1,
    required String cityIdTo,
    required String deliveredCurrencyId,
    required String countryIdTo,
    required String serviceType,
    required String currRecievedVal,
    required String ownAccNo,
  }) async {

    emit(InsertLoading());
    var result = await insertRepo.featchInsert(
      recievedCurrencyId: recievedCurrencyId!,
      countryIdFrom: countryIdFrom!,
      recievedBranchId: recievedBranchId!,
      recievedName: recievedName,
      rPhone1: rPhone1,
      cityIdTo: cityIdTo,
      deliveredCurrencyId: deliveredCurrencyId,
      countryIdTo: countryIdTo,
      serviceType: serviceType,
      currRecievedVal: currRecievedVal,
      accFrom: accFrom!,
      ownAccNo: ownAccNo,
    );

    result.fold((faliures){
      emit(InsertFaliures(message: faliures.errorMessage));
    }, (faliures){
      emit(InsertSuccess());
    });
  }

  Future<InsertState?> checkLimit({required String amount}) async {
    String url =
        'http://102.214.165.242:8080/api/device/internal/exchange/limit/check';
    String token = CacheNetWork.getCacheDaTaInfo(key: 'token');

    try {
      var response = await Dio().post(
        url,
        data: {
          "acc_id": accFrom,
          "amount": amount,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = response.data;

        // التحقق مما إذا كانت البيانات موجودة أم فارغة
        if (data['data'] == null || (data['data'] as List).isEmpty) {
          // العملية سليمة
          return null;
        } else {
          // البيانات تحتوي على عناصر
          List<dynamic> dataList = data['data'];
          for (var item in dataList) {
            String typeFrom = item['type_from'] ?? '';

            // تحقق من نوع "type_from"
            if (typeFrom == 'Daily' ||
                typeFrom == 'Weekly' ||
                typeFrom == 'Monthly' ||
                typeFrom == 'Yearly') {
              return InsertFaliures(
                  // ignore: unnecessary_brace_in_string_interps
                  message: "تم الوصول إلى الحد الأقصى للتحويلات (${typeFrom})");
            }
          }
          return null;
        }
      } else {
        return InsertFaliures(message: 'حدث خطأ أثناء التحقق من الحدود');
      }
    } catch (e) {
      return InsertFaliures(message: e.toString());
    }
  }
}
