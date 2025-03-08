import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/next/data/cubit/city_cubit.dart';
import 'package:alrahaala/features/next/data/cubit/city_state.dart';
import 'package:alrahaala/features/next/data/model/city_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCityDropDownItem extends StatefulWidget {
  final Function(String) onCitySelected; // Callback function

  const CustomCityDropDownItem({super.key, required this.onCitySelected});

  @override
  State<CustomCityDropDownItem> createState() => _CustomCityDropDownItemState();
}

class _CustomCityDropDownItemState extends State<CustomCityDropDownItem> {
  String? selectedCity;
  String? selectedCityId;
  List<DataCityModel> cityList = [];

  @override
  void initState() {
    super.initState();
    String id = CacheNetWork.getCacheDaTaInfo(key: 'Countires_ID');
    String countries = CacheNetWork.getCacheDaTaInfo(key: 'Countries');
    BlocProvider.of<CityCubit>(context).getCity(
      countryId: id,
      cityId: countries,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityCubit, CityState>(
      builder: (context, state) {
        if (state is Citysuccess) {
          cityList = state.cityList;
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
                    selectedCityId = cityList
                        .firstWhere((city) => city.cityName == newValue)
                        .id;
                  });

                  if (selectedCityId != null) {
                    widget.onCitySelected(selectedCityId!);
                  }
                },
                items: cityList.map((DataCityModel city) {
                  return DropdownMenuItem<String>(
                    value: city.cityName, // تأكد من أن هذا فريد
                    child: Text(city.cityName),
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
