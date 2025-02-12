import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/next%20ex/data/cubits/country/country_cubit.dart';
import 'package:alrahaala/features/next%20ex/data/cubits/country/country_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropDownItem extends StatefulWidget {
  const CustomDropDownItem({super.key});

  @override
  State<CustomDropDownItem> createState() => _CustomDropDownItemState();
}

class _CustomDropDownItemState extends State<CustomDropDownItem> {
  String? selectedCountry;
  List<String> countries = [];

  @override
  void initState() {
    super.initState();
    // استدعاء دالة getCountry عند دخول الـ Widget
    BlocProvider.of<CountryCubit>(context).getCountry();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, CountryState>(
      builder: (context, state) {
        if (state is CountryFaliures) {
          String message = state.message;
          return Center(child: Text(message));
        } else if (state is CountrySuccess) {
          countries = state.countries;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: kpColor, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedCountry,
                hint: const Text("اختر الدولة"),
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down, color: kpColor),
                style: const TextStyle(color: Colors.black, fontSize: 16),
                dropdownColor: kprimaryColor,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
                items: countries.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
              ),
            ),
          );
        } else if (state is CountryFaliures) {
          return Center(child: Text(state.message));
        } else {
          return const Center(
              child: CircularProgressIndicator(color: Colors.orange));
        }
      },
    );
  }
}
