import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
