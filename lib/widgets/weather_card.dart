import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherCard({super.key, required this.weather});

  String formatTime(num? timestamp) {
    if (timestamp == null) return '--:-- --';
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp.toInt() * 1000);
    return DateFormat('hh:mm a').format(date);
  }

  // Helper function to select the weather animation
  String _getWeatherAnimation(String? description) {
    if (description == null) return 'assets/cloudy.json';
    final desc = description.toLowerCase();
    if (desc.contains('rain')) {
      return 'assets/rain.json';
    } else if (desc.contains('snow')) {
      return 'assets/snowfall.json';
    } else if (desc.contains('sun') || desc.contains('clear')) {
      return 'assets/sunny.json';
    }
    return 'assets/cloudy.json';
  }

  @override
  Widget build(BuildContext context) {
    final weatherDescription = weather.weather?.first.description;
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(113, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset(
                _getWeatherAnimation(weatherDescription),
                height: 150,
                width: 150,
              ),
              Text(
                weather.name ?? 'N/A',
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold),

              ),
              const SizedBox(height: 10),
              Text(
                '${weather.main?.temp?.toStringAsFixed(1) ?? 'N/A'}°C',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Humidity: ${weather.main?.humidity ?? 'N/A'}%',
                    style: textTheme.bodyMedium,
                  ),
                  Text(
                    'Wind: ${weather.wind?.speed ?? 'N/A'} m/s',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.amber,
                      ),
                      Text('Sunrise', style: textTheme.bodyMedium),
                      Text(
                        formatTime(weather.sys?.sunrise ?? 0),
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.nights_stay_outlined,
                        color: Colors.purple,
                      ),
                      Text('Sunset', style: textTheme.bodyMedium),
                      Text(
                        formatTime(weather.sys?.sunset ?? 0),
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
