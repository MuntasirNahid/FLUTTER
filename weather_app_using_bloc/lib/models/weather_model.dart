class WeatherModel {
  final double currentTemp;
  final String currentSky;
  final int currentPressure;
  final double currentWindSpeed;
  final int currentHumidity;
  // final double hourlyForecast;
  // final double hourlySky;
  // final String hourlyTemp;
  // final DateTime time;

//hourlyTemp -?string
  //hourlySky
//hourlyForecast
  //time
  WeatherModel(
      // this.hourlyForecast,
      // this.hourlySky,
      // this.hourlyTemp,
      // this.time,
      {
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      //    hourlyForecast:double.parse(json[""]),
      currentTemp: double.parse(json["currentTemp"]),
      currentSky: json["currentSky"],
      currentPressure: int.parse(json["currentPressure"]),
      currentWindSpeed: double.parse(json["currentWindSpeed"]),
      currentHumidity: int.parse(json["currentHumidity"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "currentTemp": this.currentTemp,
      "currentSky": this.currentSky,
      "currentPressure": this.currentPressure,
      "currentWindSpeed": this.currentWindSpeed,
      "currentHumidity": this.currentHumidity,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'currentTemp': this.currentTemp,
      'currentSky': this.currentSky,
      'currentPressure': this.currentPressure,
      'currentWindSpeed': this.currentWindSpeed,
      'currentHumidity': this.currentHumidity,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];

    return WeatherModel(
      currentTemp: currentWeatherData['main']['temp'],
      currentSky: currentWeatherData['weather'][0]['main'],
      currentPressure: currentWeatherData['main']['pressure'],
      currentWindSpeed: currentWeatherData['wind']['speed'],
      currentHumidity: currentWeatherData['main']['humidity'],
    );
  }

  WeatherModel copyWith({
    double? currentTemp,
    String? currentSky,
    int? currentPressure,
    double? currentWindSpeed,
    int? currentHumidity,
  }) {
    return WeatherModel(
      currentTemp: currentTemp ?? this.currentTemp,
      currentSky: currentSky ?? this.currentSky,
      currentPressure: currentPressure ?? this.currentPressure,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
    );
  }
//

//
}
