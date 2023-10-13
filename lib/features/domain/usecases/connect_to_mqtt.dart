import 'package:dartz/dartz.dart';
import 'package:mqtt_client/mqtt_client.dart';
import '../../../core/error/failures.dart';
import '../repositories/repository.dart';

class ConnectToMQTT {
  final Repository repository;

  ConnectToMQTT(this.repository);

  Future<Either<Failure, MqttClient>> execute() {
    return repository.connectToMQTT();
  }
}
