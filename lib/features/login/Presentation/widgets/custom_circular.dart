import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:flutter/material.dart';

class CustomCircular extends StatelessWidget {
  const CustomCircular({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Container(
          width: double.infinity,
          height: height * 0.08,
          decoration: BoxDecoration(
            color: kcolor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
        child: CircularProgressIndicator(
          color: kpColor,
        ),
      ),
    );
  }
}
