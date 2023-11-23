class Weather {
  final String main, temp, desc;

  Weather.fromJson(Map<String, dynamic> json)
      : main = json['weather'][0]['main'] as String,
        desc = json['weather'][0]['description'] as String,
        temp = json['main']['temp'].toString();
}
