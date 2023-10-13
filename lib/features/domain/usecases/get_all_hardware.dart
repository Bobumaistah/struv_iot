import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../data/models/hardware_model.dart';
import '../repositories/repository.dart';

class GetAllHardware {
  final Repository repository;

  GetAllHardware(this.repository);

  Future<Either<Failure, List<HardwareModel>>> execute() {
    return repository.getAllHardwares();
  }
}
