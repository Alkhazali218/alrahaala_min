import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/user/Presentation/widgets/stack_item_user.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable, camel_case_types
class userViewBody extends StatelessWidget {
  userViewBody({super.key});

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: ListView(
        children: [
          const SizedBox(height: 40),
           stackItemUser(),
          const SizedBox(height: 20),
          Text(
            'تسجيل الخروج',
            style: googleFont30.copyWith(
                color: kpColor,
                fontSize: getRsonsiveFontSize(context, fontSize: 16)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
