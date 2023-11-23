import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/constants/palette.dart';
import 'package:flutter_weather_app/constants/paths.dart';
import 'package:flutter_weather_app/model/weather.dart';
import 'package:flutter_weather_app/service/api_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

enum WeatherType { Clear, Clouds, Rain, Snow, Thunderstorm, Drizzle, Atmosphere }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<Weather> currentWeather;
  @override
  void initState() {
    currentWeather = ApiService.getCurrentWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0b121e),
      body: FutureBuilder(
          future: currentWeather,
          builder: (context, snapshot) {
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
                  width: 200,
                  height: 200,
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
                      style: GoogleFonts.roboto(
                        fontSize: 64,
                        color: Palette.text,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                    createWeatherAnimation(snapshot.data!.main),
                    Text(
                      '${snapshot.data!.desc}',
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        color: Palette.text,
                      ),
                    ),
                    Text(
                      '${snapshot.data!.temp}°C',
                      style: GoogleFonts.roboto(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Palette.text,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentWeather = currentWeather = ApiService.getCurrentWeather();
                          });
                        },
                        child: Text('Refresh'))
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
