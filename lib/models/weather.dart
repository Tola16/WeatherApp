class WeatherModel {
  final String Name;
  final String Temp;
  final String ImageUrl;
  final String weatherCondition;

  WeatherModel({
    required this.Name,
    required this.Temp,
    required this.ImageUrl,
    required this.weatherCondition,
  });
}

class WeatherList {
  List<WeatherModel> weathers;
  WeatherList({required this.weathers});

  factory WeatherList.fromJson(Map<String, dynamic> json) {
    final countries = json['country'] as List<dynamic>;
    final templist = countries.map((item) {
      final country = item as Map<String, dynamic>;
      return WeatherModel(
        ImageUrl: country['countryImageUrl'] as String,
        Name: country['name'] as String,
        Temp: country['tempreature'] as String,
        weatherCondition: country['weatherCondition'] as String,
      );
    }).toList();

    return WeatherList(weathers: templist);
  }
}
