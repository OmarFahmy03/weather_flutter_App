import 'dart:convert';
import 'package:day20_weather/weather/Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:day20_weather/api/getWeather.dart'; // Ensure the correct path is used

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    final WeatherApi weatherApi = WeatherApi(); // Instantiate WeatherApi

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'image/gradient_1080_1920.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(height: 200),
                  TextField(
                    controller: _controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Enter Location...',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 108, 73, 155).withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () async {
                        String location = _controller.text.trim();
                        if (location.isNotEmpty) {
                          try {
                            ApiResponse apiResponse = await weatherApi.getCurrentWeather(location);
                            print('Search button clicked! Location: $location');
                            Navigator.pushNamed(context, '/showSelected', arguments: apiResponse);
                            // Handle the fetched data as needed, e.g., update the UI or navigate to another screen
                          } catch (e) {
                            print('Error: $e');
                          }
                        } else {
                          print('Please enter a location');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Image.asset(
                'image/dwa.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
