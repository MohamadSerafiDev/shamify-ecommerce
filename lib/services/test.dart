import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherService {
  //base information

  String baseUrl = 'http://api.weatherapi.com/v1';
  String apikey = '6e5ddbb0d5d242d796b121127240409';

  //main work
  Future<WeatherData> getWeather({required String location}) async {
    Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$apikey&q=$location&days=1&aqi=no&alerts=no');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherData weatherData;
    weatherData = WeatherData.fromJson(data);

    return weatherData;
  }
}

//data prossecing
class WeatherData {
  String date;
  String lastupdate;
  String condition;
  String location;
  String region;
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String moonphase;
  int moonillumination;
  int conditionCode;
  num maxtemp;
  num mintemp;
  num temp;
  int isDay;
  List everyhour;

  WeatherData(
      {required this.date,
      required this.temp,
      required this.lastupdate,
      required this.condition,
      required this.maxtemp,
      required this.mintemp,
      required this.location,
      required this.region,
      required this.everyhour,
      required this.isDay,
      required this.conditionCode,
      required this.moonillumination,
      required this.moonphase,
      required this.moonrise,
      required this.moonset,
      required this.sunrise,
      required this.sunset});

  factory WeatherData.fromJson(Map<String, dynamic> data) {
    List temp = [];
    List path = data['forecast']['forecastday'][0]['hour'];
    //get weather for every hour..!
    for (var i = 0; i < 24; i++) {
      temp.add({
        'time': path[i]['time'],
        'temp': path[i]['temp_c'],
        'is_day': path[i]['is_day'],
        'condition': path[i]['condition']['text'],
        'conditionCode': path[i]['condition']['code']
      });
    }
    // print(temp);
    //
    //forecast.forecastday[0].astro
    Map astro = data['forecast']['forecastday'][0]['astro'];
    return WeatherData(
      date: data['location']['localtime'],
      temp: data['current']['temp_c'],
      lastupdate: data['current']['last_updated'],
      condition: data['current']['condition']['text'],
      maxtemp: data['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: data['forecast']['forecastday'][0]['day']['mintemp_c'],
      location: data['location']['name'],
      region: data['location']['region'],
      everyhour: temp,
      isDay: data['current']['is_day'],
      //astro
      moonillumination: astro['moon_illumination'],
      moonphase: astro['moon_phase'],
      moonrise: astro['moonrise'],
      moonset: astro['moonset'],
      sunrise: astro['sunrise'],
      sunset: astro['sunset'],
      conditionCode: data['current']['condition']['code'],
    );
  }
}
