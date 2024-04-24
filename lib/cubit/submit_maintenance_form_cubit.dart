import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app/cubit/submit_maintenance_form_states.dart';

class SubmitFormCubit extends Cubit<SubmitMaintenanceFormStates> {
  SubmitFormCubit() : super(SubmitFormInitialState());

  static SubmitFormCubit get(context) => BlocProvider.of(context);

}
