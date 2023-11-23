import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/constants/palette.dart';
import 'package:flutter_weather_app/constants/paths.dart';
import 'package:flutter_weather_app/model/weather.dart';
import 'package:flutter_weather_app/view/w_weather_lottie.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // variable for weather data
  late Future<Weather> currentWeather;

  @override
  void initState() {
    // fetch data here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: FutureBuilder(
        future: currentWeather,
        builder: (context, snapshot) {
          // Create widgets here
          return const Placeholder();
        },
      ),
    );
  }

// using this for test before implementing API call
  Future<void> mockFetching() async {
    await Future.delayed(const Duration(seconds: 1));
  }

// using this for create weather lottie widget
  Widget createWeatherAnimation(String param) {
    var url = "";
    switch (param) {
      case "Clear":
        url = Paths.clear;
        break;
      case "Clouds":
        url = Paths.clouds;
        break;
      case "Rain":
        url = Paths.rain;
        break;
      case "Snow":
        url = Paths.snow;
        break;
      case "Thunderstorm":
        url = Paths.storm;
        break;
      case "Drizzle":
        url = Paths.drizzle;
        break;
      case "Atmosphere":
      default:
        url = Paths.atmosphere;
    }
    return WeatherLottieWidget(url: url);
  }
}
