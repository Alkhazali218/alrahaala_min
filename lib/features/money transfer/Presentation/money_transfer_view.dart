import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_transfer_accounts_list.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_white_list._view.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/money_transfer_view_body.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/cubit/get_transfer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MoneyTransferView extends StatefulWidget {
  const MoneyTransferView({super.key});
  static String id = 'MoneyTransferView';

  @override
  State<MoneyTransferView> createState() => _MoneyTransferViewState();
}

class _MoneyTransferViewState extends State<MoneyTransferView> {
  final isDialOpen = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetTransferCubit>(context).getTransfer();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kcolor,
          foregroundColor: kprimaryColor,
        ),
        body: const MoneyTransferViewBody(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 12, bottom: 12),
          child: ValueListenableBuilder<bool>(
            valueListenable: isDialOpen,
            builder: (context, isOpen, child) {
              return SpeedDial(
                animatedIcon: null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isOpen ? 'الغاء' : 'تحويل',
                      style: googleFont30.copyWith(
                        color: kprimaryColor,
                        fontSize: getRsonsiveFontSize(context, fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 10),
                    if (isOpen)
                      Icon(
                        Icons.close,
                        color: kprimaryColor,
                        size: getRsonsiveFontSize(context, fontSize: 20),
                      )
                    else
                      Icon(
                        Icons.add,
                        color: kprimaryColor,
                        size: getRsonsiveFontSize(context, fontSize: 20),
                      ),
                  ],
                ),
                backgroundColor: kcolor,
                foregroundColor: kprimaryColor,
                overlayColor: Colors.black,
                overlayOpacity: 0.4,
                spacing: 12,
                openCloseDial: isDialOpen,
                children: [
                  SpeedDialChild(
                    backgroundColor: kpColor,
                    foregroundColor: kprimaryColor,
                    label: 'القائمة البيضاء',
                    child: const Icon(Icons.group_add),
                    onTap: () {
                      Navigator.pushNamed(context, CustomWhiteListView.id);
                    },
                  ),
                  SpeedDialChild(
                    backgroundColor: kpColor,
                    foregroundColor: kprimaryColor,
                    label: 'تحويل اموال',
                    child: const Icon(Icons.sync_alt),
                    onTap: () {
                      Navigator.pushNamed(context, CustomTransferAccountsList.id);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
