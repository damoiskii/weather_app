import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/src/config/util/weather_icon_util.dart';

class WeatherIconWidget extends StatelessWidget {
  final String iconCode; // Example: "09d"
  final Size size;

  WeatherIconWidget({
    super.key,
    required this.iconCode,
    double width = 150,
    double height = 150,
  }) : size = Size(width, height);

  @override
  Widget build(BuildContext context) {
    String svgPath = getWeatherIcon(iconCode);

    return Lottie.asset(
      svgPath,
      width: size.width,
      height: size.height,
    );
  }
}
