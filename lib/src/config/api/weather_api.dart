import 'package:weather/weather.dart';

class WeatherAPI {
  static final String _key = 'c18765d43ad7684e981802431a5d692a';
  static late WeatherFactory _wf;

  static initialize() {
    _wf = WeatherFactory(_key);
  }

  static Future<Weather> getWeatherByName({
    String cityName = 'Kingston',
  }) async {
    Weather weather = await _wf.currentWeatherByCityName(cityName);
    
    return weather;
  }

  static Future<Weather> getWeatherByLocation({
    double latitude = 55.0111,
    double longitude = 15.0569,
  }) async {
    Weather weather = await _wf.currentWeatherByLocation(latitude, longitude);
    return weather;
  }
}
