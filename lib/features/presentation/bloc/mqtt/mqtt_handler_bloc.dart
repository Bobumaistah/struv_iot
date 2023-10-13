import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mqtt_client/mqtt_client.dart';
import '../../../domain/usecases/connect_to_mqtt.dart';

part 'mqtt_handler_event.dart';
part 'mqtt_handler_state.dart';

class MqttHandlerBloc extends Bloc<MqttHandlerEvent, MqttHandlerState> {
  final ConnectToMQTT _connectToMQTT;

  MqttHandlerBloc(this._connectToMQTT) : super(MqttHandlerInitial()) {
    on<MqttConnectionEvent>((event, emit) async {
      final result = await _connectToMQTT.execute();

      result.fold(
        (failure) => emit(MqttHandlerError(failure.message)),
        (data) => emit(MqttHandlerLoaded(data)),
      );
    });
  }
}
