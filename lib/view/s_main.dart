import 'package:flutter/material.dart';

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
                // if (snapshot.hasError)
                return const Center(child: Text('Error'));
                if (snapshot.connectionState == ConnectionState.waiting)
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                    ),
                  );
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('hellow'),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
