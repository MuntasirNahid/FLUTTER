import 'package:http/http.dart' as http;
import 'package:weather_app_using_bloc/secrets.dart';

class WeatherDataProvider {
  Future<String> getCurrentWeather(String cityName) async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );
      //
      // final data = jsonDecode(res.body);
      //
      // if (data['cod'] != '200') {
      //   throw 'An unexpected error occurred';
      // }

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
