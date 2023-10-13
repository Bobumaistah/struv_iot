import '../../data/models/hardware_model.dart';

import '../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../repositories/repository.dart';

class UpdateProduct {
  final Repository repository;

  UpdateProduct(this.repository);

  Future<Either<Failure, void>> execute(HardwareModel hadware, int index) {
    return repository.updateHardware(hadware, index);
  }
}
