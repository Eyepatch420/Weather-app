import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_card.dart';

import '../models/weather_model.dart';
import '../services/weather_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherServices _weatherServices = WeatherServices();
  final TextEditingController _controller = TextEditingController();

  WeatherModel? _weather;
  bool _isLoading = false;

  void _getWeather() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final weather = await _weatherServices.fetchWeather(_controller.text);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  LinearGradient _getGradient() {
    if (_weather?.weather?.isNotEmpty == true) {
      final desc = _weather!.weather!.first.description?.toLowerCase() ?? '';
      if (desc.contains('sun')) {
        return const LinearGradient(
          colors: [Colors.orangeAccent, Colors.blueAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      } else if (desc.contains('cloud')) {
        return const LinearGradient(
          colors: [Colors.grey, Colors.blueGrey],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      } else if (desc.contains('rain')) {
        return const LinearGradient(
          colors: [Colors.grey, Colors.orangeAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      } else if (desc.contains('clear')) {
        return const LinearGradient(
          colors: [Colors.orangeAccent, Colors.lightBlueAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      }
    }
    return const LinearGradient(
      colors: [Colors.grey, Colors.lightBlueAccent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather App")),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: _getGradient(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Weather App",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                controller: _controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter your City Name",
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: const Color.fromARGB(110, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _getWeather,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  child: const Text("Get Weather",)

              ),

              if (_isLoading)
                const CircularProgressIndicator()
              else if (_weather != null)
                WeatherCard(weather: _weather!)
              else
                const Text("No weather data yet.",
                    style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
