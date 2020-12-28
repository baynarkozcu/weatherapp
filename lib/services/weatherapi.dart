import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weathermodel.dart';

class Services {
  static Future<WeatherModel> getWeather(String city) async {
    WeatherModel weatherModel;
    var url =
        "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=688ff65540c5e3ee6b1f5d641d2360d6&units=metric";

    var response = await http.get(url);

    var value = json.decode(response.body);

    weatherModel = WeatherModel.fromJson(value);

    return weatherModel;
  }
}
