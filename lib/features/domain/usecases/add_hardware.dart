import '../../data/models/hardware_model.dart';

import '../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../repositories/repository.dart';

class SaveHardware {
  final Repository repository;

  SaveHardware(this.repository);

  Future<Either<Failure, void>> execute(HardwareModel hadware) {
    return repository.saveHardware(hadware);
  }
}
