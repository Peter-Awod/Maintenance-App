import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton(
      {super.key, required this.onPressed, required this.buttonName});

  final VoidCallback? onPressed;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
