import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_container_data_transfer.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/cubit/get_transfer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNotifiactionBody extends StatelessWidget {
  const CustomNotifiactionBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          decoration: const BoxDecoration(
            color: kcolor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                'كشف تحويل الاموال',
                style: googleFont30.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kprimaryColor,
                  fontSize: getRsonsiveFontSize(context, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            height: 520,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  ' ايصال عملية تحويل الاموال',
                  style: googleFont30.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: getRsonsiveFontSize(context, fontSize: 20),
                      color: Colors.black),
                ),
                const SizedBox(height: 40),
                BlocBuilder<GetTransferCubit, GetTransferState>(
                    builder: (context, state) {
                  if (state is GetTransferSuccess) {
                    final data = state.getTransfer.isNotEmpty
                        ? state.getTransfer[0]
                        : null;

                    if (data == null) {
                      return const Center(child: Text('لا توجد بيانات'));
                    }
                    return CustomContainerDataTransfer(data: data);
                  } else if (state is GetTransferFaliures) {
                    return Center(
                      child: Text(
                        state.message,
                        style: googleFont30.copyWith(
                          fontSize: getRsonsiveFontSize(context, fontSize: 28),
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(color: kpColor));
                  }
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
