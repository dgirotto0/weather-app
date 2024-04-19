import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData getWeatherIcon(String? description) {
  if (description == null) {
    return FontAwesomeIcons.question;
  }

  switch (description.toLowerCase()) {
    case 'clear':
      return FontAwesomeIcons.sun;
    case 'clouds':
      return FontAwesomeIcons.cloud;
    case 'rain':
      return FontAwesomeIcons.cloudRain;
    case 'snow':
      return FontAwesomeIcons.snowflake;
    case 'drizzle':
      return FontAwesomeIcons.cloudShowersHeavy;
    case 'thunderstorm':
      return FontAwesomeIcons.bolt;
    case 'mist':
      return FontAwesomeIcons.smog;
    default:
      return FontAwesomeIcons.circleQuestion;
  }
}
