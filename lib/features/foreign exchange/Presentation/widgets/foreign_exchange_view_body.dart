import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/foreign%20exchange/Presentation/widgets/custom_list_view_foreign_item.dart';
import 'package:alrahaala/features/foreign%20exchange/data/cubit/forgien_cubit.dart';
import 'package:alrahaala/features/foreign%20exchange/data/model/forgien_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForeignExchangeViewBody extends StatefulWidget {
  const ForeignExchangeViewBody({super.key});

  @override
  State<ForeignExchangeViewBody> createState() => _ForeignExchangeViewBodyState();
}

class _ForeignExchangeViewBodyState extends State<ForeignExchangeViewBody> {
  List<DataForgienModel> foreign = []; // تحديث نوع البيانات هنا

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ForgienCubit>(context).getForgien();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgienCubit, ForgienState>(
      builder: (context, state) {
        if (state is ForgienSuccess) {
          foreign = state.forgien; // نعرض الـ data هنا
          return ListView.builder(
            itemCount: foreign.length,
            itemBuilder: (context, index) {
              return CustomListViewForeignItem(data: foreign[index]); // تمرير الـ data بشكل صحيح
            },
          );
        } else if (state is ForgienFaliures) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator(color: kpColor));
        }
      },
    );
  }
}


