import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_list_view_transfer_item.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/money_transfer_item.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/cubit/get_transfer_cubit.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/get_transfer_model.dart';
import 'package:alrahaala/features/user%20chat/Presentation/widgets/search_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoneyTransferViewBody extends StatefulWidget {
  const MoneyTransferViewBody({super.key});

  @override
  State<MoneyTransferViewBody> createState() => _MoneyTransferViewBodyState();
}

class _MoneyTransferViewBodyState extends State<MoneyTransferViewBody> {
  List<DataGetTransferModel> filteredData = [];
  List<DataGetTransferModel> dataList = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetTransferCubit>(context).getTransfer();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: height * 0.030),
            SearchTextFiled(
              onChanged: (data) {
                setState(() {
                  addDataFilteredData(input: data);
                });
              },
            ),
            SizedBox(height: height * 0.030),
            Expanded(
              child: BlocBuilder<GetTransferCubit, GetTransferState>(
                builder: (context, state) {
                  if (state is GetTransferSuccess) {
                    dataList = state.getTransfer; // تحديث dataList هنا
                  } else if (state is GetTransferFaliures) {
                    return Center(child: Text(state.message));
                  }
                  return CustomListViewTransferItem(
                    dataList: dataList,
                    filteredData: filteredData.isEmpty ? dataList : filteredData,
                  );
                },
              ),
            ),
          ],
        ),
        const Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: moneyTransferItem(
              text: 'تحويل القيمة',
            ),
          ),
        ),
      ],
    );
  }

  void addDataFilteredData({required String input}) {
    setState(() {
      filteredData = dataList
          .where((element) =>
              element.accCode.toLowerCase().startsWith(input.toLowerCase()))
          .toList();
    });
  }
}

