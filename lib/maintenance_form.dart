import 'package:flutter/material.dart';

class MaintenanceForm extends StatefulWidget {
  const MaintenanceForm({super.key});

  @override
  State<MaintenanceForm> createState() => _MaintenanceFormState();
}

class _MaintenanceFormState extends State<MaintenanceForm> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var buildingNumberController = TextEditingController();
  var floorNumberController = TextEditingController();
  var apartmentNumberController = TextEditingController();
  var maintenanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance Form'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                keyboardType: TextInputType.name,
                textEditingController: nameController,
                hintText: 'Enter your full name',
                prefixIcon: const Icon(
                  Icons.person_2_outlined,
                ),
                onSaved: (value) {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                textEditingController: mobileNumberController,
                hintText: 'Enter your phone number',
                prefixIcon: const Icon(Icons.phone_android_outlined),
                keyboardType: TextInputType.phone,
                onSaved: (value) {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                textEditingController: buildingNumberController,
                hintText: 'Enter your building number',
                prefixIcon: const Icon(Icons.house_outlined),
                keyboardType: TextInputType.number,
                onSaved: (value) {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                textEditingController: floorNumberController,
                hintText: 'Enter your floor number',
                prefixIcon: const Icon(Icons.house_outlined),
                keyboardType: TextInputType.number,
                onSaved: (value) {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                textEditingController: apartmentNumberController,
                hintText: 'Enter your apartment number',
                prefixIcon: const Icon(Icons.apartment_outlined),
                keyboardType: TextInputType.number,
                onSaved: (value) {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                textEditingController: maintenanceController,
                hintText: 'Enter maintenance type',
                prefixIcon: const Icon(Icons.engineering_outlined),
                keyboardType: TextInputType.text,
                onSaved: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
