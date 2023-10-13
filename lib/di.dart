import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'features/data/data_sources/local_data_source.dart';
import 'features/data/data_sources/remote_data_source.dart';
import 'features/data/repositories/repository.dart';

import 'features/domain/repositories/repository.dart';
import 'features/domain/usecases/connect_to_mqtt.dart';
import 'features/presentation/bloc/dropdown_cubit.dart';
import 'features/presentation/bloc/mqtt/mqtt_handler_bloc.dart';

import 'features/data/models/hardware_model.dart';
import 'features/domain/usecases/add_hardware.dart';
import 'features/domain/usecases/deleted_hardware.dart';
import 'features/domain/usecases/get_all_hardware.dart';
import 'features/presentation/bloc/hardware_bloc.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerFactory(() => SetValueDropdownCubit());

  locator.registerFactory(
    () => HardwareBloc(
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerFactory(() => MqttHandlerBloc(locator()));

  locator.registerLazySingleton(() => SaveHardware(locator()));
  locator.registerLazySingleton(() => GetAllHardware(locator()));
  locator.registerLazySingleton(() => RemoveHardware(locator()));
  locator.registerLazySingleton(() => ConnectToMQTT(locator()));

  locator.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      locator(),
      locator(),
    ),
  );

  locator.registerLazySingleton<LocalDataSource>(
    () => LocalRemoteDataSourceImpl(),
  );

  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(locator()),
  );

  // External
  locator.registerLazySingleton(
    () => MqttServerClient.withPort(
      '40.76.142.54',
      'mobile_client',
      1883,
    ),
  );

  // Hive registerAdapter
  Hive.registerAdapter(HardwareModelAdapter());
}
