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
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 150,
            width: 180,
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
                  const SizedBox(height: 20),
                  Icon(iconSupport, color: kpColor, size: 40),
                  const SizedBox(height: 20),
                  Text(
                    textSupport,
                    style: googleFont30.copyWith(fontSize: 20),
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
