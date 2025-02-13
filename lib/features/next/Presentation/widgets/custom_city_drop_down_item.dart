import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/next/data/cubit/city_cubit.dart';
import 'package:alrahaala/features/next/data/cubit/city_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCityDropDownItem extends StatefulWidget {
  const CustomCityDropDownItem({super.key});

  @override
  State<CustomCityDropDownItem> createState() => _CustomCityDropDownItemState();
}

class _CustomCityDropDownItemState extends State<CustomCityDropDownItem> {
  String? selectedCity;
  List<String> cityNames = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CityCubit>(context).getCity();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityCubit, CityState>(
      builder: (context, state) {
        if (state is Citysuccess) {
          cityNames = state.cityList;
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
                items: cityNames.map((String cityName) {
                  return DropdownMenuItem<String>(
                    value: cityName,
                    child: Text(cityName),
                  );
                }).toList(),
              ),
            ),
          );
        } else if (state is CityFaliures) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator(color: kpColor));
        }
      },
    );
  }
}
