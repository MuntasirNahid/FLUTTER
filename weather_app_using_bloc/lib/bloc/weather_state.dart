part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccess({required this.weatherModel});
}

final class WeatherFailure extends WeatherState {
  final String errorMessage;

  WeatherFailure(this.errorMessage);
}

final class WeatherLoading extends WeatherState {}
