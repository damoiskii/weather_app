import 'package:animated_gradient_background/animated_gradient_background.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/src/config/api/weather_api.dart';
import 'package:weather_app/src/config/util/direction_util.dart';
import 'package:weather_app/src/view/widgets/date_text.dart';
import 'package:weather_app/src/view/widgets/weather_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  bool isResultsAvailable = false;

  late Weather weather;

  @override
  void initState() {
    super.initState();

    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    isResultsAvailable = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedGradientBackground(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.black.withOpacity(0.2),
          Colors.black.withOpacity(0.5),
          Colors.black54,
          Colors.black87,
          Colors.black,
        ],
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              // color: Colors.blue.withValues(alpha: 0.1),
              // image: DecorationImage(
              //   image: AssetImage('assets/images/sunny.jpg'),
              //   fit: BoxFit.contain,
              // ),
              // borderRadius: BorderRadius.circular(20),
              ),
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              spacing: 50,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _controller,
                  autofocus: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 2,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // hintText:
                    //     'Search for weather by city, zip code or coordinates',
                    hintText: 'Search for weather by city...',
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    suffixIcon: IconButton(
                      onPressed: _search,
                      icon: Icon(
                        Icons.arrow_forward,
                      ),
                    ),
                  ),
                  onEditingComplete: _search,
                ),
                if (isResultsAvailable) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      // Place / Area
                      _buildRow(
                        position: MainAxisAlignment.center,
                        iconData: Icons.location_pin,
                        // text: 'New York, NY',
                        text: '${weather.areaName!}, ${weather.country!} ',
                        size: 20,
                        isBold: true,
                      ),

                      // Datetime
                      _buildRow(
                        position: MainAxisAlignment.center,
                        iconData: Icons.calendar_month,
                        text: 'Monday, August 28, 2025',
                        size: 15,
                        isDateText: true,
                      ),

                      // Weather
                      _buildRow(
                        position: MainAxisAlignment.center,
                        iconData: Icons.thermostat,
                        // text: '75°C',
                        text: weather.temperature.toString(),
                        isMain: true,
                        size: 25,
                        isBold: true,
                      ),

                      // Temperature
                      _buildRow(
                        position: MainAxisAlignment.center,
                        iconData: Icons.thermostat,
                        iconCode: 'temperature',
                        // text: '75°C',
                        text: weather.temperature.toString(),
                        isTemperature: true,
                        size: 25,
                        isBold: true,
                      ),

                      // Weather Description
                      _buildRow(
                        position: MainAxisAlignment.center,
                        iconData: Icons.water_drop,
                        //text: 'Feels Like 77°C',
                        text: 'Feels Like ${weather.tempFeelsLike.toString()}',
                        size: 15,
                      ),

                      // Humidity
                      _buildRow(
                        position: MainAxisAlignment.center,
                        iconData: Icons.water_damage_rounded,
                        iconCode: 'humidity',
                        // text: 'Humidity 60%',
                        text: 'Humidity ${weather.humidity.toString()}%',
                        size: 15,
                      ),

                      // Pressure / Wind Speed
                      _buildRow(
                        position: MainAxisAlignment.center,
                        iconData: Icons.wind_power,
                        iconCode: 'wind',
                        // text: 'Wind 10 mph E',
                        text:
                            'Wind ${weather.windSpeed.toString()} mph ${getCompassDirection(weather.windDegree)}',
                        size: 15,
                      ),

                      // Sunset & Sunrise
                      _buildRow(
                        position: MainAxisAlignment.center,
                        iconData: Icons.wind_power,
                        iconCode: 'wind',
                        // text: 'Wind 10 mph E',
                        text:
                            'Wind ${weather.windSpeed.toString()} mph ${getCompassDirection(weather.windDegree)}',
                        size: 15,
                        isSunsetAndSunrise: true,
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildRow({
    required MainAxisAlignment position,
    double spacing = 10,
    required IconData iconData,
    String? iconCode,
    required String text,
    required double size,
    bool isBold = false,
    bool isTemperature = false,
    bool isMain = false,
    bool isDateText = false,
    bool isSunsetAndSunrise = false,
  }) {
    return Row(
      mainAxisAlignment: position,
      spacing: spacing,
      children: [
        // Main Weather Data
        if (isMain) ...[
          WeatherIconWidget(iconCode: weather.weatherIcon ?? ''),
          // _resultSizeBox(),
          Text(
            weather.weatherMain!,
            style: TextStyle(
              fontSize: size,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ]

        // Temperature
        else if (isTemperature) ...[
          Row(
            children: [
              WeatherIconWidget(
                iconCode: iconCode!,
                width: 50,
                height: 50,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: size - 5,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              _resultSizeBox(),
            ],
          ),
        ]

        // Date and Time
        else if (isDateText) ...[
          Icon(
            iconData,
            size: size,
          ),
          DateText(
            dateTime: weather.date != null ? weather.date! : DateTime.now(),
          ),
        ]

        // Sunrise and SUnset
        else if (isSunsetAndSunrise) ...[
          Column(
            children: [
              Row(
                children: [
                  WeatherIconWidget(
                    iconCode: 'sunrise',
                    width: 35,
                    height: 35,
                  ),
                  Text(
                    'Sunrise is at ${weather.sunrise?.format('h:i a')}',
                    style: TextStyle(
                      fontSize: size,
                      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  WeatherIconWidget(
                    iconCode: 'sunset',
                    width: 35,
                    height: 35,
                  ),
                  Text(
                    'Sunset is at ${weather.sunset?.format('h:i a')}',
                    style: TextStyle(
                      fontSize: size,
                      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]

        // Other Weather Data
        else ...[
          if (iconCode != null) ...[
            WeatherIconWidget(
              iconCode: iconCode,
              width: 35,
              height: 35,
            ),
          ] else ...[
            Icon(
              iconData,
              size: size,
            ),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: size,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ]
      ],
    );
  }

  SizedBox _resultSizeBox() {
    return const SizedBox(
      height: 50,
    );
  }

  Future<void> _search() async {
    if (_controller.text.toString().isEmpty) {
      // debugPrint('EC Empty');
      return;
    }

    _fetchWeatherData();
  }

  _fetchWeatherData() async {
    setState(() {
      isResultsAvailable = false;
    });

    weather = await WeatherAPI.getWeatherByName(
      cityName: _controller.text.toString(),
    );

    debugPrint('Weather Data: ${weather.toJson()}');
    // debugPrint('Weather Icon: ${weather.weatherIcon}');

    setState(() {
      isResultsAvailable = true;
    });
  }
}
