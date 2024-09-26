import 'package:flutter/material.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Background image
            Image.asset(
              'image/gradient_1080_1920.png',  // Replace with your gradient background image path
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Center(  // Centers the top content
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('image/Group 16.png'),
                  Text(
                    'Weather App',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),  // Adjust text color for visibility
                  ),
                  Text("@Mory", style: TextStyle(color: Colors.black)),  // Adjust text color for visibility
                ],
              ),
            ),
            Positioned(
              bottom: 30,  // Positioned at the bottom
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  // Navigate to the search tab
                  Navigator.pushNamed(context, '/search');
                },
                child: Image.asset('image/Frame 1.png'),  // The image button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
