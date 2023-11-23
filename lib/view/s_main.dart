import 'package:flutter/material.dart';
import 'package:flutter_weather_app/constants/palette.dart';
import 'package:flutter_weather_app/constants/paths.dart';
import 'package:lottie/lottie.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

Future<void> mockFetching() async {
  await Future.delayed(const Duration(seconds: 1));
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0b121e),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: FutureBuilder(
            future: mockFetching(),
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
                        Text('데이터를 불러올 수 없어요 ㅠㅠ')
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
                        '1°C',
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
      ),
    );
  }
}
