import 'package:flutter/material.dart';
import 'package:maintenance_app/shared/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.prefixIcon,
    required this.keyboardType,
    this.onSaved,
    this.onChanged,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final Icon prefixIcon;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).viewInsets.bottom+100,
      ),
      keyboardType: keyboardType,
      controller: textEditingController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        } else {
          return null;
        }
      },
      onSaved: (value) {},
      onChanged: (value) {},
      decoration: InputDecoration(
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: kSecondaryColor,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: kSecondaryColor,

      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: kSecondaryColor,
        ));
  }
}
