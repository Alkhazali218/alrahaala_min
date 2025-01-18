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
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Container(
              width: double.infinity,
              height: 250,
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
                  const SizedBox(height: 30),
                  Icon(icons, color: kpColor, size: getRsonsiveFontSize(context, fontSize: 40)),
                  const SizedBox(height: 10),
                  Text(
                    textProject,
                    style: googleFont30.copyWith(color: kcolor, fontSize: getRsonsiveFontSize(context, fontSize: 18)),
                  ),
                  const SizedBox(height: 60),
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
                 const SizedBox(height: 30),
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
