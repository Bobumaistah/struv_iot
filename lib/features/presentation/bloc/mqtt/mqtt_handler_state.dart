part of 'mqtt_handler_bloc.dart';

sealed class MqttHandlerState extends Equatable {
  const MqttHandlerState();

  @override
  List<Object> get props => [];
}

final class MqttHandlerInitial extends MqttHandlerState {}

final class MqttHandlerError extends MqttHandlerState {
  final String message;

  const MqttHandlerError(this.message);

  @override
  List<Object> get props => [message];
}

final class MqttHandlerLoaded extends MqttHandlerState {
  final MqttClient mqttClient;

  const MqttHandlerLoaded(this.mqttClient);

  @override
  List<Object> get props => [mqttClient];
}
