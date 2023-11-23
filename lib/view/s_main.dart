import 'package:flutter/material.dart';
import 'package:flutter_weather_app/constants/paths.dart';
import 'package:lottie/lottie.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: RefreshIndicator(
          onRefresh: () async {},
          child: FutureBuilder(
              future: null,
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
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                    ),
                  );
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('날씨 정보'),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
