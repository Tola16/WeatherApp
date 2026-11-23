import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather.dart';
import 'package:weatherapp/screens/homepage.dart';

class Details extends StatelessWidget {
  final WeatherModel country;
  Details({required this.country, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 30,
        child: ListTile(
          trailing: IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ),
            },
            icon: Icon(Icons.arrow_back),
          ),
          leading: SizedBox(
            width: 50,
            height: 50,
            child: Image.network(
              country.ImageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              cacheWidth: 100,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.cloud_off, size: 32),
            ),
          ),
          title: Text(country.Name),
          subtitle: Text(country.Temp),
        ),
      ),
    );
  }
}
