import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_text_transfer_account_list.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_transfer_user_item.dart';
import 'package:alrahaala/features/money%20transfer/data/cubit/transfer_cubit.dart';
import 'package:alrahaala/features/money%20transfer/data/delet%20list/cubit/delet_list_cubit.dart';
import 'package:alrahaala/features/money%20transfer/data/transfer%20account%20list/models/transfer_account_list_models.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListViewTransferAccountItem extends StatelessWidget {
  final DataTransferAccountListModels data;
  bool hasShownMessage = false;

  CustomListViewTransferAccountItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        BlocProvider.of<TransferCubit>(context).featchTransfer(accCode: data.accCode);
        Navigator.pushNamed(context, CustomTransferUserItem.id, arguments: data.accCode);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          width: double.infinity,
          height: height * 0.10,
          decoration: BoxDecoration(
            color: Colors.white, // إضافة لون خلفية للصندوق
            border: Border.all(color: kcolor),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // BlocConsumer للتحكم في حالة الحذف
                BlocConsumer<DeletListCubit, DeletListState>(
                  listener: (context, state) {
                    if (state is DeletListSuccess && !hasShownMessage) {
                      hasShownMessage = true; // تأكد من أن الرسالة تظهر مرة واحدة فقط
                      if (context.mounted) {
                        Navigator.pushReplacementNamed(context, homeView.id);
                      }
                      AnimatedSnackBar.material(
                        'تمت عملية الحذف بنجاح',
                        type: AnimatedSnackBarType.success,
                      ).show(context);
                    } else if (state is DeletListFaliures && !hasShownMessage) {
                      hasShownMessage = true; // تأكد من أن الرسالة تظهر مرة واحدة فقط
                      AnimatedSnackBar.material(
                        state.message,
                        type: AnimatedSnackBarType.error,
                      ).show(context);
                    }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        // فتح نافذة التأكيد للحذف
                        _showDeleteConfirmationDialog(context);
                      },
                      child: const Icon(
                        Icons.delete_outline,
                        size: 30,
                        color: kpColor,
                      ),
                    );
                  },
                ),
                // تخصيص النص الخاص بالحساب
                CustomTextTransferAccountList(data: data),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // دالة لعرض نافذة التأكيد
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kprimaryColor,
          title: const Text('تأكيد الحذف'),
          content: const Text('هل أنت متأكد أنك تريد حذف هذا الحساب؟'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق النافذة
              },
              child: Text('لا',
              style: googleFont30.copyWith(
                color: kpColor,
              ),
              ),
            ),
            TextButton(
              onPressed: () {
                // تنفيذ عملية الحذف
                BlocProvider.of<DeletListCubit>(context)
                    .deletList(id: data.id);
                Navigator.of(context).pop();
              },
              child: Text('نعم',
              style: googleFont30.copyWith(
                color: kpColor,
              ),
              ),
            ),
          ],
        );
      },
    );
  }
}

