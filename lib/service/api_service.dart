import 'package:flutter_weather_app/model/weather.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = "Your API Key";

  // lat & lon of Seoul
  static const String lat = "37.532600";
  static const String lon = "127.024612";

  static const String weatherUrl =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$apiKey";

  static Future<Weather> getCurrentWeather() async {
    // Implements the API call
    throw UnimplementedError();
  }
}
