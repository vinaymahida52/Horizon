import 'package:flutter/material.dart';
import 'package:horizon/core/config/theme/color_palette.dart';
import 'package:horizon/core/extension/context_ext.dart';

class CommonDropDown extends StatelessWidget {
  CommonDropDown({
    super.key,
    required String? selectedValue,
    required this.onChanged,
    required List<String> dropdownList,
  })  : selectedValue = ValueNotifier<String?>(selectedValue),
        _dropdownList = dropdownList;

  final List<String> _dropdownList;
  void Function(String?) onChanged;
  ValueNotifier<String?> selectedValue = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: ColorPalette.primaryColor,
        ),
      ),
      child: DropdownButtonFormField(
          isExpanded: true,
          menuMaxHeight: 200,
          icon: const Icon(Icons.keyboard_arrow_down),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorPalette.greyColor),
              borderRadius: BorderRadius.circular(10),
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorPalette.greyColor),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorPalette.greyColor),
                borderRadius: BorderRadius.circular(10)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
          value: selectedValue.value,
          items: _dropdownList
              .map((value) => DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: context.bodyMedium,
                    ),
                  ))
              .toList(),
          onChanged: onChanged),
    );
  }
}
