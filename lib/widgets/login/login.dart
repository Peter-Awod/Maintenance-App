import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app/widgets/home.dart';
import 'package:maintenance_app/widgets/login/login_cubit/login_cubit.dart';
import 'package:maintenance_app/widgets/login/login_cubit/login_states.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../shared/constants.dart';
import '../../shared/custom_widgets/custom_material_button.dart';
import '../../shared/custom_widgets/custom_text_form_field.dart';
import '../../shared/custom_widgets/snack_bar.dart';
import '../register/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  var formKey = GlobalKey<FormState>();

  var emailAddressController = TextEditingController();
  var passwordController = TextEditingController();

  String? emailAddress;

  String? password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) async{
          if (state is LoginSuccessState) {
            showSnackBar(
              context: context,
              message: 'Successfully login',
            );
           var token=await FirebaseAuth.instance.currentUser!.getIdToken();
            if (kDebugMode) {

              print( 'Token $token token end');
            }
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeWidget(),
              ),
                  (route) => false,
            );
          }
        },
        builder: (context, state) {
          LoginCubit loginCubit = LoginCubit.get(context);
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              backgroundColor: kPrimaryColor,
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Form(
                    autovalidateMode: autovalidateMode,
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: kSecondaryColor,
                                  fontSize: 32,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // email
                          CustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.email_outlined),
                            textEditingController: emailAddressController,
                            hintText: 'Enter your email',
                            onChanged: (emailAddressValue) {
                              emailAddress = emailAddressValue;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          // password
                          CustomTextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            prefixIcon: const Icon(Icons.lock_outline),
                            textEditingController: passwordController,
                            hintText: 'Enter your password',
                            obscureText: loginCubit.isPassword,
                            suffixIcon: loginCubit.suffix,
                            onChanged: (passwordValue) {
                              password = passwordValue;
                            },
                            suffixIconPressed: () {
                              loginCubit.changeIcon();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomMaterialButton(
                            buttonName: 'LOGIN',
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();

                                  isLoading = true;
                                  setState(() {});
                                  await loginCubit.userLogin(context: context,
                                    email: emailAddressController.text,
                                    password: passwordController.text,
                                  );

                                isLoading = false;
                                setState(() {});
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                              }
                            },
                          ),
                          Row(
                            children: [
                              const Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Color(0xffC7EDE6),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
