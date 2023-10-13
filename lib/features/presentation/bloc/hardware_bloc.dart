import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/hardware_model.dart';

import '../../domain/usecases/add_hardware.dart';
import '../../domain/usecases/deleted_hardware.dart';
import '../../domain/usecases/get_all_hardware.dart';

part 'hardware_event.dart';
part 'hardware_state.dart';

class HardwareBloc extends Bloc<HardwareEvent, HardwareState> {
  final SaveHardware _saveHardware;
  final GetAllHardware _getAllHardware;
  final RemoveHardware _removeHardware;

  HardwareBloc(
    this._saveHardware,
    this._getAllHardware,
    this._removeHardware,
  ) : super(InitialHardwareState()) {
    on<SaveHardwareEvent>((event, emit) async {
      emit(LoadingHardwareState());

      final result = await _saveHardware.execute(event.data);

      result.fold(
        (failure) => emit(ErrorHardwareState(failure.message)),
        (_) => emit(HardwareCreatedSuccessState()),
      );
    });

    on<GetAllHardwareEvent>((event, emit) async {
      emit(LoadingHardwareState());

      final result = await _getAllHardware.execute();

      result.fold(
        (failure) => emit(ErrorHardwareState(failure.message)),
        (data) => emit(HardwareListDataState(data)),
      );
    });

    on<RemoveHardwareEvent>((event, emit) async {
      emit(LoadingHardwareState());

      final result = await _removeHardware.execute(event.index);

      result.fold(
        (failure) => emit(ErrorHardwareState(failure.message)),
        (data) => emit(RemovedHardwareState()),
      );
    });
  }
}
