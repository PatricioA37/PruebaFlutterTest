class Weather {
  const Weather({required this.temperature, required this.weathercode});

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      temperature: (json['temperature'] as num).toDouble(),
      weathercode: (json['weathercode'] as num).toDouble(),
    );
  }

  final double temperature;
  final double weathercode;
}
