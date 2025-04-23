import 'package:alrahaala/core/utils/helper/constant.dart';
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

  const CustomListViewTransferAccountItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: (){
        BlocProvider.of<TransferCubit>(context).featchTransfer(accCode: data.accCode);
        Navigator.pushNamed(context, CustomTransferUserItem.id,arguments: data.accCode);
        
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          width: double.infinity,
          height: height * 0.08,
          decoration: BoxDecoration(
            border: Border.all(color: kcolor),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocConsumer<DeletListCubit, DeletListState>(
                  listener: (context, state) {
                    if (state is DeletListSuccess) {
                      Navigator.pushNamed(context, homeView.id);
                      AnimatedSnackBar.material('تمت عملية الحذف بنجاح',
                              type: AnimatedSnackBarType.success)
                          .show(context);
                    } else if (state is DeletListFaliures) {
                      AnimatedSnackBar.material(state.message,
                              type: AnimatedSnackBarType.error)
                          .show(context);
                    }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        
                        BlocProvider.of<DeletListCubit>(context)
                            .deletList(id: data.id);
                      },
                      child: const Flexible(
                        child: FittedBox(
                          child: Icon(
                            Icons.delete_outline,
                            size: 30,
                            color: kpColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                CustomTextTransferAccountList(data: data),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
