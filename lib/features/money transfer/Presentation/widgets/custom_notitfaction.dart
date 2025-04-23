import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_notifiaction_body.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/cubit/get_transfer_cubit.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/get_transfer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNotification extends StatefulWidget {
  const CustomNotification({super.key});
  static String id = 'custom_notification';

  @override
  State<CustomNotification> createState() => _CustomNotificationState();
}

class _CustomNotificationState extends State<CustomNotification> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetTransferCubit>(context).getTransfer();
  }
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as DataGetTransferModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: CustomNotifiactionBody(data: data),
    );
  }
}
