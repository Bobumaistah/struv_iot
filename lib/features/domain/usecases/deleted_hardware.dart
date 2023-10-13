import '../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../repositories/repository.dart';

class RemoveHardware {
  final Repository repository;

  RemoveHardware(this.repository);

  Future<Either<Failure, void>> execute(int index) {
    return repository.removeHardware(index);
  }
}
