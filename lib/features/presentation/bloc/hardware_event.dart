part of 'hardware_bloc.dart';

sealed class HardwareEvent extends Equatable {
  const HardwareEvent();

  @override
  List<Object> get props => [];
}

class SaveHardwareEvent extends HardwareEvent {
  final HardwareModel data;

  const SaveHardwareEvent(this.data);

  @override
  List<Object> get props => [data];
}

class RemoveHardwareEvent extends HardwareEvent {
  final int index;

  const RemoveHardwareEvent(this.index);

  @override
  List<Object> get props => [index];
}

class GetAllHardwareEvent extends HardwareEvent {}
