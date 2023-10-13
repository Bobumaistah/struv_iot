part of 'mqtt_handler_bloc.dart';

sealed class MqttHandlerEvent extends Equatable {
  const MqttHandlerEvent();

  @override
  List<Object> get props => [];
}

class MqttConnectionEvent extends MqttHandlerEvent {}
