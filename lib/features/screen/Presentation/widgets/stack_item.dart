import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class stackItem extends StatelessWidget {
  const stackItem({
    super.key,
    required this.icons,
    required this.textProject,
    required this.textInside1,
    required this.textInside2,
    required this.onTap,
    required this.textInside3,
  });

  final IconData icons;
  final String textProject;
  final String textInside1;
  final String textInside2;
  final String textInside3;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Container(
              width: double.infinity,
              height: height * 0.30,
              decoration: BoxDecoration(
                border: Border.all(
                  color: colorStack,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: height * 0.05),
                  Icon(
                    icons,
                    color: kpColor,
                    size: getRsonsiveFontSize(context, fontSize: 40),
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    textProject,
                    style: googleFont30.copyWith(
                      color: kcolor,
                      fontSize: getRsonsiveFontSize(context, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        textInside1,
                        style: googleFont30.copyWith(
                          fontSize: getRsonsiveFontSize(context, fontSize: 15),
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        textInside2,
                        style: googleFont18.copyWith(
                          fontSize: getRsonsiveFontSize(context, fontSize: 15),
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    textAlign: TextAlign.right,
                    textInside3,
                    style: googleFont18.copyWith(
                      fontSize: getRsonsiveFontSize(context, fontSize: 15),
                      color: Colors.black54,
                    ),
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
