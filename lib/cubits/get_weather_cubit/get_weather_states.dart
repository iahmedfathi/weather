import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class InitialState extends WeatherStates {}
class LoadingState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherStates {}
