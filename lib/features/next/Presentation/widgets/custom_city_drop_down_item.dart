import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/next/data/cubit/next_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCityDropDownItem extends StatefulWidget {
const  CustomCityDropDownItem({super.key});

  @override
  State<CustomCityDropDownItem> createState() => _CustomCityDropDownItemState();
}

class _CustomCityDropDownItemState extends State<CustomCityDropDownItem> {
  String? selectedCity;

  @override
  void initState() {
    super.initState();
    // استدعاء دالة getCity عند دخول الـ Widget
    BlocProvider.of<NextCubit>(context).getCity();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NextCubit, NextState>(
      builder: (context, state) {
        if (state is NextSuccess) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: kpColor, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedCity,
                hint: const Text('اختر المدينة'),
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down, color: kpColor),
                style: const TextStyle(color: Colors.black, fontSize: 16),
                dropdownColor: kprimaryColor,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCity = newValue;
                  });
                },
                items: state.cityNames.map((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
              ),
            ),
          );
        } else if (state is NextFaliures) {
          String message = state.message;
          return Center(child: Text(message));
        } else {
          return const Center(
              child: CircularProgressIndicator(color: Colors.orange));
        }
      },
    );
  }
}
