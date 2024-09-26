import 'package:day20_weather/HomePage.dart';
import 'package:day20_weather/weather/Model.dart';
import 'package:day20_weather/weather/search_tab.dart';
import 'package:day20_weather/weather/showSelected.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WeatherHome(),
        '/search': (context) => const SearchTab(),
        // Remove the static route for showSelected
      },
      onGenerateRoute: (settings) {
        // Handle dynamic routing for ShowSelected
        if (settings.name == '/showSelected') {
          final ApiResponse apiResponse = settings.arguments as ApiResponse;
          return MaterialPageRoute(
            builder: (context) => ShowSelected(apiResponse: apiResponse),
          );
        }
        return null; // Return null for unknown routes
      },
    );
  }
}
