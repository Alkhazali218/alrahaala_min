import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/money%20transfer/data/data_transfer/model/repo/transfer_account_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'transfer_account_state.dart';

class TransferAccountCubit extends Cubit<TransferAccountState> {
  TransferAccountCubit(this.transferAccountRepo)
      : super(TransferAccountInitial());
  TransferAccountRepo transferAccountRepo;

  String? accId = CacheNetWork.getCacheDaTaInfo(key: 'AccID');
  String? currencyId = CacheNetWork.getCacheDaTaInfo(key: 'Countires_ID');
  String? branchId = CacheNetWork.getCacheDaTaInfo(key: 'branchID');
  Future<void> transferAccount(
      {required String accIdTo, required String amount}) async {
    emit(TransferAccountLoading());
    var result = await transferAccountRepo.featchTransferAccount(
      accId: accId!,
      currencyId: currencyId!,
      accIdTo: accIdTo,
      amount: amount,
      branchId: branchId!,
    );
    result.fold((faliures) {
      emit(TransferAccountFaliures(message: faliures.errorMessage));
    }, (success) {
      emit(TransferAccountSuccess());
    });
  }

  Future<TransferAccountState?> checkLimit({required String amount}) async {
    String url =
        'http://102.214.165.242:8080/api/device/internal/exchange/limit/check';
    String token = CacheNetWork.getCacheDaTaInfo(key: 'token');

    try {
      var response = await Dio().post(
        url,
        data: {
          "acc_id": accId,
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
              return TransferAccountFaliures(
                  // ignore: unnecessary_brace_in_string_interps
                  message: "تم الوصول إلى الحد الأقصى للتحويلات (${typeFrom})");
            }
          }
          return null;
        }
      } else {
        return TransferAccountFaliures(message: 'حدث خطأ أثناء التحقق من الحدود');
      }
    } catch (e) {
      return TransferAccountFaliures(message: e.toString());
    }
  }
}
