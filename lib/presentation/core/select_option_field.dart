import 'package:allworkpro/constants/theme.dart';
import 'package:flutter/material.dart';

class SelectOptionField extends StatelessWidget {
  const SelectOptionField({
    required this.options,
    this.value,
    required this.dropDownInputKey,
    this.hintText,
    this.onChanged,
    this.color,
    bool? disabled,
  }) : disabled = disabled ?? false;

  final Color? color;
  final bool disabled;
  final Key dropDownInputKey;
  final String? hintText;
  final FormFieldSetter<String>? onChanged;
  final List<String> options;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: disabled ? Colors.grey[200] : whiteColor),
      child: InputDecorator(
        decoration: InputDecoration(
          fillColor: whiteColor,
          focusColor: accentColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          enabledBorder: disabled
              ? null
              : OutlineInputBorder(
                  borderSide: BorderSide(color: color ?? Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: accentColor),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            key: dropDownInputKey,
            dropdownColor: whiteColor,
            hint: hintText != null
                ? Text(hintText!,
                    style: const TextStyle(fontWeight: FontWeight.bold))
                : null,
            value: value,
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                key: ValueKey<String>(value),
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: disabled ? null : onChanged,
            isDense: true,
          ),
        ),
      ),
    );
  }
}
