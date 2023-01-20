import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_cubit/constants/constants.dart';
import 'package:weather_cubit/cubits/weather/weather_cubit.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final WeatherCubit weatherCubit;
  late final StreamSubscription weatherSubscription;
  ThemeCubit({
    required this.weatherCubit,
  }) : super(ThemeState.initial()) {
    //stream subscription to WeatherCubit
    weatherSubscription =
        weatherCubit.stream.listen((WeatherState weatherState) {

      if (weatherState.weather.tempC > kWarmOrNot) {
        emit(state.copyWith(appTheme: AppTheme.light));
      } else {
        emit(state.copyWith(appTheme: AppTheme.dark));
      }
    });
  }

  //close weather subscription
  @override
  Future<void> close() {
    weatherSubscription.cancel();
    return super.close();
  }
}
