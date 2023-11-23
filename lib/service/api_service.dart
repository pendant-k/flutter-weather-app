import 'dart:convert';

import 'package:flutter_weather_app/model/weather.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = "64489df3908f930142d910384a877a56";
  static const String lat = "37.532600";
  static const String lon = "127.024612";

  static const String weatherUrl =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$apiKey";

  static Future<Weather> getCurrentWeather() async {
    try {
      final response = await http.get(Uri.parse(weatherUrl));
      if (response.statusCode == 200) {
        final converted = jsonDecode(response.body);
        final weather = Weather.fromJson(converted);
        return weather;
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
