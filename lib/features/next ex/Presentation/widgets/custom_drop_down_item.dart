import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/next%20ex/data/cubits/country/country_cubit.dart';
import 'package:alrahaala/features/next%20ex/data/cubits/country/country_state.dart';
import 'package:alrahaala/features/next%20ex/data/cubits/service/service_cubit.dart';
import 'package:alrahaala/features/next%20ex/data/cubits/service/service_state.dart';
import 'package:alrahaala/features/next/data/cubit/city_cubit.dart';
import 'package:alrahaala/features/next/data/cubit/city_state.dart';
import 'package:alrahaala/features/next/data/model/city_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropDownItem extends StatefulWidget {
final Function(String) onCitySelected;
final Function(String) ondeliveredCurrencyId;
final Function(String) oncountryIdToId;
final Function(String) onserviceType; 
  final TextEditingController bankController;
  const CustomDropDownItem({
    super.key,
    required this.onCitySelected,
    required this.ondeliveredCurrencyId,
    required this.oncountryIdToId,
    required this.onserviceType,
    required this.bankController,
  });

  @override
  State<CustomDropDownItem> createState() => _CustomDropDownItemState();
}

class _CustomDropDownItemState extends State<CustomDropDownItem> {
  String? selectedCountryId;
  String? selectedCountryName;
  String? selectedService;
  DataCityModel? selectedCity;
  String? selectedBank;
  String? serviceType;
  List<String> services = [];
  List<DataCityModel> cities = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CountryCubit>(context).getCountry();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    String countries = CacheNetWork.getCacheDaTaInfo(key: 'Countries');
    return Column(
      children: [
        // Dropdown للدولة
        BlocBuilder<CountryCubit, CountryState>(builder: (context, state) {
          if (state is CountrySuccess) {
            List<String> countryNames = state.countries
                .map((country) => country.cName)
                .toSet()
                .toList();

            return buildDropdown<String>(
              // هنا تم استخدام buildDropdown
              value: selectedCountryName,
              hint: selectedCountryName ?? "اختر الدولة",
              items: countryNames,
              onChanged: (value) {
                final selectedCountry = state.countries.firstWhere(
                  (country) => country.cName == value,
                );

                setState(
                  () {
                    selectedCountryId = selectedCountry.id;
                    selectedCountryName = selectedCountry.cName;
                    selectedService = null;
                    selectedCity = null;
                    selectedBank = null;
                  },
                );

                // إرسال استعلامات الـ Service و الـ City
                BlocProvider.of<ServiceCubit>(context)
                    .getService(countryId: selectedCountryId!);
                BlocProvider.of<CityCubit>(context)
                    .getCity(countryId: selectedCountryId!, cityId: countries);

              widget.ondeliveredCurrencyId(selectedCountry.defualtCurrency);
              widget.oncountryIdToId(selectedCountry.id);
              },
            );
          } else if (state is CountryFaliures) {
            return Center(child: Text(state.message));
          } else {
            return const Center(
                child: CircularProgressIndicator(color: kpColor));
          }
        }),

        SizedBox(height: height * 0.02),

        // Dropdown للخدمة
        if (selectedCountryId != null)
          BlocBuilder<ServiceCubit, ServiceState>(builder: (context, state) {
            if (state is ServiceSuccess) {
              services = state.services.map((d) => d.srName).toList();
              return buildDropdown<String>(
                value: selectedService,
                hint: "اختر الخدمة",
                items: services,
                onChanged: (value) {
                  final selectedServiceData = state.services.firstWhere(
                    (service) => service.srName == value,
                  );

                  setState(() {
                    selectedService = value;
                    selectedCity = null;
                    serviceType = getServiceType(value); // تعيين نوع الخدمة
                  });
                  widget.onserviceType(selectedServiceData.srId);
                },
              );
            } else if (state is ServiceFaliures) {
              return Center(child: Text(state.message));
            } else {
              return const Center(
                  child: CircularProgressIndicator(color: kpColor));
            }
          }),

        SizedBox(height: height * 0.02),

        // إظهار واجهة المستخدم بناءً على نوع الخدمة
        if (serviceType == "city")
          if (selectedService != null)
            BlocBuilder<CityCubit, CityState>(builder: (context, state) {
              if (state is Citysuccess) {
                cities = state.cityList;
                return buildDropdown<DataCityModel>(
                  value: selectedCity,
                  hint: "اختر المدينة",
                  items: cities,
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                    widget.onCitySelected(
                        value!.id);
                  },
                );
              } else if (state is CityFaliures) {
                return Center(child: Text(state.message));
              } else {
                return const Center(
                    child: CircularProgressIndicator(color: kpColor));
              }
            }),

        if (serviceType == "mailAccount" || serviceType == "bankTransfer")
          TextFromFiledItem(
            onChanged: (value) {
              setState(() {
                selectedBank = value;
              });
            },
            hintText: serviceType == "mailAccount"
                ? "أدخل الحساب البريدي"
                : "أدخل رقم الحوالة البنكية",
            prefixIcon: Icons.account_balance,
            pass: false,
            isSecurePassword: false,
            textType: TextInputType.text,
            controller: widget.bankController,
          ),
      ],
    );
  }

  String? getServiceType(String? service) {
    if (service == null) return null;

    if (service == "تسليم باليد") {
      return "city";
    } else if (service == "حساب بريدي" || service == "حوالة بنكية") {
      return service == "حساب بريدي" ? "mailAccount" : "bankTransfer";
    } else {
      return null;
    }
  }

  Widget buildDropdown<T>({
    T? value,
    required String hint,
    required List<T> items,
    required Function(T?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: kpColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          hint: Text(hint),
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: kpColor),
          style: const TextStyle(color: Colors.black, fontSize: 16),
          dropdownColor: kprimaryColor,
          onChanged: onChanged,
          items: items.map((T item) {
            if (item is String) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(item),
              );
            } else if (item is DataCityModel) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(item.cityName),
              );
            } else {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(item.toString()),
              );
            }
          }).toList(),
        ),
      ),
    );
  }
}
