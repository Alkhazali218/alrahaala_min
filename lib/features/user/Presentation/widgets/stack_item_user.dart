import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/user/Presentation/widgets/cloum_item_user.dart';
import 'package:alrahaala/features/user/data/cubit/user_cubit.dart';
import 'package:alrahaala/features/user/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class stackItemUser extends StatelessWidget {
   stackItemUser({super.key});
  
  DataUserModel? user;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: height * 0.50,
            decoration: BoxDecoration(
              border: Border.all(
                color: colorStack,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
           if (state is UserSuccess) {
              return Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: CloumItemUser(
              text: 'الرصيد الحالي',
              textMoney: user!.walet,
            ),
          ),
        );
           } else if(state is UserFaliures) {
            return Center(child: Text(state.message));
           } else {
            return const Center(child: CircularProgressIndicator(color: kpColor));
           }
          },
        )
      ],
    );
  }
}
