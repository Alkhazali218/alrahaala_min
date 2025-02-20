import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/next/data/data/cubit/next_state.dart';
import 'package:alrahaala/features/next/data/data/repo/next_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextCubit extends Cubit<NextState> {
  NextCubit(this.nextRepo) : super(NextInitial());
  NextRepo nextRepo;
  String? countryId = CacheNetWork.getCacheDaTaInfo(key: 'Countires_ID');
  String? accID = CacheNetWork.getCacheDaTaInfo(key: 'AccID');
  String? branchId = CacheNetWork.getCacheDaTaInfo(key: 'branchID');
  String? currencyId = CacheNetWork.getCacheDaTaInfo(key: 'defualtCurrency');

  Future<void> transferNext({
    required String revicedPhone,
    required String revicedName,
    required String amount,
    required String cityId,
  }) async {
    emit(NextLaoding());

    var result = await nextRepo.featchNext(
      countryId: '1',
      revicedPhone: revicedPhone,
      revicedName: revicedName,
      accID: accID!,
      branchId: branchId!,
      amount: amount,
      cityId: cityId,
      currencyId: currencyId!,
    );

    result.fold(
      (failure) {
        emit(NextFaliures(message: failure.errorMessage));
      },
      (success) {
        emit(NextSuccess());
      },
    );
  }

  Future<NextState?> checkLimit({required String amount}) async {
    String url =
        'http://102.214.165.242:8080/api/device/internal/exchange/limit/check';
    String token = CacheNetWork.getCacheDaTaInfo(key: 'token');

    try {
      var response = await Dio().post(
        url,
        data: {
          "acc_id": accID,
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
              return NextFaliures(
                  // ignore: unnecessary_brace_in_string_interps
                  message: "تم الوصول إلى الحد الأقصى للتحويلات (${typeFrom})");
            }
          }
          return null;
        }
      } else {
        return NextFaliures(message: 'حدث خطأ أثناء التحقق من الحدود');
      }
    } catch (e) {
      return NextFaliures(message: e.toString());
    }
  }
}
