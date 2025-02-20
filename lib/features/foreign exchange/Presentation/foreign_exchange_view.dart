import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/foreign%20exchange/Presentation/widgets/foreign_exchange_view_body.dart';
import 'package:alrahaala/features/foreign%20exchange/data/cubit/forgien_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForeignExchangeView extends StatefulWidget {
  const ForeignExchangeView({super.key});
  static String id = 'ForeignExchangeView';

  @override
  State<ForeignExchangeView> createState() => _ForeignExchangeViewState();
}

class _ForeignExchangeViewState extends State<ForeignExchangeView> {
     @override
  void initState() {
    super.initState();
    BlocProvider.of<ForgienCubit>(context).getForgien();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'رصيد النقد الاجنبي',
          style: googleFont30.copyWith(
            color: kprimaryColor,
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
          ),
        ),
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: ForeignExchangeViewBody(),
    );
  }
}
