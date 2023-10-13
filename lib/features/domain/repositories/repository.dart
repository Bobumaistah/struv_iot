import 'package:dartz/dartz.dart';
import 'package:mqtt_client/mqtt_client.dart';
import '../../data/models/hardware_model.dart';

import '../../../core/error/failures.dart';

abstract class Repository {
  // Local
  Future<Either<Failure, void>> saveHardware(HardwareModel hardware);
  Future<Either<Failure, List<HardwareModel>>> getAllHardwares();
  Future<Either<Failure, void>> removeHardware(int index);
  Future<Either<Failure, void>> updateHardware(
    HardwareModel hardware,
    int index,
  );

  // Remote
  Future<Either<Failure, MqttClient>> connectToMQTT();
}
