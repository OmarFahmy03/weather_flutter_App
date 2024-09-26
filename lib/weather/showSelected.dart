import 'dart:ffi';

import 'package:day20_weather/weather/Model.dart';
import 'package:flutter/material.dart';
import 'package:day20_weather/api/getWeather.dart'; // Ensure the correct path is used

class ShowSelected extends StatelessWidget {
  final ApiResponse apiResponse;

  const ShowSelected({super.key, required this.apiResponse});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('image/gradient_1080_1920.png'), // Specify your image path here
              fit: BoxFit.cover, // Cover the whole screen
            ),
          ),
          child: Stack(
            children: [
              // Overlay for better text visibility
              Container(
                //color: Colors.amber.withOpacity(0.5),
              ),
              SingleChildScrollView(
                child: SafeArea(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 50), // Add some space
                          Text(
                            apiResponse.location.name,
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Change to white for better visibility
                            ),
                          ),
                          SizedBox(height: 50), // Add some space
                          Text(
                            '${apiResponse.current.tempC} °', // Display temperature in Celsius
                            style: TextStyle(
                              fontSize: 54,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 500), // Add space after temperature
                          // Row for Condition and Humidity
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Condition and Humidity Container
                              Container(
                                padding: EdgeInsets.all(16),
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5), // Background color
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Condition: ${apiResponse.current.condition.text}', // Display weather condition
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10), // Space between texts
                                    Text(
                                      'Humidity: ${apiResponse.current.humidity}%', // Display humidity
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10), // Space between texts
                                    Text(
                                      'Real Feel: ${apiResponse.current.feelslikeC} °', // Display real feel temperature
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      )
                                    ),
                                    SizedBox(height: 10), // Space between texts
                                    Text(
                                      'chance of rain: ${apiResponse.current.precipIn}%', // Display chance of rain
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      )
                                    )
                                  ],
                                ),
                              ),
                              // Wind Container
                              Container(
                                padding: EdgeInsets.all(16),
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5), // Background color
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.air, // Wind icon
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10), // Space between icon and text
                                    Text(
                                      'Wind: ${apiResponse.current.windMph} mph', // Display wind speed
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20), // Add space after the row
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Back button at the top left
              Positioned(
                top: 50.0,
                left: 16.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white, // Change icon color for visibility
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
