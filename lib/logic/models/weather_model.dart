class WeatherModel {
  final String temp;
  final String tempMax;
  final String tempMin;
  final String windSpeed;
  final String rainChance;
  final String city;
  final String desc;

  WeatherModel({
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.windSpeed,
    required this.rainChance,
    required this.city,
    required this.desc,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> json) {

     return WeatherModel(
      temp: json['main']['temp'].toString(),
      tempMax: json['main']['temp_max'].toString(),
      tempMin: json['main']['temp_min'].toString(),
      windSpeed: (json['wind']['speed'] * 3.6).toString(),
      rainChance: json['clouds']['all'].toString(),
      city: json['name'],
      desc: json['weather'][0]['description'],
    );
  }
}
