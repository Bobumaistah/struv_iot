import 'package:dartz/dartz.dart';
import 'package:mqtt_client/mqtt_client.dart';
import '../../../core/error/failures.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';
import '../../domain/repositories/repository.dart';

import '../../../core/error/exceptions.dart';
import '../models/hardware_model.dart';

class RepositoryImpl implements Repository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RepositoryImpl(this.localDataSource, this.remoteDataSource);

  @override
  Future<Either<Failure, void>> saveHardware(HardwareModel hardware) async {
    try {
      final result = await localDataSource.saveHardware(hardware);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeHardware(int index) async {
    try {
      final result = await localDataSource.removeHardware(index);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HardwareModel>>> getAllHardwares() async {
    try {
      final result = await localDataSource.getAllHardwares();
      return Right(result.map((e) => e).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateHardware(
    HardwareModel hardware,
    int index,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MqttClient>> connectToMQTT() async {
    try {
      final result = await remoteDataSource.connectToMQTT();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
