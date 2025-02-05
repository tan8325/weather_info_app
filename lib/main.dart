import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = '';
  String _temperature = 'N/A';
  String _weatherCondition = 'Unknown';

  void _fetchWeather() {
    setState(() {
      _cityName = _cityController.text;
      _temperature = '${_generateRandomTemperature()}°C';
      _weatherCondition = _generateRandomWeatherCondition();
    });
  }

  int _generateRandomTemperature() {
    return Random().nextInt(16) + 15;
  }

  String _generateRandomWeatherCondition() {
    List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
    return conditions[Random().nextInt(conditions.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info App'),
        backgroundColor: Colors.blue, // Add background color for the header bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            Text('City: $_cityName', style: TextStyle(fontSize: 18)),
            Text('Temperature: $_temperature', style: TextStyle(fontSize: 18)),
            Text('Weather Condition: $_weatherCondition', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}