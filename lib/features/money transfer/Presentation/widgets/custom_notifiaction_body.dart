import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_container_data_transfer.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/get_transfer_model.dart';
import 'package:flutter/material.dart';

class CustomNotifiactionBody extends StatelessWidget {
  const CustomNotifiactionBody({super.key, required this.data});
  final DataGetTransferModel data;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.12,
            decoration: const BoxDecoration(
              color: kcolor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                Column(
                  children: [
                    SizedBox(height: height * 0.05),
                    Text(
                      'كشف تحويل الاموال',
                      style: googleFont30.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kprimaryColor,
                        fontSize: getRsonsiveFontSize(context, fontSize: 20),
                      ),
                    ),
                   
                  ],
                ),
                
                
              ],
            ),
          ),
          SizedBox(height: height * 0.03),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                // في حال المحتوى أطول من الشاشة
                child: Column(
                  children: [
                    SizedBox(height: height * 0.03),
                    Text(
                      'ايصال عملية تحويل الاموال',
                      style: googleFont30.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: getRsonsiveFontSize(context, fontSize: 20),
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    CustomContainerDataTransfer(data: data),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
