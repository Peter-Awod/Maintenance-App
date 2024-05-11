import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
import 'user_info_states.dart';

class UserInfoCubit extends Cubit<UserInfoStates> {
  UserInfoCubit() : super(UserInfoInitialState());

  static UserInfoCubit get(context) => BlocProvider.of(context);

  // Getting current user information
  UserModel? userModel;

  void getUserInfo() {
    emit(GetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      if (kDebugMode) {
        print('Get User success State -- --  ');
      }
      emit(GetUserSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('Get User Error State -- -- ${error.toString()}');
      }
      emit(GetUserErrorState(error.toString()));
    });
  }
}
