import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app/cubit/submit_maintenance_form_cubit/submit_maintenance_form_states.dart';
import 'package:maintenance_app/models/form_model.dart';

class SubmitMaintenanceFormCubit extends Cubit<SubmitMaintenanceFormStates> {
  SubmitMaintenanceFormCubit() : super(SubmitFormInitialState());

  static SubmitMaintenanceFormCubit get(context) => BlocProvider.of(context);

  submitForm(FormModel formModel) {
    emit(SubmitFormLoadingState());
    FirebaseFirestore.instance
        .collection('maintenance_form')
        .add(formModel.toJson())
        .then((value) {
      String formId = value.id;
      value.update({'formId': formId});

      // update user request state
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'isRequested': true})
          .then((value) {
            emit(UpdateRequestSuccessState());
      })
          .catchError((error) {
        if (kDebugMode) {
          print('Update request error state ==  ${error.toString()}');
        }
            emit(UpdateRequestFailureState(error: error.toString()));
      });
      emit(SubmitFormSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('Submit form error state ==  ${error.toString()}');
      }
      emit(SubmitFormFailureState(error: error.toString()));
    });
  }
}
