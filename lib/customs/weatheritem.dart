import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather.dart';
import 'package:weatherapp/screens/details.dart';

class CustomItem extends StatelessWidget {
  WeatherModel country;
  CustomItem({required this.country, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details(country: country)),
        ),
      },
      child: Card(
        elevation: 30,
        child: ListTile(
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

          // onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => CountryDetailScreen(country: country),
          //     ),
          //   );
          // },
        ),
      ),
    );
  }
}
