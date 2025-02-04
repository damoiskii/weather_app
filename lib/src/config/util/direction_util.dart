// Source: https://chatgpt.com/share/67a250ec-8254-8007-a4eb-642fc5888ff0
String getCompassDirection(double? degrees) {
  degrees = degrees ?? 0;

  const List<String> directions = [
    "N",
    "NNE",
    "NE",
    "ENE",
    "E",
    "ESE",
    "SE",
    "SSE",
    "S",
    "SSW",
    "SW",
    "WSW",
    "W",
    "WNW",
    "NW",
    "NNW",
    "N"
  ];

  int index = ((degrees + 11.25) ~/ 22.5).toInt() % 16;
  return directions[index];
}
