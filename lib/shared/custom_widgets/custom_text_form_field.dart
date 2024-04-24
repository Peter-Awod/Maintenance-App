import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.prefixIcon,
    required this.keyboardType,
    this.onSaved,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final Icon prefixIcon;
  final void Function(String?)? onSaved;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      decoration: InputDecoration(
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: Colors.black,
        ));
  }
}