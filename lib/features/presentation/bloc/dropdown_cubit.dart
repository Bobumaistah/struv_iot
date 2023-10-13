import 'package:flutter_bloc/flutter_bloc.dart';

class SetValueDropdownCubit extends Cubit<String> {
  SetValueDropdownCubit() : super('Reaktor');

  void updateValue(String newValue) {
    emit(newValue);
  }
}
