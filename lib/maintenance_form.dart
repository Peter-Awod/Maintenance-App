import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app/cubit/submit_maintenance_form_cubit.dart';
import 'package:maintenance_app/cubit/submit_maintenance_form_states.dart';
import 'package:maintenance_app/models/form_model.dart';

import 'shared/custom_widgets/custom_text_form_field.dart';

class MaintenanceForm extends StatefulWidget {
  const MaintenanceForm({super.key});

  @override
  State<MaintenanceForm> createState() => _MaintenanceFormState();
}

class _MaintenanceFormState extends State<MaintenanceForm> {
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  var nameController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var buildingNumberController = TextEditingController();
  var floorNumberController = TextEditingController();
  var apartmentNumberController = TextEditingController();
  var maintenanceTypeController = TextEditingController();
  var addressDetailsController = TextEditingController();
  var maintenanceDetailsController = TextEditingController();

  String? name,
      mobileNumber,
      maintenanceType,
      buildingNumber,
      floorNumber,
      apartmentNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubmitMaintenanceFormCubit(),
      child:
          BlocConsumer<SubmitMaintenanceFormCubit, SubmitMaintenanceFormStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SubmitMaintenanceFormCubit formCubit = BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Maintenance Form'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  autovalidateMode: autovalidateMode,
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        keyboardType: TextInputType.name,
                        textEditingController: nameController,
                        hintText: 'Enter your full name',
                        prefixIcon: const Icon(
                          Icons.person_2_outlined,
                        ),
                        onSaved: (value) {
                          name = value!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        textEditingController: mobileNumberController,
                        hintText: 'Enter your phone number',
                        prefixIcon: const Icon(Icons.phone_android_outlined),
                        keyboardType: TextInputType.phone,
                        onSaved: (value) {
                          mobileNumber = value!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        textEditingController: buildingNumberController,
                        hintText: 'Enter your building number',
                        prefixIcon: const Icon(Icons.house_outlined),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          buildingNumber = value!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        textEditingController: floorNumberController,
                        hintText: 'Enter your floor number',
                        prefixIcon: const Icon(Icons.house_outlined),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          floorNumber = value!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        textEditingController: apartmentNumberController,
                        hintText: 'Enter your apartment number',
                        prefixIcon: const Icon(Icons.apartment_outlined),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          apartmentNumber = value!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        textEditingController: maintenanceTypeController,
                        hintText: 'Enter maintenance type',
                        prefixIcon: const Icon(Icons.engineering_outlined),
                        keyboardType: TextInputType.text,
                        onSaved: (value) {
                          maintenanceType = value!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        textEditingController: addressDetailsController,
                        hintText: 'Add more details about address',
                        prefixIcon: const Icon(Icons.location_on_outlined),
                        keyboardType: TextInputType.text,
                        onSaved: (value) {
                          maintenanceType = value!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        textEditingController: maintenanceDetailsController,
                        hintText:
                            'Add more details about your maintenance request',
                        prefixIcon: const Icon(Icons.engineering_outlined),
                        keyboardType: TextInputType.text,
                        onSaved: (value) {
                          maintenanceType = value!;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (addressDetailsController.text == null ||
                              addressDetailsController.text.isEmpty) {
                            addressDetailsController.text = 'No details';
                          }
                          if (maintenanceDetailsController.text == null ||
                              maintenanceDetailsController.text.isEmpty) {
                            maintenanceDetailsController.text = 'No details';
                          }

                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            var formModel = FormModel(
                                formId: '',
                                name: nameController.text,
                                phone: mobileNumberController.text,
                                maintenanceType: maintenanceTypeController.text,
                                buildingNo: buildingNumberController.text,
                                floorNo: floorNumberController.text,
                                apartmentNo: apartmentNumberController.text,
                                addressDetails: addressDetailsController.text,
                                maintenanceDetails:
                                    maintenanceDetailsController.text);
                            formCubit.submitForm(formModel);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
