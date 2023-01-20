import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cubit/cubits/temp_settings/temp_settings_cubit.dart';
import 'package:weather_cubit/cubits/weather/weather_cubit.dart';
import 'package:weather_cubit/pages/home_page.dart';
import 'package:weather_cubit/repositories/weather_repository.dart';
import 'package:weather_cubit/services/weather_api_services.dart';
import 'package:http/http.dart' as http;

import 'cubits/theme/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //to inject cubit to use it interface wrap MaterialApp with MultiBlocProvider
    //and then wrap the MultiBlocProvider with RepositoryProvider
    return RepositoryProvider(
      create: (context) => WeatherRepository(
        weatherApiServices: WeatherApiServices(
          httpClient: http.Client(),
        ),
      ),
      child: MultiBlocProvider(
          providers: [
            BlocProvider<WeatherCubit>(
              create: (context) => WeatherCubit(
                weatherRepository: context.read<WeatherRepository>(),
              ),
            ),
            BlocProvider<TempSettingsCubit>(
              create: (context) => TempSettingsCubit(),
            ),
            BlocProvider<ThemeCubit>(
              create: (context) => ThemeCubit(
                weatherCubit: context.read<WeatherCubit>(),
              ),
            )
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'Weather App',
                debugShowCheckedModeBanner: false,
                theme: state.appTheme == AppTheme.light
                    ? ThemeData.light()
                    : ThemeData.dark(),
                home: const HomePage(),
              );
            },
          )),
    );
  }
}
