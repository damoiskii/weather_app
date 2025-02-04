String getWeatherIcon(String iconCode) {
  Map<String, String> iconMap = {
    "01d": "clear-day.json",
    "01n": "clear-night.json",
    "02d": "cloud-up.json",
    "02n": "cloud-down.json",
    "03d": "cloudy.json",
    "03n": "cloudy.json",
    "04d": "overcast.json",
    "04n": "overcast.json",
    "09d": "day-rain.json",
    "09n": "night-rain.json",
    "10d": "rain.json",
    "10n": "rain.json",
    "11d": "thunderstorms-day.json",
    "11n": "thunderstorms-night.json",
    "13d": "day-snow.json",
    "13n": "night-snow.json",
    "50d": "fog-day.json",
    "50n": "fog-night.json",

    // others
    "temperature": "thermometer.json",
    "humidity": "humidity.json",
    "wind": "wind.json",
    "sunrise": "sunrise.json",
    "sunset": "sunset.json",
  };

  return "assets/images/weather_icons/${iconMap[iconCode] ?? 'not-available.json'}";
}
