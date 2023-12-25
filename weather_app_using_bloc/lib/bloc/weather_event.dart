part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

final class WeatherFetched extends WeatherEvent {}
