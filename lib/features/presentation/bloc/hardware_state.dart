part of 'hardware_bloc.dart';

sealed class HardwareState extends Equatable {
  const HardwareState();

  @override
  List<Object> get props => [];
}

final class InitialHardwareState extends HardwareState {}

final class LoadingHardwareState extends HardwareState {}

final class ErrorHardwareState extends HardwareState {
  final String message;

  const ErrorHardwareState(this.message);

  @override
  List<Object> get props => [message];
}

final class HardwareCreatedSuccessState extends HardwareState {}

final class RemovedHardwareState extends HardwareState {}

final class HardwareListDataState extends HardwareState {
  final List<HardwareModel> datas;

  const HardwareListDataState(this.datas);

  @override
  List<Object> get props => [datas];
}
