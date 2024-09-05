class WeatherModel {
  final String? cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final double? chanceOfRain;
  final double? chanceOfSnow;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    this.chanceOfRain,
    this.chanceOfSnow,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    print(json); // Debug: print the JSON response to see its structure
    final int conditionCode =
        json['forecast']['forecastday'][0]['day']['condition']['code'];

    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: (json['forecast']['forecastday'][0]['day']['avgtemp_c'] as num)
          .toDouble(),
      maxTemp: (json['forecast']['forecastday'][0]['day']['maxtemp_c'] as num)
          .toDouble(),
      minTemp: (json['forecast']['forecastday'][0]['day']['mintemp_c'] as num)
          .toDouble(),
      image: getWeatherImage(conditionCode), // Use the method to get the image
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      chanceOfRain: json['forecast']['forecastday'][0]['day']
                  ['daily_chance_of_rain'] !=
              null
          ? (json['forecast']['forecastday'][0]['day']['daily_chance_of_rain']
                  as num)
              .toDouble()
          : null,
      chanceOfSnow: json['forecast']['forecastday'][0]['day']
                  ['daily_chance_of_snow'] !=
              null
          ? (json['forecast']['forecastday'][0]['day']['daily_chance_of_snow']
                  as num)
              .toDouble()
          : null,
    );
  }
}

String getWeatherImage(int conditionCode) {
  switch (conditionCode) {
    case 1000:
      return 'Assets/images/hot.png';
    case 1003:
      return 'Assets/images/cold.png';
    case 1189:
      return 'Assets/images/umberlla.png';
    case 1009:
      return 'Assets/images/hot.png';

    case 1063:
      return 'Assets/images/umberlla.png';
    case 1066:
      return 'AAssets/images/cold.png';
    default:
      return 'Assets/images/umberlla.png';
  }
}
