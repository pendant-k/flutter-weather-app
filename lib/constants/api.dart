class Api {
  static const String apiKey = "64489df3908f930142d910384a877a56";
  static const String lat = "37.532600";
  static const String lon = "127.024612";

  static const String weatherUrl =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$apiKey";
}
