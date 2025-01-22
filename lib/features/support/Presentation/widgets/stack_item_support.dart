import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class stackItemSupport extends StatelessWidget {
  const stackItemSupport(
      {super.key, required this.textSupport, required this.iconSupport,required this.onTap});

  final String textSupport;
  final IconData iconSupport;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: height*0.18,
            width: width*0.45,
            decoration: BoxDecoration(
              border: Border.all(color: colorStack, width: 0.5),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                   SizedBox(height: height *0.030),
                  Icon(iconSupport, color: kpColor, size: getRsonsiveFontSize(context, fontSize: 40)),
                   SizedBox(height: height *0.030),
                  Text(
                    textSupport,
                    style: googleFont30.copyWith(fontSize: getRsonsiveFontSize(context, fontSize: 20)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
