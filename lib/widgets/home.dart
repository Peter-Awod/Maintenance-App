import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app/cubit/user_info_cubit/user_info_cubit.dart';
import 'package:maintenance_app/cubit/user_info_cubit/user_info_states.dart';
import 'package:maintenance_app/shared/constants.dart';
import 'package:maintenance_app/widgets/login/login.dart';
import 'package:maintenance_app/widgets/maintenance_form.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/custom_widgets/custom_material_button.dart';
import '../shared/custom_widgets/shimmer_view_builder.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserInfoCubit, UserInfoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var user = UserInfoCubit.get(context).userModel;
        return Scaffold(
          backgroundColor: kPrimaryColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Home',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kSecondaryColor,
              ),
            ),
          ),
          body: ConditionalBuilder(
            condition: state is GetUserSuccessState,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomMaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MaintenanceForm(),
                        ),
                      );
                    },
                    buttonName: 'Request a service',
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // Logout
                  CustomMaterialButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      });
                    },
                    buttonName: 'Logout',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (user!.isAdmin == true)
                    CustomMaterialButton(onPressed: () {}, buttonName: 'Admin'),
                  if (user.isAdmin == true)
                    const SizedBox(
                      height: 20,
                    ),
                  if (user.isAdmin == false && user.isRequested == true)
                    CustomMaterialButton(
                      onPressed: () async {
                        await launchUrl(
                            Uri.parse('https://wa.me/message/3HWAG3EWMI2YN1'));
                      },
                      buttonName: 'Contact us',
                      showIcon: true,
                    ),
                ],
              ),
            ),
            fallback: (context) => const ShimmerViewBuilder(),
          ),
        );
      },
    );
  }
}
