import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // مهم لنسخ النص

class TextItem extends StatelessWidget {
  const TextItem({
    super.key,
    required this.textItemOne,
    required this.textitemTwo,
  });

  final String textItemOne;
  final String textitemTwo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                textItemOne,
                style: googleFont30.copyWith(
                  fontSize: getRsonsiveFontSize(context, fontSize: 14),
                  color: Colors.black54,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: textItemOne));
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(
                      content: Text('تم نسخ النص'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Icon(
                  Icons.copy_sharp,
                  color: kpColor,
                  size: 15,
                ),
              ),
            ],
          ),
          Text(
            textitemTwo,
            style: googleFont30.copyWith(
              color: Colors.black87,
              fontSize: getRsonsiveFontSize(context, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

