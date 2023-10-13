import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'di.dart' as di;
import 'features/presentation/bloc/dropdown_cubit.dart';
import 'features/presentation/bloc/hardware_bloc.dart';
import 'features/presentation/bloc/mqtt/mqtt_handler_bloc.dart';
import 'features/presentation/routes/routes.dart';
import 'utils/app_colors.dart';
import 'utils/app_text.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  di.initializeDependencies();

  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.locator<SetValueDropdownCubit>(),
        ),
        BlocProvider(
          create: (context) => di.locator<HardwareBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MqttHandlerBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'STRUV',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            brightness: Brightness.light,
          ),
          textTheme: myTextTheme,
        ),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
