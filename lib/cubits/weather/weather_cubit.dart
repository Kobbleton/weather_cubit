import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_cubit/models/custom_error.dart';
import 'package:weather_cubit/repositories/weather_repository.dart';
import '../../models/weather.dart';
part 'weather_cubit_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  //create an instance of WeatherRepository
  final WeatherRepository weatherRepository;
  WeatherCubit({
    required this.weatherRepository,
  }
      //initial state of Weather
      ) : super(WeatherState.initial());

  //function to fetch Weather
  Future<void> fetchWeather(String city) async {
    //change state to WeatherStatus.loading
    emit(
      state.copyWith(status: WeatherStatus.loading),
    );

    try {
      //try call the function from WeatherRepository called fetchWeather with argument of the city
      final Weather weather = await weatherRepository.fetchWeather(city);

//if successfull emit state WeatherStatus.loaded
      emit(
        state.copyWith(
          status: WeatherStatus.loaded,
          weather: weather,
        ),
      );
    } on CustomError catch (e) {
      //if not successfull emit state WeatherStatus.error
      emit(
        state.copyWith(status: WeatherStatus.error, error: e),
      );
    }
  }
}
