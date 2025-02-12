import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({super.key, required this.onChanged});
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: kprimaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: width * 0.30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  onChanged: onChanged,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Icon(
              FontAwesomeIcons.search,
              color: kpColor,
            ),
          ],
        ),
      ),
    );
  }
}
