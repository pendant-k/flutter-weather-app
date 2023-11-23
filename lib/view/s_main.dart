import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/constants/palette.dart';
import 'package:flutter_weather_app/constants/paths.dart';
import 'package:flutter_weather_app/service/api_service.dart';
import 'package:lottie/lottie.dart';

enum WeatherType { Clear, Clouds, Rain, Snow, Thunderstorm, Drizzle, Atmosphere }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0b121e),
      body: FutureBuilder(
          future: ApiService.getCurrentWeather(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasError)
              return Center(
                child: Container(
                  height: 300,
                  child: Column(
                    children: [
                      Lottie.asset(
                        Paths.errorAnimation,
                        width: 250,
                        height: 250,
                      ),
                      Text(
                        'Cannot get weather data T.T',
                        style: TextStyle(
                          color: Palette.text,
                        ),
                      )
                    ],
                  ),
                ),
              );
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: Lottie.asset(
                  Paths.loadingAnimation,
                  width: 180,
                  height: 180,
                ),
              );
            return SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 150, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'SEOUL',
                      style: TextStyle(
                        fontSize: 70,
                        color: Palette.text,
                      ),
                    ),
                    SizedBox(height: 40),
                    CircleAvatar(
                      radius: 80,
                    ),
                    SizedBox(height: 20),
                    Text(
                      '${snapshot.data!.desc}',
                      style: TextStyle(
                        fontSize: 24,
                        color: Palette.text,
                      ),
                    ),
                    Text(
                      '${snapshot.data!.temp}°C',
                      style: TextStyle(
                        fontSize: 64,
                        color: Palette.text,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

// functions
  Future<void> mockFetching() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Widget createWeatherAnimation(String param) {
    switch (param) {
      case "Clear":
        return Container();
      case "Clouds":
        return Container();
      case "Rain":
        return Container();
      case "Snow":
        return Container();
      case "Thunderstorm":
        return Container();
      case "Drizzle":
        return Container();
      case "Atmosphere":
        return Container();
      default:
        return Container();
    }
  }
}

class WeatherLottieWidget extends StatelessWidget {
  const WeatherLottieWidget({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      url,
      width: 200,
      height: 200,
    );
  }
}
