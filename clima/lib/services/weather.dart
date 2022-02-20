import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';

class WeatherModel {
  double? _longitude;
  double? _latitude;
  Location location = Location();

  String apiKey = "9b7750dcbc802f742ea80fbbaf68591a";
  Future getCityWeather(String cityName) async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
    var data = await NetworkHelper(url).getData();
    return data;
  }

  Future getLocation() async {
    await location.getCurrentLocation();
    _longitude = location.longitude;
    _latitude = location.latitude;
  }

  Future<dynamic> getLocationData() async {
    await getLocation();
    NetworkHelper helper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=${_latitude}&lon=${_longitude}&appid=$apiKey&units=metric");

    var data = await helper.getData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
