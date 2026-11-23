import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/customs/weatheritem.dart';
import 'package:weatherapp/providers/weatherprovider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<WeatherProvider>(
        builder: (context, value, child) {
          final weatherList = value.weatherModel;
          if (weatherList == null && value.error == null) {
            value.fetchWeather();
            return const Center(child: CircularProgressIndicator());
          }
          if (value.error != null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Could not load weather: ${value.error}'),
                  ElevatedButton(
                    onPressed: value.fetchWeather,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          final data = weatherList!.weathers;
          return ListView.builder(
            itemBuilder: (context, index) => CustomItem(country: data[index]),
            itemCount: data.length,
          );
        },
      ),
    );
  }
}
